
class Cell{
 int energy, x, y;
 
 Cell(){
   randomize();
 }
 
 void randomize(){
   energy = (int)random(MAX_ENERGY);
   //hardcoded values for now
   x = (int)random(20);
   y = (int)random(20);
 }
 
 void behavior(){
   move( directions.choose( (int)random(4) ) );
   println("( "+x+","+y+" )");
 }
 
 void move( directions dir ){
   switch (dir) {
     case NORTH: y--; break;
     case SOUTH: y++; break;
     case EAST: x++; break;
     case WEST: x--; break; 
   }
 }
}

enum directions {
  NORTH, SOUTH, EAST, WEST, ERROR;
  static directions choose(int i){
    switch (i) {
     case 0: return NORTH;
     case 1: return SOUTH;
     case 2: return EAST;
     case 3: return WEST;
     default: return ERROR;
    }
  }
}