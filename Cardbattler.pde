import controlP5.*;
import java.util.Collections;
GameStateManager manager;

ControlP5 cp5;
controlP5.Button b1, b2;


//integers and arraylists
ArrayList<Card> deck = new ArrayList<Card>();
boolean gameDisplay = false;

//create CardCreator object
CardCreator cardCreator = new CardCreator();

//create Mana Object
Mana playerMana = new Mana(10, 1, 1);

//create hand object
Hand playerHand = new Hand(10,3);

//create enemy object
Enemy enemy= new Enemy(10, 15, 1, 3, 1, 3, 3, 5);

//create Health object
Health playerHealth= new Health(10, 10);


void setup() {

  manager = new GameStateManager();

  manager.tilFoejGameState("mainScreen", new MainScreen());
  manager.tilFoejGameState("gameScreen", new GameScreen());
  manager.skiftGameState("mainScreen");
  

  //GUI
  cp5 = new ControlP5(this);
  cp5.addButton("colorA")
    .setPosition(100, 100)
    .setSize(200, 19)
    ;

  PImage[] imgs = {loadImage("bruh2.png"), loadImage("bruh3.jpg"), loadImage("bruh4.png")};
  b1 = cp5.addButton("drawKort")
    .setPosition(140, 300)
    .setImages(imgs)
    .updateSize()
    ;
  b1.hide();

  PImage[] imgs2 = {loadImage("End Turn2.png"), loadImage("End Turn2.jpg"), loadImage("End Turn3.png")};
  b2 = cp5.addButton("Endturn")
    .setPosition(600, 300)
    .setImages(imgs2)
    .updateSize()
    ;
  b2.hide();


  fullScreen();





  //mana setup
  playerMana.currentMana=playerMana.startingMana;
}

void draw() {
  background(0, 0, 255);
  manager.draw();
}

void cardDraw() {
  if (deck.size()<=0) {
    deckEmpty();
    return;
  }
  if (playerHand.handIsFull) {
    handFull();
    return;
  }
  playerHand.addCard(deck.get(0));
  deck.get(0).imageLoader();
  deck.remove(0);
}

void deckEmpty() {
  println("Deck is empty");
}

void handFull() {
  println("Hand is full");
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
}
 //<>//
//function colorA will receive changes from
//controller with name colorA
public void colorA() {
  println("a button event from colorA: ");
  println("heh");
  gameDisplay = true;
  showButton(); //<>//
  gameStartup();

  manager.skiftGameState("gameScreen");
}

//function colorB will receive changes from
//controller with name colorB
public void colorB() {
  println("a button event from colorB: ");
}

//function colorC will receive changes from
//controller with name colorC
boolean drawn=false;
public void drawKort() {
  if (drawn==false) {
    println("a button event from colorC: ");
    cardDraw();
    drawn=true;
  }
}

void showButton() {

  if (gameDisplay == true) {
    b1.show();
    b2.show();
  }
}

boolean playerturn=true;
public void Endturn() {
  playerturn=false;

  //mana crystal increase
  playerMana.manaIncrease(playerMana.addedManaPerRound);
  //Mana crystal refresh/start of turn set mana
  playerMana.activeMana=playerMana.currentMana;

  println("MANA STUFF DONT LOOK YOU WEIRDO " + playerMana.currentMana);
  enemy.enemyTurn();
  enemy.intent();
  drawn=false;
  println("a button event from Endturn: ");
  println("health = " + playerHealth.currentHealth);
}

boolean grabbing=false;
void mouseDragged() {
  for (int i = 0; i < playerHand.handCards.size(); i++) {
    if (mouseX <= playerHand.handCards.get(i).posX + playerHand.handCards.get(i).cardLength / 2 && mouseX >= playerHand.handCards.get(i).posX - playerHand.handCards.get(i).cardLength / 2 && mouseY <= playerHand.handCards.get(i).posY + playerHand.handCards.get(i).cardHeight / 2 && mouseY >= playerHand.handCards.get(i).posY - playerHand.handCards.get(i).cardHeight / 2 && grabbing==false) {
      playerHand.handCards.get(i).grabbed = true;
      playerHand.handCards.get(i).posX = mouseX;
      playerHand.handCards.get(i).posY = mouseY;
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < playerHand.handCards.size(); i++) {
    playerHand.handCards.get(i).grabbed = false;
  }
}


void gameStartup() {
  
    //deck
  cardCreator.Create("claw");
  cardCreator.Create("claw");
  cardCreator.Create("healing hands");
  cardCreator.Create("claw");
  cardCreator.Create("healing hands");
  Collections.shuffle(deck);
   //<>//
  
  //ui load
playerHealth.load();  
enemy.enemyLoad();
playerHand.load();
  

  
  enemy.intent();
}
