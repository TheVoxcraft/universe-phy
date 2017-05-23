ArrayList<Atom> atoms = new ArrayList<Atom>();

Physics phy = new Physics(.01); // Universe Physics

void setup(){
  size(800,600);
  frameRate(30);
  
  atoms.add(new Atom(new PVector(200, 200), 10));
  atoms.add(new Atom(new PVector(550, 300), 10));
  
  fill(255);
}

void draw(){
  background(50);
  phy.update(atoms);
  atoms.get(0).applyForce(new PVector(.4, .2));
  atoms.get(1).applyForce(new PVector(.3, .5));
}