Map map;

void setup(){
  size(800, 800);
  
  map = new Map(10,10);
  background(0);
  stroke(240);
}

void draw(){
  map.display();
}