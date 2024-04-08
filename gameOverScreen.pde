class GameOverScreen implements GameState {

  GameOverScreen() {
  }

  void draw() {
    background(0, 0, 0);
    text("Game Over", width/2, height/2);
  }
}
