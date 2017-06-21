
class Game {
  Team t1, t2;
  Team[] teams;
  public Map map;
  public static final int COLUMNS = 20;
  public static final int ROWS = 20;
  public static final int nTeams = 2;
  
  Game(){
    teams = new Team[nTeams];
    teams[0] = new Team(0, color(30, 240, 40));
    teams[1] = new Team(1, color(240, 30, 40));
    map = new Map(COLUMNS, ROWS);
  }
  
  void run(){
    update();
    display();
  }
  
  void update(){
    
    map.clearLocs();
    
    for(Team t : teams)
      t.update();
    
  }
  
  void display(){
    
    map.display();
    
    for(Team t : teams)
      t.display();
    
  }
  
}