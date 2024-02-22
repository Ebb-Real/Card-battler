class Mana {
  int maxMana;
  int startingMana;
  int addedManaPerRound;
  PImage manacrystal;
  
  Mana(int maxManaInput, int startingManaInput, int addedManaPerRoundInput) {
    int maxMana = maxManaInput;
    int startingMana = startingManaInput;
    int addedManaPerRound = addedManaPerRoundInput;
    manacrystal = loadImage("manacrystal.jpg");
  }
  
  void draw(){
    
  }
}
