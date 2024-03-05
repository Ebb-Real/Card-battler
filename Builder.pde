interface builder{
  //musts
  builder setNavn(String name);
  builder setMana(int mana);
  builder Minion(boolean minion);
  builder setPosX(float setPosX);
  builder setPosY(float swtPosY);
  
  //if monster
  builder setPower(int p);
  builder setHealth(int h);
  
  //if spell
  builder setDamage(int d);
  builder setHeal(int h);
  CardBP build();
}
