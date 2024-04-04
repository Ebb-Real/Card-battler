//implementation of builder
class BygCard implements builder {
  Card CardBP;

  BygCard() {
    CardBP = new Card();
  }
  
  BygCard setPosX(float pox) {
    CardBP.posX = pox;
    return this;
  }

  BygCard setPosY(float poy) {
    CardBP.posY = poy;
    return this;
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

  BygCard setPictureFile(String cpf) {
    CardBP.cardPictureFile = cpf;
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

  Card build() {
    return CardBP;
  }
}
