class Mana {
  int maxMana;
  int startingMana;
  int addedManaPerRound;
  PImage manaCrystal;
  
  Mana(int maxManaInput, int startingManaInput, int addedManaPerRoundInput) {
    int maxMana = maxManaInput;
    int startingMana = startingManaInput;
    int addedManaPerRound = addedManaPerRoundInput;
    manaCrystal = loadImage("manacrystal.jpg");
  }
  
  void draw(){
    
  }
}
