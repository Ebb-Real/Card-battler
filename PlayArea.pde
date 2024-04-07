//The area where you play your cards
class PlayArea {
  float sizeX;
  float sizeY;
  
  PlayArea(float inputSizeX, float inputSizeY){
    sizeX = inputSizeX;
    sizeY = inputSizeY;
  }
  
  void draw() {
    push();
    fill(0, 0, 0, 150);
    rect(width/2, height/3, sizeX, sizeY);
    pop();
  }
}
