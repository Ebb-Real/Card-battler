import controlP5.*;
import java.util.Collections;
GameStateManager manager;

ControlP5 cp5;
controlP5.Button b1, b2, sb, menuButton, menuButton2;

PImage bg;

int startTid;
int displayTid = 3000;
boolean displayTekstEmptyDeck, displayTekstNoMana, displayTekstMaxHand;

int deckLength;

//integers and arraylists
ArrayList<Card> deck = new ArrayList<Card>();
boolean gameDisplay = false;

//create CardCreator object
CardCreator cardCreator = new CardCreator();

//create Mana Object
Mana playerMana = new Mana(10, 1, 1);

//create hand object
Hand playerHand = new Hand(7, 3);

//create enemy object
Enemy enemy = new Enemy(10, 15, 1, 3, 1, 3, 3, 5);

//create Health object
Health playerHealth = new Health(10, 10);

//create play area object
PlayArea mainPlayArea = new PlayArea(width*8, height*4);

void setup() {
  fullScreen();
  
  bg = loadImage("kiryu.png");
  bg.resize(width, height);

  manager = new GameStateManager();

  manager.tilFoejGameState("mainScreen", new MainScreen());
  manager.tilFoejGameState("gameScreen", new GameScreen());
  manager.tilFoejGameState("gameOverScreen", new GameOverScreen());
  manager.tilFoejGameState("winScreen", new WinScreen());
  manager.skiftGameState("mainScreen");

  //GUI
  cp5 = new ControlP5(this);

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

  //mana setup
  playerMana.currentMana = playerMana.startingMana;
}

void draw() {
  image(bg, 0, 0);
  manager.draw();
}

void cardDraw() {
  if (deck.size() <= 0) {
    deckEmpty();
    return;
  }
  playerHand.addCard(deck.get(0));
  deck.get(0).imageLoader();
  deck.remove(0);
}

void deckEmpty() {
  displayTekstEmptyDeck = true;
  startTid = millis();
}

void noMana() {
  displayTekstNoMana = true;
  startTid = millis();
}

public void controlEvent(ControlEvent theEvent) {
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

ArrayList<Card> heldCard = new ArrayList<Card>();

void mouseDragged() {
  for (int i = 0; i < playerHand.handCards.size(); i++) {
    
    //if mouse over card
    if (mouseX <= playerHand.handCards.get(i).posX + playerHand.handCards.get(i).cardLength / 2
    && mouseX >= playerHand.handCards.get(i).posX - playerHand.handCards.get(i).cardLength / 2
    && mouseY <= playerHand.handCards.get(i).posY + playerHand.handCards.get(i).cardHeight / 2
    && mouseY >= playerHand.handCards.get(i).posY - playerHand.handCards.get(i).cardHeight / 2) {
      
      if (heldCard.size() <= 0) {
        heldCard.add(playerHand.handCards.get(i));
      }
      if (heldCard.get(0) == playerHand.handCards.get(i)) {
        playerHand.handCards.get(i).grabbed = true;
        playerHand.handCards.get(i).posX = mouseX;
        playerHand.handCards.get(i).posY = mouseY;
      }
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < playerHand.handCards.size(); i++) {
    playerHand.handCards.get(i).grabbed = false;
  }
  
  //if mouse over play area
  if (mouseX <= mainPlayArea.posX + mainPlayArea.sizeX / 2
  && mouseX >= mainPlayArea.posX - mainPlayArea.sizeX / 2
  && mouseY <= mainPlayArea.posY + mainPlayArea.sizeY / 2
  && mouseY >= mainPlayArea.posY - mainPlayArea.sizeY / 2
  && heldCard.size() > 0) {
    
    heldCard.get(0).play();
    if (heldCard.get(0).canAfford) {
      for (int i = 0; i < playerHand.handCards.size(); i++) {
        if (playerHand.handCards.get(i) == heldCard.get(0)) {
          playerHand.handCards.remove(i);
        }
      }
    }
    heldCard.remove(0);
  }
  if (heldCard.size() > 0) {
    heldCard.remove(0);
  }
}

void gameStartup() {
  sb.hide();
  
  //deck
  cardCreator.Create("claw", 3);
  cardCreator.Create("dagger", 3);
  cardCreator.Create("siphon blood", 2);
  cardCreator.Create("fire sword", 1);
  cardCreator.Create("healing hands", 3);
  cardCreator.Create("mana vial", 2);
  cardCreator.Create("flaming mana", 1);
  Collections.shuffle(deck);

  //ui load
  playerHealth.load();
  enemy.enemyLoad();
  playerHand.load();
  playerMana.load();

  playerMana.activeMana=playerMana.currentMana;
  enemy.intent();
}
