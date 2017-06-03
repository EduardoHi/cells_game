
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
       case NORTH: if(y > 0) return true; else return false; 
       case SOUTH: if(y < Game.ROWS-1) return true; else return false;
       case EAST: if(x < Game.COLUMNS-1) return true; else return false;
       case WEST: if(x > 0) return true; else return false;
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