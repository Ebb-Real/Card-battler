class GUI {
 ControlP5 cp5;
 GUI(PApplet thePApplet){
   cp5 = new ControlP5(thePApplet);
   
     PImage[] imgs4 = {loadImage("start1.png"), loadImage("start2.png"), loadImage("start3.png")};
    for (int i = 0; i < imgs4.length; i = i +1 ) {
   imgs4[i].resize(width/6, height/6);
  }
  sb = cp5.addButton("StartGame")
    .setPosition(width/2 - 175, height/2 - 100)
    .setImages(imgs4)
    .updateSize()
    ;


  PImage[] imgs = {loadImage("Draw Card1.png"), loadImage("Draw Card2.png"), loadImage("Draw Card3.png")};
  for (int i = 0; i < imgs.length; i = i +1 ) {
   imgs[i].resize(width/12, width/12);
  }
  //imgs.resize(width/2, height/2);
  b1 = cp5.addButton("drawKort")
    .setPosition(350, height/1.2)
    .setImages(imgs)
    .updateSize()
    ;
  b1.hide();

  PImage[] imgs2 = {loadImage("End Turn1.png"), loadImage("End Turn2.png"), loadImage("End Turn3.png")};
    for (int i = 0; i < imgs2.length; i = i +1 ) {
   imgs2[i].resize(width/12, width/12);
  }
  b2 = cp5.addButton("Endturn")
    .setPosition(100, height/1.2)
    .setImages(imgs2)
    .updateSize()
    ;
  b2.hide();

  PImage[] imgs3 = {loadImage("Menubutton1.png"), loadImage("Menubutton2.png"), loadImage("Menubutton3.png")};
    for (int i = 0; i < imgs3.length; i = i +1 ) {
   imgs3[i].resize(width/6, height/8);
  }
  menuButton = cp5.addButton("menuButton")
    .setPosition(width - imgs3[1].width, 0)
    .setImages(imgs3)
    .updateSize()
    ;
  menuButton.hide();

  PImage[] imgs5 = {loadImage("Menubutton1.png"), loadImage("Menubutton2.png"), loadImage("Menubutton3.png")};
    for (int i = 0; i < imgs5.length; i = i +1 ) {
   imgs5[i].resize(width/6, height/8);
  }
  menuButton2 = cp5.addButton("menuButton2")
    .setPosition(width/2 - imgs5[1].width/2, height/1.8)
    .setImages(imgs5)
    .updateSize()
    ;
  menuButton2.hide(); 
 } 
}

//function colorA will receive changes from
//controller with name colorA
public void StartGame() {
  gameDisplay = true;
  showButton();
  gameStartup();

  manager.skiftGameState("gameScreen");
}

//function colorC will receive changes from
//controller with name colorC
boolean drawn = false;
public void drawKort() {
  if (drawn == false) {
    cardDraw();
    cardDraw();
    drawn = true;
  }
}

public void menuButton() {
  gameDisplay = false;
  showButton();
  deck.clear();
  playerHand.handCards.clear();
  enemy.currentEnemyHealth = enemy.enemyStartingHealth;
  playerHealth.currentHealth = playerHealth.startingHealth;
  playerMana.currentMana = playerMana.startingMana;
  imageMode(CORNER);
  manager.skiftGameState("mainScreen");
  sb.show();
}

public void menuButton2() {
  gameDisplay = false;
  showButton();
  deck.clear();
  playerHand.handCards.clear();
  enemy.currentEnemyHealth = enemy.enemyStartingHealth;
  playerHealth.currentHealth = playerHealth.startingHealth;
  playerMana.currentMana = playerMana.startingMana;
  imageMode(CORNER);
  manager.skiftGameState("mainScreen");
  sb.show();
  menuButton2.hide();
}

void showButton() {

  if (gameDisplay == true) {
    b1.show();
    b2.show();
    menuButton.show();
  } else {
    b1.hide();
    b2.hide();
    menuButton.hide();
  }
}

boolean playerturn = true;
public void Endturn() {
  playerturn = false;

  //mana crystal increase
  playerMana.manaIncrease(playerMana.addedManaPerRound);
  //Mana crystal refresh/start of turn set mana
  playerMana.activeMana = playerMana.currentMana;

  enemy.enemyTurn();
  enemy.intent();
  drawn = false;
}
