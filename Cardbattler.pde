import controlP5.*;
GameStateManager manager;

ControlP5 cp5;
controlP5.Button b1, b2;

//integers and arraylists
ArrayList<Card> deck = new ArrayList<Card>();
boolean gameDisplay = false;

//create hand object
Hand playerHand = new Hand(10);

//create enemy object
Enemy enemy=new Enemy(); //<>//

//cards //<>//
Card claw, healingHands; //<>//
 //<>//
void setup() { //<>//
 //<>//
  manager = new GameStateManager(); //<>//
 //<>//
  manager.tilFoejGameState("mainScreen", new MainScreen()); //<>//
  manager.tilFoejGameState("gameScreen", new GameScreen()); //<>//
  manager.skiftGameState("mainScreen"); //<>//
 //<>//
  //card library //<>//
  claw = new BygCard().setNavn("Claw").setMana(3).setDamage(2).build(); //<>//
  healingHands = new BygCard().setNavn("Healing Hands").setMana(2).setHeal(1).build(); //<>//
 //<>//
  //GUI //<>//
  cp5 = new ControlP5(this); //<>//
  cp5.addButton("colorA") //<>//
    .setPosition(100, 100) //<>//
    .setSize(200, 19) //<>//
    ; //<>//
     //<>//
  PImage[] imgs = {loadImage("bruh2.png"), loadImage("bruh3.jpg"), loadImage("bruh4.png")}; //<>//
  b1 = cp5.addButton("drawKort") //<>//
    .setPosition(140, 300) //<>//
    .setImages(imgs) //<>//
    .updateSize()
    ;
    b1.hide();

  PImage[] imgs2 = {loadImage("bruh2.png"), loadImage("bruh3.jpg"), loadImage("bruh4.png")};
  b2 = cp5.addButton("Endturn")
    .setPosition(600, 300)
    .setImages(imgs2)
    .updateSize()
    ;
    b2.hide();

  fullScreen();
  deck.add(claw);
  deck.add(healingHands);
  deck.add(claw);
  deck.add(healingHands);
}

void draw() {
  background(0, 0, 255);
  manager.draw();
}

void cardDraw() {
  if (deck.size()>0) {
    playerHand.addCard(deck.get(0));
    deck.remove(0);
  } else {
    mill();
  }
}

void mill() {
  println("bruh");
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
  gameDisplay = true; //<>//
  showButton(); //<>//
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
  enemy.enemyTurn();
  drawn=false;
  println("a button event from Endturn: ");
}
