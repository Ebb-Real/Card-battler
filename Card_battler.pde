void setup(){
  fullScreen();
  deck.add(1);
  deck.add(3);
  deck.add(7);
}

ArrayList deck = new ArrayList();
ArrayList hand = new ArrayList();
int handArea = width/43-width/41;
void draw(){
cardDraw();
for(int i=0; i<=hand.size(); i++){
fill (255,0,0);
rect(width/4/hand.size()i,height/43,100,100);
}
fill(255);
rect(width/41,height/43,width/42,height/41);
}
void cardDraw(){
  if(deck.size()>0){
    hand.add(deck.get(0));
    deck.remove(0);
  }
  else{
  mill();
  }
}
void mill(){
  println("bruh");
}

//  cardDraw();
//  if(deck.size()>0){
//  println("deck"+deck.get(0));
//} 
//  if(hand.size()>0){
//   for (int i = 0; i < hand.size(); i++) {
//  println("hand"+hand.get(i));
//} 
//}
