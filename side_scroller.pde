Player player;
Obstacle[] obstacles= new Obstacle[6];
PImage[] stickman = new PImage[9];
boolean flying=false;
float scoreNumber=0;
float frame=0;
PImage blackHole;
void setup() {
  size(1000, 500);
  frameRate(60);

  //fullScreen();
  player =new Player();

  for (int i=0; i<obstacles.length; i++) {

    float x=1000+random(200);

    if (i!=0) {
      x=obstacles[i-1].position.x+random(150, 450);
    }
    //PVector temp = new PVector(x, height);
    float r=random(25, 40);
    obstacles[i]=new Obstacle(r, new PVector(x, height-r));
  }
  for (int i=0; i<stickman.length; i++) {
    stickman[i] = loadImage("frame_"+i+"_delay-0.05s.gif");
  }
  //for (int i=0; i<blackHole.length; i++) {
  //  blackHole[i] = loadImage("Hole_"+i+".gif");
  //}
  blackHole = loadImage("blackhole.png");
}


void draw() {

  background(255);
  scoreNumber+=0.1;
  PVector gravity = new PVector(0, 0.3);
  player.applyForce(gravity);
  player.update();
  translate(50-player.position.x, 0);
  player.checkEdges();

  showScore(player.position.x-player.w);
  playerAnimation();
  
  int i;
  for (i=0; i<obstacles.length; i++) {
    float origin=player.position.x-player.w;
    obstacles[i].display();
    //obstacleAnimation(i);
    obstacles[i].update(player);
    if (obstacles[i].hitPlayer(player)) {
      gameOver(origin);
      noLoop();
      break;
    }
  }
}
void keyPressed() {
  if (key == ' ' && !flying ) {
    PVector jump=new PVector(0, -10);
    player.applyForce(jump);
    flying=true;
  } else if (key == 'c' && flying) {
    PVector sweepDown=new PVector(0, 3);
    player.applyForce(sweepDown);
  }
}
void gameOver(float origin) {
  
  background(0);
  textSize(180);
  fill(255, 0, 0);
  String gameover="Game Over";
  float gameoverWidth=textWidth(gameover);
  text(gameover, origin+width/2-gameoverWidth/2, height*2/5); 
  textSize(140);
  fill(255);
  String score="Score is "+ (int) scoreNumber;
  float scoreWidth=textWidth(score);
  text(score, origin+width/2-scoreWidth/2, height*5/6);
}
void playerAnimation() {
  if (frame<stickman.length) {
    player.display(floor(frame));
    frame+=(player.velocity.x*(0.08));
  } else {
    frame=0;
    player.display(floor(frame));
  }
}
void showScore(float origin) {
  textSize(30);
  fill(0);
  String score="Score: "+ (int) scoreNumber;
  float scoreWidth=textWidth(score);
  text(score, origin+width-scoreWidth, 30);
}
//void obstacleAnimation(int i) {

//  if (obstacles[i].frame<blackHole.length) {
//    obstacles[i].display();
//    obstacles[i].frame+=(0.3);
//  } else {
//    obstacles[i].frame=0;
//    //obstacles[i].display();
//  }
//}
