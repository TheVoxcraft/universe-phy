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
    updatePhysics();
    checkEdges();
    updateGraphics();
    
  }
  
  void updatePhysics(){
    velocity.add(acc);
    position.add(velocity);
    acc = new PVector(0, 0);
  }
  
  void updateGraphics(){
    rect(position.x, position.y, displaySize, displaySize);
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