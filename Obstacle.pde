class Obstacle {
  PVector position;
  //float w;
  float radius;
  float frame;
  Obstacle(float r,PVector pos) {
    frame=0;
    radius=r;
    position = pos;
    //h=random(50, 85);
  }
  void display() {
    //stroke(0);
    //strokeWeight(0);
    //fill(250, 0, 0);
    ////ellipseMode(CENTER);
    //ellipse(position.x, position.y, radius*2, radius*2);
    imageMode(CENTER);
    image(blackHole, position.x, position.y,radius*2,radius*2);
  }

  boolean hitPlayer(Player player) {

    //float playerLeft = player.position.x;
    //float playerRight = player.position.x + player.w;
    //float thisLeft = position.x  ;
    //float thisRight = position.x + w;
    float d=dist(player.position.x, player.position.y, position.x, position.y);
    float d2=dist(player.position.x+player.w, player.position.y, position.x, position.y);
    if ((d<=radius+0.1 ) || (d2<=radius+0.1)) {
      return true;
    }

    return false;
  }
  void update(Player player) {
    float thisRight = position.x + radius;
    if (thisRight+player.w<player.position.x) {
      radius=random(25,40);
      position=new PVector(player.position.x+width+random(100), height-random(25,40));
    }
  }
}
