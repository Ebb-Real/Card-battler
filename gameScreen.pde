class GameScreen extends GameState {
  PImage ancientClock;

  GameScreen() {
    ancientClock = loadImage("ancient_clock.png");
    ancientClock.resize(width, height);
  }

  void draw() {
    imageMode(NORMAL);
    image(ancientClock, 0, 0);
    playerHand.update(); //<>//
    playerHealth.ui(); //<>//
    enemy.enemyUI(); //<>//
    playerMana.ui();
    for (int i = 0; i <= playerHand.handCards.size() - 1; i++) {
      playerHand.handCards.get(i).draw();
    }
  }
}
