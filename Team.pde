class Team{
  int id;
  ArrayList<Cell> cells;
  private ArrayList<Cell> newCells;
  private color teamColor;
  private int cellIndex = 0;
  
  Team(int id, color c){
    this.id = id;
    cells = new ArrayList<Cell>();
    newCells = new ArrayList<Cell>();
    //add two cells for debbuging
    cells.add( new Cell(cellIndex++, id) );
    teamColor = c;
  }
  
  void update(){
    
    String[] options = {"WAIT", "DUPLICATE", "MOVE N", "MOVE S", "MOVE E", "MOVE W"}; //test array
    //for each cell choose a random option for debugging purposes and send that choice to the behavior of that cell
    for(Cell c : cells){
      String option = options[(int)random(6)];
      c.behavior(option);
    }
    
    //add newCells to list
    cells.addAll(newCells);
    //clear newCells to avoid duplicates
    newCells.clear();
    
    //add cells to locations in the map
    for(Cell c : cells){
      Location l = g.map.locations[c.y][c.x]; 
      l.addCell(c);
      if(l.isEnergySource)
        c.feed();
    }
    
    
  }
  
  //void output
  
  void addCell(int energy, int x, int y){
    newCells.add( new Cell(cellIndex++, id, energy, x, y) );
  }
  
  void display(){
    noStroke();
    fill(teamColor);
    for(Cell c : cells){
      pushMatrix();
      
      // !!! hardcoded values for now !!!
      translate(c.x*40 + 20.5, c.y*40 + 20.5);
      
      ellipse(0, 0, 39, 39);
      popMatrix();
    }
  }


}