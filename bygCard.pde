//implementation of builder
class BygCard implements builder {
  Card CardBP;

  BygCard() {
    CardBP = new Card();
  }

  BygCard setNavn(String n) {
    CardBP.name = n;
    return this;
  }
  
  BygCard setDescription(String des) {
    CardBP.description = des;
    return this;
  }

  BygCard setMana(int m) {
    CardBP.mana = m;
    return this;
  }

  BygCard Minion(boolean mi) {
    CardBP.minion = mi;
    return this;
  }
  
  BygCard setPictureFile(String cpf) {
    CardBP.cardPictureFile = cpf;
    return this;
  }

  //Minion
  BygCard setHealth(int h) {
    CardBP.health = h;
    return this;
  }

  BygCard setPower(int a) {
    CardBP.power = a;
    return this;
  }

  //spell
  BygCard setDamage(int d) {
    CardBP.damage = d;
    return this;
  }

  BygCard setHeal(int ha) {
    CardBP.heal = ha;
    return this;
  }

  BygCard setPosX(float pox) {
    CardBP.posX = pox;
    return this;
  }

  BygCard setPosY(float poy) {
    CardBP.posY = poy;
    return this;
  }
  
  Card build() {
    return CardBP;
  }
}
