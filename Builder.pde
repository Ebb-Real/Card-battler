//the builder interface
interface builder {
  //generic data
  builder setNavn(String name);
  builder setDescription(String description);
  builder setManaCost(int manaCost);
  builder setManaAdd(int manaAdd);
  builder setPosX(float setPosX);
  builder setPosY(float setPosY);
  builder setPictureFile(String cardPictureFile);

  //spell
  builder setDamage(int d);
  builder setHeal(int h);
  Card build();
}
