class Team{
  ArrayList<Cell> cells;
  color teamColor;
  
  Team(color c){
    cells = new ArrayList<Cell>();
    //add just one cell
    cells.add( new Cell() );
    teamColor = c;
  }
  
  void update(){
    
    for(Cell c : cells){
      c.behavior();
    }
    
  }
  
  void display(){
    noStroke();
    fill(teamColor);
    for(Cell c : cells){
      pushMatrix();
      translate(c.x*40, c.y*40);
      //hardcoded values for now
      rect(0, 0, 40, 40);
      popMatrix();
    }
  }


}