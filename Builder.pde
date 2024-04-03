//the builder interface
interface builder {
  //generic data
  builder setNavn(String name);
  builder setDescription(String description);
  builder setMana(int mana);
  builder Minion(boolean minion);
  builder setPosX(float setPosX);
  builder setPosY(float setPosY);
  builder setPictureFile(String cardPictureFile);

  //if monster
  builder setPower(int p);
  builder setHealth(int h);

  //if spell
  builder setDamage(int d);
  builder setHeal(int h);
  Card build();
}
