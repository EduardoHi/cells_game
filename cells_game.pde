Game g;
static final int MAX_ENERGY = 100;
static final int DIVISION_COST = 10;

void setup(){
  size(800, 800);
  
  //frame rate decrementado para simular más lento
  frameRate(2);
  
  g = new Game();
}

void draw(){
  background(0);
  
  g.run();
  
}