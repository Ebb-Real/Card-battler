    import controlP5.*;
GameStateManager manager;

ControlP5 cp5;

//integers and arraylists
public int cardlength = 150;
public int cardheight = 300;
ArrayList<Card> deck = new ArrayList<Card>();

//create hand object
Hand playerHand = new Hand(10);

//create enemy object
 Enemy enemy=new Enemy();

//cards
Card claw, healingHands;

void setup() {
    
  
    manager = new GameStateManager();
  
    manager.tilFoejGameState("mainScreen", new mainScreen());
    manager.tilFoejGameState("gamescreen", new GameScreen());
    manager.skiftGameState("mainScreen");
  
  
  
  //card library
  claw = new BygCard().setNavn("Claw").setMana(3).setDamage(2).build();
  healingHands = new BygCard().setNavn("Healing Hands").setMana(2).setHeal(1).build();
  
  //GUI
  cp5 = new ControlP5(this);
  cp5.addButton("colorA")
    .setPosition(100, 100)
    .setSize(200, 19)
    ;

  PImage[] imgs = {loadImage("bruh2.png"), loadImage("bruh3.jpg"), loadImage("bruh4.png")};
  cp5.addButton("play")
    .setPosition(140, 300)
    .setImages(imgs)
    .updateSize()
    ;
    
    
  PImage[] imgs2 = {loadImage("bruh2.png"), loadImage("bruh3.jpg"), loadImage("bruh4.png")};
  cp5.addButton("Endturn")
    .setPosition(600, 300)
    .setImages(imgs2)
    .updateSize()
    ;

  fullScreen();
  deck.add(healingHands);
  deck.add(claw);
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
boolean drawn=false;
public void play() {
  if (drawn==false){
  println("a button event from colorC: ");
  cardDraw();
  drawn=true;
  }
}
boolean playerturn=true; //<>//
public void Endturn() { //<>//
  playerturn=false; //<>//
  enemy.enemyTurn(); //<>//
  drawn=false; //<>//
  println("a button event from Endturn: "); //<>//
}
