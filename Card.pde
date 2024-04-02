//base for cards //<>// //<>// //<>//
class Card {
  String name;
  String description;
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
    textAlign(CENTER);
    rect(posX, posY, cardLength, cardHeight, 15);
    push();
    fill(0);
    rect(posX, posY - cardHeight/5, cardLength - 20, cardHeight / 3);
    image(cardPicture, posX, posY - cardHeight/5);
    textSize(20);
    text(name, posX, posY - cardHeight/2.4);
    textSize(15);
    text(description, posX, posY + cardHeight/30);
    textSize(15);
    text(Integer.toString(mana),posX+cardLength/2-10,posY-cardHeight/2+10);
    pop();
  }
  void Play() {
    playerMana.manaSpend(mana);
    enemy.enemyHurt(damage);
    playerHealth.playerHeal(heal);
  }

  void imageLoader() {
    cardPicture = loadImage(cardPictureFile);
    cardPicture.resize(cardLength - 20, cardHeight / 3);
  }
}
