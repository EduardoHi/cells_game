Game g;
final int MAX_ENERGY = 100;
final int DIVISION_COST = 10;
final float ENERGY_SOURCE_PROB = 0.05;

boolean debugView = false;
boolean paused = false;

void setup(){
  size(800, 800);
  
  //frame rate decrementado para simular más lento
  frameRate(2);
  
  g = new Game();
}

void draw(){
  background(0);
  
  if(!paused){
    //g.run();
    g.update();
  }
  g.display();
  
}

void keyPressed(){
  if(key == 'd')
    debugView = !debugView;
  else if(keyCode == ' ')
    paused = !paused;
}

void mouseClicked(){
  showLocInfo();
}

void showLocInfo(){
  int mx = mouseX/g.map.w_size;
  int my = mouseY/g.map.h_size;
  mx = max(min(mx,Game.COLUMNS),0);
  my = max(min(my,Game.ROWS),0);
  Location l = g.map.locations[mx][my];
  println("******************");
  for(Cell c : l.cellsHere){
    println("id: "+c.id + "\nenergy: "+c.energy + "\nteamId: "+c.teamId);
  }
  /*
  for(Team t : g.teams){
    for(Cell c : t.cells){
      if(c.x == mx && c.y == my)
        println("id: "+c.id + "\nenergy: "+c.energy + "\nteamId: "+c.teamId);
    }
  }*/
  
}