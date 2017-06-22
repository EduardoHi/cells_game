Game g;
final int MAX_ENERGY = 100;
final int DIVISION_COST = 10;
final int MOVE_COST = 1;
final float ENERGY_SOURCE_PROB = 0.05;
final int ENERGY_RATE = 5;

boolean debugView = false;
boolean paused = false;

void setup(){
  size(800, 800);
  
  //frame rate decrementado para simular más lento
  //frameRate(2);
  
  g = new Game();
}

void draw(){
  background(0);
  
  if(!paused){
    //g.run();
    if(frameCount%30 == 0)
      g.update();
  }
  g.display();
  
  if(debugView)
    showLocInfo();
  
  //println("fps: " + frameRate);
}

void showLocInfo(){
  int mx = mouseX/g.map.w_size;
  int my = mouseY/g.map.h_size;
  mx = max(min(mx,Game.COLUMNS),0);
  my = max(min(my,Game.ROWS),0);
  Location l = g.map.locations[my][mx];
  
  push();
  translate(mouseX, mouseY);
  if( width - mouseX < 180 ) translate(-180, 0);
  if( height - mouseY < 100 ) translate(0, -100);
  fill(255, 150);
  noStroke();
  rect(0, 0, 180, 100);
  stroke(20);
  
  fill(40, 20, 60);
  for(int i=0; i<l.cellsHere.size(); i++){
    translate( 0, 15);
    Cell c = l.cellsHere.get(i);
    String message = "id: "+c.id + " energy: "+c.energy + " teamId: "+c.teamId;
    text( message, 15, 0 );
  }
  
  pop();

}

void push(){
   pushMatrix();
   pushStyle();
}
void pop(){
  popMatrix();
  popStyle();
}

void keyPressed(){
  if(key == 'd' || key == 'D')
    debugView = !debugView;
  else if(keyCode == ' ')
    paused = !paused;
  else if(key == 'r' || key == 'R')
    g = new Game();
  else if(key == 'n' || key == 'N')
    g.update();
}