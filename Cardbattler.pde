import controlP5.*;
GameStateManager manager;

ControlP5 cp5;

//integers and arraylists
public int cardlength = 150;
public int cardheight = 300;
ArrayList<Card> deck = new ArrayList<Card>();
ArrayList<Card> hand = new ArrayList<Card>();
int handArea = width/4*3-width/4*1;

//cards
Card claw, healingHands;

void setup() {
    
  
    manager = new GameStateManager();
    
    
    manager.tilFoejGameState("mainScreen", new mainScreen());
    manager.tilFoejGameState("gameScreen", new gameScreen());
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
  deck.add(claw);
  deck.add(healingHands);
}

void draw() {
  background(0, 0, 255);
  if (hand.size()>0) {
    if (width/2-hand.size()*cardlength/2>width/4) {
      for (int i=0; i<=hand.size()-1; i++) {
        fill (255, 0, 0);
        rect(width/2-hand.size()*cardlength/2+i*cardlength-cardlength/2, height/4*3, cardlength, cardheight+width/4);
      }
    } else {
        for (int i=0; i<=hand.size()-1; i++) {
          fill (255, 0, 0);
          rect(width/4*2/hand.size()*i+width/4*1-cardlength/2, height/4*3, cardlength, cardheight);
      }
    }
  }
  
  manager.draw();
}

void cardDraw() {
  if (deck.size()>0) {
    hand.add(deck.get(0));
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
  println("heh");
  manager.skiftGameState("gameScreen");
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

public void Endturn() {
  println("a button event from colorC: ");
  cardDraw();
}
