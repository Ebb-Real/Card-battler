interface Builder{
  //musts
  Builder setNavn(String name);
  Builder setMana(int mana);
  Builder Minion(boolean minion);
  
  //if monster
  Builder setPower(int p);
  Builder setHealth(int h);
  
  //if spell
  Builder setDamage(int d);
  Builder setHeal(int h);
  CardBP build();
}
