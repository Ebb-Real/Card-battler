class Hand {
  int handLimit;
  boolean handIsFull = false;
  ArrayList<Card> handCards = new ArrayList<Card>();

  Hand(int handLimitInput) {
    handLimit = handLimitInput;
  }

  void update() {
    if (handCards.size() < handLimit) {
      handIsFull = false;
    } else {
      handIsFull = true;
    }

    for (int i = 0; i <= handCards.size() - 1; i++) {
      if (!handCards.get(i).grabbed) {
        handCards.get(i).posX = width/2 - handCards.get(i).cardLength * handCards.size()/2 + i * handCards.get(i).cardLength;
        handCards.get(i).posY = height/1.25;
        if (handCards.size()>=4) {
          println(handCards.get(2).posX + " " + handCards.get(2).posX);
        }
      } else {
      }
    }
  }

  void addCard(Card c) {
    if (!handIsFull) {
      handCards.add(c);
    }
  }
}
