class GameScreen extends GameState {
  PImage ancientClock;

  GameScreen() {
    ancientClock = loadImage("ancient_clock.png");
    ancientClock.resize(width, height);
  }

  void draw() {
    imageMode(NORMAL);
    image(ancientClock, 0, 0);
    mainPlayArea.draw();
    playerHand.update();
    playerHealth.ui();
    enemy.enemyUI();
    playerMana.ui();
    for (int i = 0; i <= playerHand.handCards.size() - 1; i++) {
      playerHand.handCards.get(i).draw();
    }

    if (displayTekstEmptyDeck)
    {
      push();
      fill(209, 110, 77, 200);
      rect(width/2, height/2 - 20, 500, 150, 120);
      pop();
      text("Deck is empty!", width/2, height/2);
      // If the spent time is above the defined duration
      if (millis() - startTid > displayTid)
      {
        // Stop displaying the message, thus resume the ball moving
        displayTekstEmptyDeck = false;
      }
    }


    if (displayTekstNoMana)
    {
      push();
      fill(209, 110, 77, 200);
      rect(width/2, height/2 - 20, 650, 150, 120);
      pop();
      text("Not enough mana!", width/2, height/2);
      // If the spent time is above the defined duration
      if (millis() - startTid > displayTid)
      {
        // Stop displaying the message, thus resume the ball moving
        displayTekstNoMana = false;
      }
    }


    if (displayTekstMaxHand)
    {
      push();
      fill(209, 110, 77, 200);
      rect(width/2, height/2 - 20, 850, 150, 120);
      pop();
      text("Maximum hand reached!", width/2, height/2);
      // If the spent time is above the defined duration
      if (millis() - startTid > displayTid)
      {
        // Stop displaying the message, thus resume the ball moving
        displayTekstMaxHand = false;
      }
    }
    
    push();
    fill(27, 135, 56, 200);
    rect(650, height/1.1, 200, 75, 120);
    pop();
    deckLength = deck.size();
    textSize(20);
    text(deckLength, 650, height/1.08);
    text("Remaining Cards", 650, height/1.1);
    
  }
}
