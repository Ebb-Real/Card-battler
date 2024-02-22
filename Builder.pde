interface Builder{
  //musts
  Builder setNavn(String name);
  Builder setMana(int mana);
  Builder Unit(boolean unit);
  
  //if monster
  Builder setPower(int p);
  Builder setHealth(int h);
  
  //if spell
  Builder setDamage(int d);
  Builder setHeal(int h);
  CardBP build();
}
