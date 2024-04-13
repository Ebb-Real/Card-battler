import controlP5.*;
GUI gui;
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
  gui = new GUI(this);
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
  for (int i = 0; i < heldCard.size(); i++) {
    heldCard.get(0).grabbed = false;
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
