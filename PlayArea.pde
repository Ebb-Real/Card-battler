//The area where you play your cards
class PlayArea {
  float posX;
  float posY;
  float sizeX;
  float sizeY;
  
  PlayArea(float inputSizeX, float inputSizeY){
    sizeX = inputSizeX;
    sizeY = inputSizeY;
  }
  
  void draw() {
    posX = width/2;
    posY = height/3;
    push();
    fill(0, 0, 0, 150);
    rect(posX, posY, sizeX, sizeY, 30);
    pop();
  }
}
