
class Cell{
 int energy, x, y,teamId;
 
 Cell(int teamId){
   this.teamId = teamId;
   randomize();
 }
 
 void randomize(){
   energy = (int)random(MAX_ENERGY);
   x = (int)random(Game.COLUMNS);
   y = (int)random(Game.ROWS);
 }
 
 void behavior(){
   //test array
   String[] options = {"N","S","E","W"};
   move( directions.choose( options[(int)random(4)] ) );
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
  NORTH("N"), SOUTH("S"), EAST("E"), WEST("W"), ERROR("?");
  
  private directions(String s){
    this.symbol = s;
  }
  
  final String symbol;
  
  static directions choose(String option){
    switch (option) {
     case "N": return NORTH;
     case "S": return SOUTH;
     case "E": return EAST;
     case "W": return WEST;
     default: return ERROR;
    }
  }
  
}