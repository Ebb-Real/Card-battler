//base for cards
class Card {
  String name;
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
  boolean grabbed = false;
  PImage cardPicture;
  String cardPictureFile = "bruh2.png";

  Card() {
  }

  void draw() {
    rectMode(CENTER);
    imageMode(CENTER);
    rect(posX, posY, cardLength, cardHeight, 15);
    image(cardPicture, posX, posY - cardHeight/5);
  }
  void Play() {
    playerMana.manaSpend(mana);
    enemy.enemyHurt(damage);
    playerHealth.playerHeal(heal);
  }

  void imageLoader() {
    cardPicture = loadImage(cardPictureFile);
    cardPicture.resize(cardLength - 10, cardHeight / 3);
  }
}
