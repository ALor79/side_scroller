class Player {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float w;
  float h;

  Player() {
    w=50;
    h=70;
    position = new PVector(40, height);
    velocity = new PVector(3,0);
    acceleration = new PVector(0.01,0);
  }
  
  void applyForce(PVector force) {
    PVector f = force.copy();
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(0,127);
    rect(position.x,position.y-h,w,h);
  }

  void checkEdges() {

    if (position.y > height) {
      velocity.y *= 0;
      position.y = height;
      flying=false;
    }

  }

}
