class Team{
  int id;
  ArrayList<Cell> cells;
  color teamColor;
  
  Team(int id, color c){
    this.id = id;
    cells = new ArrayList<Cell>();
    //add two cells for debbuging
    cells.add( new Cell(id) );
    cells.add( new Cell(id) );
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