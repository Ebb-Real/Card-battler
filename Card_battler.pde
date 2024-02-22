void setup() {
  fullScreen();
  deck.add(1);
  deck.add(3);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(3);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(1);
  deck.add(3);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(3);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(7);
  deck.add(7);
}

public int cardlength = 150;
public int cardheight = 300;
ArrayList deck = new ArrayList();
ArrayList hand = new ArrayList();
int handArea = width/4*3-width/4*1;

void draw() {
  funny();
  background(0, 0, 255);
  if (hand.size()>0) {
    if (width/2-hand.size()*cardlength/2>width/4) {
      for (int i=0; i<=hand.size(); i++) {
        fill (255, 0, 0);
        rect(width/2-hand.size()*cardlength/2+i*cardlength-cardlength/2, height/4*3, cardlength, cardheight+width/4);
      }
    }
    else {
      for (int i=0; i<=hand.size(); i++) {
        fill (255, 0, 0);
        rect(width/4*2/hand.size()*i+width/4*1-cardlength/2, height/4*3, cardlength, cardheight);
      }
    }
  }
}

void cardDraw() {
  if (deck.size()>0) {
    hand.add(deck.get(0));
    deck.remove(0);
  } else {
    mill();
  }
}
void mill() {
  println("bruh");
}
void funny() {
  if (mousePressed) {
    cardDraw();
  }
}

//  cardDraw();
//  if(deck.size()>0){
//  println("deck"+deck.get(0));
//}
//  if(hand.size()>0){
//   for (int i = 0; i < hand.size(); i++) {
//  println("hand"+hand.get(i));
//}
//}
