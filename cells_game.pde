Game g;
int MAX_ENERGY = 100;

void setup(){
  size(800, 800);
  
  g = new Game();
}

void draw(){
  background(0);
  
  g.run();
  
}