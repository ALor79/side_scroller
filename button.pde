class ResetButton {
  PVector pos;
  PVector size;
  ResetButton(PVector s) {
    size=s;
    pos=new PVector(width/2-size.x/2, height*3.0/4);
  }
  void clicked(float x, float y) {

    if (inThis(x, y)) {
      loop();
      restartGame();
    }
  }
  boolean inThis(float x, float y) {

    float thisLeft=pos.x;
    float thisRight=pos.x+size.x;
    if (x<thisRight&&x>thisLeft) {//seeing if the x of mouse is in the box

      float thisUp=pos.y;
      float thisDown=pos.y+size.y;
      if (y<thisDown&&y>thisUp) {//seeing if the y of mouse is in the box
        return true;
      }
    }
    return false;
  }
  void show(float x) {
    fill(80);
    rect(x+pos.x, pos.y, size.x, size.y);
    String s="Restart";
    fill(255);  
    float Size=1.5*(size.x/s.length());
    textSize(Size);
    redraw();
    float sWidth=textWidth(s);
    float sHeight=textAscent();
    text(s, x+pos.x+size.x/2-sWidth/2, pos.y+size.y/2+sHeight/2/2);
  }
  void restartGame() {
    finished=false;
    flying=false;
    scoreNumber=0;
    frame=0;
    player =new Player();
    for (int i=0; i<obstacles.length; i++) {

      float x=width+random(200);

      if (i!=0) {
        x=obstacles[i-1].position.x+random(150, 450);
      }
      float r=random(25, 40);
      obstacles[i]=new Obstacle(r, new PVector(x, height-r));
    }
  }
}
