  int moonSelector=0;
class GameState {
  int xpos=125;
  int ypos=50;
  float buttonwidth=100;
  float buttonheight=100;
  int scale=4;

  void update() {
  }

  void musKlikked() {
  }

  void draw() {
  }
  
  
  //Lave om så det kan bruges med GUI lib ControlP5
    void returnbutton() {
    PImage img=loadImage("bruh.png");
    buttonheight=img.height/scale;
    buttonwidth=img.width/scale;
    img.resize(img.width/scale, img.height/scale);
    image(img, xpos, ypos);
    noFill();
    if (mouseX > xpos-buttonwidth/2 && mouseX < xpos + buttonwidth/2 && mouseY > ypos-buttonheight/2 && mouseY < ypos+buttonheight/2 && mousePressed) {
      mainScreen =! mainScreen;
      manager.skiftGameState("mainScreen");
    }
    
    }
}
