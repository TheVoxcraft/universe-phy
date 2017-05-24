class Atom{
  PVector position;
  PVector velocity;
  PVector acc;
  float mass;
  int displaySize = 5;
  
  Atom(PVector _pos, int _mass){
    position = _pos;
    mass = _mass;
    velocity = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  PVector getPos(){
    return position;
  }
  
  void update(){
    updateGraphics();
    updatePhysics();
    checkEdges();
    
  }
  
  void updatePhysics(){
    acc.limit(2);
    velocity.add(acc);
    position.add(velocity);
    acc = new PVector(0, 0);
  }
  
  void updateGraphics(){
    drawForce();
    fill(255);
    noStroke();
    ellipse(position.x, position.y, displaySize, displaySize);
  }
  
  void drawForce(){
    pushMatrix();
    translate(position.x, position.y);
    stroke((255+50)/2,(111+50)/2,0);
    strokeWeight(1.5);
    PVector a = acc.copy();
    PVector drawVector = a;
    drawVector.mult(40000);
    drawVector.limit(100);
    line(0,0,drawVector.x,drawVector.y);
    popMatrix();
  }
  
  void applyForce(PVector force){
    acc = force;
  }
  
  void checkEdges(){
    if(position.x > width){
      position.x = width;
      velocity.x *= -1;
    }
    if(position.y > height){
      position.y = height;
      velocity.y *= -1;
    }
    if(position.x < 0){
      position.x = 0;
      velocity.x *= -1;
    }
    if(position.y < 0){
      position.y = 0;
      velocity.y *= -1;
    }
  }
}
