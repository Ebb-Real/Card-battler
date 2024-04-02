class Hand {
  int handLimit;
  float handPosX;
  float handPosY;
  ArrayList<Card> handCards = new ArrayList<Card>();

  Hand(int handLimitInput) {
    handLimit = handLimitInput;
    handPosX = width/2;
    handPosY = height/1.25;
  }

  void draw() {
    for (int i=0; i<=handCards.size()-1; i++) {
      handCards.get(i).posX = width/2 + i * 200 / handCards.size();
      handCards.get(i).posY = height/1.25;
      handCards.get(i).draw();
    }
  }

  void addCard(Card c) {
    handCards.add(c);
  }
}
