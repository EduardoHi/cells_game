
class Cell{
 private int energy, x, y, teamId, id;
 
 Cell(int id, int teamId, int energy, int x, int y){
   this.id = id;
   this.teamId = teamId;
   this.energy = energy;
   this.x = x;
   this.y = y;
 }
 Cell(int id, int teamId){
   this.id = id;
   this.teamId = teamId;
   randomize();
 }
 
 void randomize(){
   energy = (int)random(MAX_ENERGY);
   x = (int)random(Game.COLUMNS);
   y = (int)random(Game.ROWS);
 }
 
 void behavior(String command){
   String[] splitted = split(command," ");
   
   //ERROR
   if(splitted.length == 0){
     print("ERROR invalid command");
     return;
   }
   
   //DEBUGGING
   if(energy<=0 ){
     return;
   }
   
   switch(splitted[0]){
     case("MOVE"):
       move( directions.choose(splitted[1]) );
       break;
     case("DUPLICATE"):
       duplicate();
       break;
     case("WAIT"):
       break;
   }
   
 }
 
 void duplicate(){
   energy -= DIVISION_COST;
   energy /= 2;
   g.teams[teamId].addCell( energy, x, y );
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
 
 void feed(){
   energy += ENERGY_RATE;
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