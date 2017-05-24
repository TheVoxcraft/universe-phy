ArrayList<Atom> atoms = new ArrayList<Atom>();

Physics phy = new Physics(10); // Universe Physics

void setup(){
  size(800,600);
  frameRate(100000);
  for(int i=0; i < 100; i++){
    atoms.add(new Atom(new PVector(random(width), random(height)), 1));
  }
}

void draw(){
  background(50);
  phy.update(atoms);
}