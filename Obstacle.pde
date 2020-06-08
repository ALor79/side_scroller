class Obstacle{
    PVector position;
    float w;
    float h;
    
    Obstacle(PVector pos) {
    w=40;
    position = pos;
    h=random(50,85);
  }
    void display() {
    stroke(0);
    strokeWeight(0);
    fill(250,0,0);
    rect(position.x,position.y-h,w,h);
  }

    boolean hitPlayer(Player player) {

    float playerLeft = player.position.x;
    float playerRight = player.position.x + player.w;
    float thisLeft = position.x  ;
    float thisRight = position.x + w;

    if ((playerLeft<= thisRight && playerRight >= thisLeft ) || (thisLeft <= playerRight && thisRight >= playerLeft)) {
      float playerDown = height-player.position.y;
      float thisUp = h;
      if (playerDown <= thisUp) {
        return true;
        
      }
    }
    return false;
  }
  void update(Player player){
    float thisRight = position.x + w;
    if(thisRight+player.w<player.position.x){
      position=new PVector(player.position.x+width+random(100),height);
    }
    
  }
  
}
