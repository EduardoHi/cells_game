class Map{
  int w, h, w_size, h_size;
  color c1, c2;
 
  Map(){
    this(width, height);
  }
  Map(int w, int h){
    this.w = w;
    this.h = h;
    w_size = width/w;
    h_size = height/h;
  }

  void display(){
    stroke(240);
    
    for(int y=0; y<h; y++){
      line(0, y*h_size, width, y*h_size);
    }
    for(int x=0; x<w; x++){
      line(x*w_size, 0, x*w_size, height);
    }
  }
}