import controlP5.*;
GameStateManager manager;

ControlP5 cp5;

//integers and arraylists
public int cardlength = 150;
public int cardheight = 300;
ArrayList<Card> deck = new ArrayList<Card>();

//create hand object
Hand playerHand = new Hand(10);

//cards
Card claw, healingHands;

void setup() {
  //card library
  claw = new BygCard().setNavn("Claw").setMana(3).setDamage(2).build();
  healingHands = new BygCard().setNavn("Healing Hands").setMana(2).setHeal(1).build();
  
  //GUI
  cp5 = new ControlP5(this);
  cp5.addButton("colorA")
    .setValue(0)
    .setPosition(100, 100)
    .setSize(200, 19)
    ;

  PImage[] imgs = {loadImage("bruh2.png"), loadImage("bruh3.jpg"), loadImage("bruh4.png")};
  cp5.addButton("play")
    .setValue(128)
    .setPosition(140, 300)
    .setImages(imgs)
    .updateSize()
    ;

  fullScreen();
  deck.add(claw);
  deck.add(healingHands);
}

void draw() {
  background(0, 0, 255);
}

void cardDraw() {
  if (deck.size()>0) {
    playerHand.addCard(deck.get(0));
    deck.remove(0);
  }
  else {
    mill();
  }
}

void mill() {
  println("bruh");
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
}

//function colorA will receive changes from
//controller with name colorA
public void colorA() {
  println("a button event from colorA: ");
  manager.skiftGameState("gamescreen");
}

//function colorB will receive changes from
//controller with name colorB
public void colorB() {
  println("a button event from colorB: ");
}

//function colorC will receive changes from
//controller with name colorC
public void play() {
  println("a button event from colorC: ");
  cardDraw();
}
