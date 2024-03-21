class Hand {
  int handLimit;
  int handArea = width/4*3-width/4*1;
  ArrayList<Card> handCards = new ArrayList<Card>();

  Hand(int handLimitInput) {
    handLimit = handLimitInput;
  }

  void draw() {
      if (handCards.size() > 0) {
      if (width/2 - handCards.size() * handCards.get(0).cardLength/2 > width/4) {
        for (int i=0; i<=handCards.size()-1; i++) {
          fill (255, 0, 0);
          rect(width/2 - handCards.size() * handCards.get(i).cardLength/2 + i * handCards.get(i).cardLength - handCards.get(i).cardLength/2, height/4 * 3, handCards.get(i).cardLength, handCards.get(i).cardHeight + width/4);
        }
      }
      else {
        for (int i=0; i<=handCards.size()-1; i++) {
          fill (255, 0, 0);
          rect(width/4 * 2/handCards.size() * i + width/4 * 1 - handCards.get(i).cardLength/2, height/4 * 3, handCards.get(i).cardLength, handCards.get(i).cardHeight);
        }
      }
    }
    
    /*
    for (int i=0; i<=handCards.size()-1; i++) {
      handCards.get(i).posX = width/2;
      handCards.get(i).posY = height/2;
      handCards.get(i).draw();
    }
    */
  }
  
  /*
  if (handCards.size() > 0) {
      if (width/2 - handCards.size() * cardlength/2 > width/4) {
        for (int i=0; i<=handCards.size()-1; i++) {
          fill (255, 0, 0);
          rect(width/2 - handCards.size() * cardlength/2 + i * cardlength - cardlength/2, height/4 * 3, cardlength, cardheight + width/4);
        }
      }
      else {
        for (int i=0; i<=handCards.size()-1; i++) {
          fill (255, 0, 0);
          rect(width/4 * 2/handCards.size() * i + width/4 * 1 - cardlength/2, height/4 * 3, cardlength, cardheight);
        }
      }
    }
  */
  
  void addCard(Card c) {
    handCards.add(c);
    println(handCards.get(0).navn);
  }
}
