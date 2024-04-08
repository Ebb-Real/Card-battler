class MainScreen implements GameState{

  void draw() {
  }

  void skiftSkaerm(String s) {
    manager.skiftGameState(s);
  }
}
