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
  
  void update(float delta){
    updateGraphics();
    updatePhysics(delta);
    checkEdges();
    
  }
  
  void updatePhysics(float delta){
    acc.limit(2);
    velocity.add(acc);
    position.add(PVector.mult(velocity, delta));
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
    stroke(0,(111+50)/2,(255+50)/2);
    strokeWeight(1.5);
    PVector a = velocity.copy();
    PVector drawVector = a;
    drawVector.mult(20000);
    drawVector.limit(10);
    line(0,0,drawVector.x,drawVector.y);
    
    stroke((255+50)/2,(111+50)/2,0);
    a = acc.copy();
    drawVector = a;
    drawVector.mult(40000);
    drawVector.limit(100);
    line(0,0,drawVector.x,drawVector.y);
    popMatrix();
  }
  
  void applyForce(PVector force){
    acc = PVector.div(force, mass);
  }
  
  void checkEdges(){
    if(position.x > width){
      position.x = width;
      velocity.x *= -.9;
    }
    if(position.y > height){
      position.y = height;
      velocity.y *= -.9;
    }
    if(position.x < 0){
      position.x = 0;
      velocity.x *= -.9;
    }
    if(position.y < 0){
      position.y = 0;
      velocity.y *= -.9;
    }
  }
}