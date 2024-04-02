class GameScreen extends GameState {
  
  void draw() {
    background(0, 255, 255);
    playerHand.draw();
    
    for (int i = 0; i <= playerHand.handCards.size() - 1; i++) {
      playerHand.handCards.get(i).draw();
    }
  }
}
