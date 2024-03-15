//base for cards
class Card {
  String navn;
  int mana;
  boolean minion;
  int power;
  int health;
  int damage;
  int heal;
  float posX;
  float posY;
  int cardLength = 150;
  int cardHeight = 225;

  void draw() {
    rectMode(CENTER);
    rect(posX, posY, cardLength, cardHeight, 15);
  }
}
