ArrayList<Atom> atoms = new ArrayList<Atom>();

Physics phy = new Physics(20); // Universe Physics

void setup(){
  size(800,600);
  frameRate(60);
  
  atoms.add(new Atom(new PVector(100, 100), 10));
  atoms.add(new Atom(new PVector(450, 200), 10));
  atoms.add(new Atom(new PVector(330, 400), 10));
  atoms.add(new Atom(new PVector(360, 530), 10));
  atoms.add(new Atom(new PVector(130, 40), 10));
}

void draw(){
  background(50);
  phy.update(atoms);
}
