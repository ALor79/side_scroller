Player player;
Obstacle[] obstacles= new Obstacle[6];
boolean flying=false;
PImage gameover;
float scoreNumber=0;
void setup() {
  //size(1000, 500);
  frameRate(60);

    fullScreen();
  player =new Player();
 
  for (int i=0; i<obstacles.length; i++) {

    float x=1000+random(200);

    if (i!=0) {
      x=obstacles[i-1].position.x+random(150, 450);
    }
    //PVector temp = new PVector(x, height);
    obstacles[i]=new Obstacle(new PVector(x, height));
  }
   gameover = loadImage("gameover.png");
}


void draw() {
  background(255);
  scoreNumber+=0.1;
  PVector gravity = new PVector(0, 0.3);

  player.applyForce(gravity);

  player.update();
  translate(50-player.position.x, 0);
  player.checkEdges();

  player.display();
  int i;
  for (i=0; i<obstacles.length; i++) {
    float origin=player.position.x-player.w;
    obstacles[i].display(); 
    obstacles[i].update(player);
    if (obstacles[i].hitPlayer(player)) {
      background(126);
      image(gameover, origin, 0,width,height);
      textSize(140);
      fill(255);
      String score="Score is "+ (int) scoreNumber;
      float textWidth=textWidth(score);
      text(score, origin+width/2-textWidth/2, height*5/6); 
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
  }else if(key == 'c' && flying){
    PVector sweepDown=new PVector(0, 15);
    player.applyForce(sweepDown);
    
  }
}
