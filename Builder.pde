//the builder interface
interface builder {
  //generic data
  builder setNavn(String name);
  builder setDescription(String description);
  builder setPosX(float setPosX);
  builder setPosY(float setPosY);
  builder setPictureFile(String cardPictureFile);
  builder setManaCost(int manaCost);

  //spell
  builder setDamage(int Damage);
  builder setHeal(int Heal);
  builder setSelfDamage(int selfDamage);
  builder setManaAdd(int manaAdd);
  Card build();
}
