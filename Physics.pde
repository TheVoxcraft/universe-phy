class Physics{
  
  float forceMultiplier;
  float maxProximity = 6;
  float targetSimulationSpeed = 60;
  float deltaTime = 1;
  
  Physics(float _forceMultiplier){
    forceMultiplier = _forceMultiplier;
  }
  
  //PVector getRealForce(PVector pos1, PVector pos2, float _force){
  //  PVector real = pos1.sub(pos2);
  //  return real.mult(_force);
  //}
  
  //float getForce(float m1, float m2,float d){
  //  return ((m1*m2)/(d*d)) * forceMultiplier;
  //}
  
  float getDistance(PVector v1, PVector v2){ return v1.dist(v2);}
  
  //void updateAtomsGravity(ArrayList<Atom> atoms){
  //  for(int i = 0; i < atoms.size(); i++){
  //    for(int j = 0; j < atoms.size(); j++){
  //      if(i!=j){
  //        float d = getDistance(atoms.get(i).position, atoms.get(j).position);
  //        float m1 = atoms.get(i).mass;
  //        float m2 = atoms.get(j).mass;
  //        Atom atom = new Atom(atoms.get(i).position, (int)atoms.get(i).mass);
  //        float f = getForce(m1, m2, d);
  //        atom.force = getRealForce(atoms.get(i).position, atoms.get(j).position, f);
  //        atoms.set(i, atom);
  //      }
  //    }
  //  }
  //}
  
  void updateDeltaTime(){
    deltaTime = targetSimulationSpeed / frameRate;
  }
  
  void update(ArrayList<Atom> atoms){
    updateDeltaTime();
    for(int i = 0; i < atoms.size(); i++){
      atoms.get(i).update(deltaTime);  
    }
    universalgravity();
    text("FPS "+round(frameRate),5, 20);
  }
  
  void universalgravity(){
    for(int i = 0; i < atoms.size(); i++){
      for(int j = 0; j < atoms.size(); j++){
      if(getDistance(atoms.get(i).position, atoms.get(j).position) > maxProximity){
        PVector a1 = atoms.get(i).position.copy();
        PVector a2 = atoms.get(j).position.copy();
        float d = getDistance(a1, a2);
        PVector f = a2.sub(a1);
        float m2 = atoms.get(j).mass;
        f.normalize();
        f.mult(forceMultiplier/(d*d));
        f.limit(2);
        atoms.get(i).applyForce(PVector.mult(f, m2));
        }
      }
    }
  }
  
}