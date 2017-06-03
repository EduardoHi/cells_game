class Team{
  int id;
  ArrayList<Cell> cells;
  ArrayList<Cell> newCells;
  color teamColor;
  
  Team(int id, color c){
    this.id = id;
    cells = new ArrayList<Cell>();
    newCells = new ArrayList<Cell>();
    //add two cells for debbuging
    cells.add( new Cell(id) );
    cells.add( new Cell(id) );
    teamColor = c;
  }
  
  void update(){
    //test array
    String[] options = {"WAIT", "DUPLICATE", "MOVE N", "MOVE S", "MOVE E", "MOVE W"};
    for(Cell c : cells){
      String option = options[(int)random(6)];
      c.behavior(option);
    }
    
    //add newCells to list
    cells.addAll(newCells);
    //clear newCells to avoid duplicates
    newCells.clear();
  }
  
  void addCell(Cell c){
    newCells.add( c );
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