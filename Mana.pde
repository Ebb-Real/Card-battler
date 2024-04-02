class Mana {
  int maxMana;
  int startingMana;
  int addedManaPerRound;
  int currentMana;
  int activeMana;
  //PImage manaCrystal;
  
  Mana(int maxManaInput, int startingManaInput, int addedManaPerRoundInput) {
     maxMana = maxManaInput;
     startingMana = startingManaInput;
     addedManaPerRound = addedManaPerRoundInput;
     //PImage manaCrystal = loadImage("manacrystal.png");
  }
  
 
  void manaIncrease(int manaAmmount){
    if(currentMana<maxMana){
  currentMana=currentMana+manaAmmount;
  }
  else{
    println("you've reached maximum potential no more mana for you idiot");
   }
 }
  
  void manaGain(int manaAmmount) {
    activeMana=activeMana+manaAmmount;
  }
  void manaSpend(int manaAmmount) {
    activeMana=activeMana-manaAmmount;
  }
  
}
