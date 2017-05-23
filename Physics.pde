class Physics{
  
  float forceMultiplier;
  
  Physics(float _forceMultiplier){
    forceMultiplier = _forceMultiplier;
  }
  
  PVector getRealForce(PVector pos1, PVector pos2, float _force){
    PVector real = pos1.sub(pos2);
    return real.mult(_force);
  }
  
  float getForce(float m1, float m2,float d){
    return ((m1*m2)/(d*d)) * forceMultiplier;
  }
  
  float getDistance(PVector v1, PVector v2){ return v1.dist(v2);}
  
  void updateAtomsGravity(ArrayList<Atom> atoms){
    for(int i = 0; i < atoms.size(); i++){
      for(int j = 0; j < atoms.size(); j++){
        if(i!=j){
          float d = getDistance(atoms.get(i).position, atoms.get(j).position);
          float m1 = atoms.get(i).mass;
          float m2 = atoms.get(j).mass;
          Atom atom = new Atom(atoms.get(i).position, (int)atoms.get(i).mass);
          float f = getForce(m1, m2, d);
          atom.force = getRealForce(atoms.get(i).position, atoms.get(j).position, f);
          atoms.set(i, atom);
        }
      }
    }
  }
  
  void update(ArrayList<Atom> atoms){
    for(int i = 0; i < atoms.size(); i++){
      atoms.get(i).update();
      //universalgravity();
    }
  }
  
  void universalgravity(){
    for(int i = 0; i < atoms.size(); i++){
      for(int j = 0; j < atoms.size(); j++){
      if(i!=j){
        PVector a1 = atoms.get(i).position;
        PVector a2 = atoms.get(j).position;
        PVector f = a2.sub(a1);
        f.normalize();
        f.mult(forceMultiplier);
        atoms.get(i).applyForce(f);
        }
      }
    }
  }
  
}