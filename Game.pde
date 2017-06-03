
class Game {
  Team t1, t2;
  public Map map;
  
  Game(){
    t1 = new Team(color(30, 240, 40));
    t2 = new Team(color(240, 30, 40));
    map = new Map(20, 20);
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