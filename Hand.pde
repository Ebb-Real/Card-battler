class Hand {
  int handLimit;
  int handArea = width/4*3-width/4*1;
  ArrayList<Card> handCards = new ArrayList<Card>();

  Hand(int handLimitInput) {
    handLimit = handLimitInput;
  }

  void draw() {
    for (int i=0; i<=handCards.size()-1; i++) {
      handCards.get(i).posX = width/2;
      handCards.get(i).posY = height/2;
      handCards.get(i).draw();
    }
  }

  void addCard(Card c) {
    handCards.add(c);
    println(handCards.get(0).navn);
  }
}
