class Map{
  int w, h;
  private int w_size, h_size;
  color c1, c2;
  Location[][] locations;
 
  Map(){
    this(width, height);
  }
  Map(int w, int h){
    this.w = w;
    this.h = h;
    w_size = width/w;
    h_size = height/h;
    init();
  }
  
  private void init(){
    locations = new Location[h][w];
    for(int i=0; i<h; i++)
      for(int j=0; j<w; j++)
        locations[i][j] = new Location( random(1)<ENERGY_SOURCE_PROB );
  }
  
  void clearLocs(){
    for(int i=0; i<h; i++)
      for(int j=0; j<w; j++)
        locations[i][j].clearList();
  }

  void display(){
    stroke(240);
    
    //draw energy sources
    pushStyle();
    noStroke();
    fill(10, 230, 230); //cyan
    for(int i=0; i<h; i++)
      for(int j=0; j<w; j++){
        if(locations[i][j].isEnergySource)
          rect(j*w_size , i*h_size , w_size, h_size);
      }
    popStyle();
    
    
    ///draw grid
    for(int y=0; y<h; y++){
      line(0, y*h_size, width, y*h_size);
    }
    for(int x=0; x<w; x++){
      line(x*w_size, 0, x*w_size, height);
    }
    
    
    
  }
}