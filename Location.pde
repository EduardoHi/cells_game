class Location {
  ArrayList<Cell> cellsHere;
  boolean isEnergySource;

  Location(boolean isEnergySource){
    this.isEnergySource = isEnergySource;
    cellsHere = new ArrayList<Cell>();
  }
  
  void clearList(){
    cellsHere.clear();
  }
  void addCell(Cell c){
    cellsHere.add(c);
  }
  
}