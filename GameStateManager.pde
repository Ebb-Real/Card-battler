Boolean mainScreen;
class GameStateManager {
  HashMap<String, GameState> gameStates;
  GameState currentGameState = null;

  GameStateManager() {
    gameStates = new HashMap<String, GameState>();
  }

  void tilFoejGameState(String name, GameState state) {
    gameStates.put(name, state);
  }

  void skiftGameState(String name) {
    currentGameState = gameStates.get(name);
  }

  void draw() {
    currentGameState.draw();
  }
}
