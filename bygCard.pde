class BygCard implements builder {
  CardBP Card;

  BygCard() {
    Card = new CardBP();
  }

  BygCard setNavn(String n) {
    Card.navn = n;
    return this;
  }
  
  BygCard setMana(int m) {
    Card.mana = m;
    return this;
  }
  
  BygCard Minion(boolean m) {
    Card.minion = m;
    return this;
  }
  
  //Minion
  BygCard setHealth(int h) {
    Card.health = h;
    return this;
  }
  
  BygCard setPower(int a) {
    Card.power = a;
    return this;
  }
  
  //spell
  BygCard setDamage(int d) {
    Card.damage = d;
    return this;
  }
  
  BygCard setHeal(int ha) {
    Card.heal = ha;
    return this;
  }
  
  CardBP build() {
    return Card;
  }
}
