class GameScreen extends GameState {
  
  void draw() {
    image(ancientClock, 0, 0);
    playerHand.update();
    
    for (int i = 0; i <= playerHand.handCards.size() - 1; i++) {
      playerHand.handCards.get(i).draw();
    }
  }
}
