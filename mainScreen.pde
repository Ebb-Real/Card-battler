class MainScreen extends GameState {
  
  void draw(){
    playerHand.draw();
  }
  
  
  
  void skiftSkaerm(String s) {
    manager.skiftGameState(s);
  }
}
