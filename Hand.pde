class Hand {
  int handLimit;
  int startingHandsize;
  boolean handIsFull = false;
  ArrayList<Card> handCards = new ArrayList<Card>();

  Hand(int handLimitInput, int startingHandsizeInput) {
    handLimit = handLimitInput;
    startingHandsize=startingHandsizeInput;
  }

  void update() {
    for (int i = 0; i <= handCards.size() - 1; i++) {
      if (!handCards.get(i).grabbed) {
        handCards.get(i).posX = width/2 - handCards.get(i).cardLength * handCards.size()/2 + i * handCards.get(i).cardLength+handCards.get(i).cardLength/2;
        handCards.get(i).posY = height/1.4;
      }
    }
  }

  void addCard(Card c) {
    if (handCards.size() < handLimit) {
      handIsFull = false;
      handCards.add(c);
    } else {
      handIsFull = true;
    }
  }
  
  void load() {
    for (int i = 0; i<startingHandsize; i++) {
      deck.get(0).imageLoader();
      addCard(deck.get(0));
      deck.remove(0);
    }
  }
}
