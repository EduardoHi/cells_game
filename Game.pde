
class Game {
  Team t1, t2;
  public Map map;
  public static final int COLUMNS = 20;
  public static final int ROWS = 20;
  
  Game(){
    t1 = new Team(color(30, 240, 40));
    t2 = new Team(color(240, 30, 40));
    map = new Map(COLUMNS, ROWS);
  }
  
  void run(){
    update();
    display();
  }
  
  void update(){
    
    t1.update();
    t2.update();
    
  }
  
  void display(){
    
    t1.display();
    t2.display();
    map.display();
    
  }
  
}