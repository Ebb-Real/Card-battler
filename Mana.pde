class Mana {
  int maxMana;
  int startingMana;
  int addedManaPerRound;
  int currentMana;
  int activeMana;
  PImage manaCrystal,usedManaCrystal;

  Mana(int maxManaInput, int startingManaInput, int addedManaPerRoundInput) {
    maxMana = maxManaInput;
    startingMana = startingManaInput;
    addedManaPerRound = addedManaPerRoundInput;
  }

  void manaIncrease(int manaAmmount) {
    if (currentMana<maxMana) {
      currentMana=currentMana+manaAmmount;
    } else {
      println("you've reached maximum potential no more mana for you idiot");
    }
  }

  void manaGain(int manaAmmount) {
    activeMana=activeMana+manaAmmount;
  }
  void manaSpend(int manaAmmount) {
    activeMana=activeMana-manaAmmount;
  }

    void ui() {
    int manaDifference=currentMana-activeMana;
    println("Active = " + playerMana.activeMana + "  Current = " + playerMana.currentMana + "  DIFFERENCE = " + manaDifference);
    //for Brugt mana
        for (int i=0; i<manaDifference; i++) {
      image(usedManaCrystal,width/2-(usedManaCrystal.width*currentMana)/2+activeMana*usedManaCrystal.width+i*usedManaCrystal.width,height/2);
    }
          //for useable mana
    for (int i=0; i<activeMana; i++) {
      image(manaCrystal,width/2-(manaCrystal.width*currentMana)/2+i*manaCrystal.width,height/2);
      
    }
  }
  
  void load() {
  manaCrystal=loadImage("manacrystal.png");
  manaCrystal.resize(width/20,width/15);
  usedManaCrystal=loadImage("manacrystal.png");
  usedManaCrystal.filter(GRAY);
  usedManaCrystal.resize(width/20,width/15);
  }
  
}
  
