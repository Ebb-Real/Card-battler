class WinScreen implements GameState{

  WinScreen() {
  }

  void draw() {
    background(0, 0, 0);
    textSize(width/50);
    text("You Win, Wow!!", width/2, height/2);
  }
}
