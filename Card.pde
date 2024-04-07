//base for cards
class Card {
  String name;
  String description;
  int manaCost;
  int manaAdd;
  int damage;
  int selfDamage;
  int heal;
  float posX;
  float posY;
  int cardLength = 250;
  int cardHeight = 375;
  boolean grabbed = false;
  boolean canAfford;
  PImage cardPicture;
  String cardPictureFile = "bruh2.png";

  PImage manaIcon;

  Card() {
    manaIcon = loadImage("manacrystal.png");
    manaIcon.resize(cardLength/5, cardHeight/5);
  }

  void draw() {
    rectMode(CENTER);
    textAlign(CENTER);
    imageMode(CENTER);
    rect(posX, posY, cardLength, cardHeight, 15);
    push();
    fill(0);
    rect(posX, posY - cardHeight/5, cardLength - 20, cardHeight / 3);
    image(cardPicture, posX, posY - cardHeight/5);
    textSize(30);
    text(name, posX, posY - cardHeight/2.4);
    fill(255, 0, 0);
    image(manaIcon, posX + cardLength / 2 - 27.5, posY - cardHeight/2 + 10);
    text(Integer.toString(manaCost), posX + cardLength / 2 - 26, posY - cardHeight / 2 + 20);
    fill(0);
    textSize(20);
    text(description, posX, posY + cardHeight/30);
    pop();
  }

  void play() {
    if(playerMana.activeMana >= heldCard.get(0).manaCost) {
      playerMana.manaSpend(manaCost);
      playerMana.manaIncrease(manaAdd);
      playerMana.manaGain(manaAdd);
      enemy.enemyHurt(damage);
      playerHealth.playerHeal(heal);
      playerHealth.playerHurt(selfDamage);
      canAfford = true;
    }
    else {
      canAfford = false;
    }
  }

  void imageLoader() {
    cardPicture = loadImage(cardPictureFile);
    cardPicture.resize(cardLength - 20, cardHeight / 3);
  }
}
