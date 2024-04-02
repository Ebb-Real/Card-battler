class GameScreen extends GameState {
  //Background
  PImage ancientClock;
  
  GameScreen() {
    ancientClock = loadImage("ancient_clock.png");
    ancientClock.resize(3000,1800);
  }
  
  void draw() {
    imageMode(NORMAL);
    image(ancientClock, 0, 0);
    playerHand.update();
    
    for (int i = 0; i <= playerHand.handCards.size() - 1; i++) {
      playerHand.handCards.get(i).draw();
    }
  }
}
