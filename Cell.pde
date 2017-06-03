
class Cell{
 int energy, x, y;
 
 Cell(){
   randomize();
 }
 
 void randomize(){
   energy = (int)random(MAX_ENERGY);
   //hardcoded values for now
   x = (int)random(Game.COLUMNS);
   y = (int)random(Game.ROWS);
 }
 
 void behavior(){
   move( directions.choose( (int)random(4) ) );
 }
 
 void move( directions dir ){
   if (isValid(dir)){
     switch (dir) {
       case NORTH: y--; break;
       case SOUTH: y++; break;
       case EAST: x++; break;
       case WEST: x--; break; 
       case ERROR: print("error"); break;
     }
   } else {
     behavior();
   }
 }
 
 boolean isValid(directions dir) {
   switch (dir) {
       case NORTH: return (y > 0);
       case SOUTH: return (y < Game.ROWS-1);
       case EAST: return (x < Game.COLUMNS-1);
       case WEST: return (x > 0);
       case ERROR: print("error"); return false; 
       default: return false;
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