
int MAX_ENERGY = 100;

void setup(){
  size(800, 800);
  
  //frame rate decrementado para simular más lento
  frameRate(5);
  
  g = new Game();
}

void draw(){
  background(0);
  
  g.run();
  
}