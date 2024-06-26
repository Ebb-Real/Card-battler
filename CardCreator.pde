class CardCreator {
  Card claw, healingHands, manaVial, dagger, siphonBlood, flamingMana, fireSword;

  CardCreator() {
  }

  void Create(String card, int numberOfCards) {
    switch(card) {
    case "claw":
      for (int i = 0; i < numberOfCards; i++) {
        deck.add(claw = new BygCard().setNavn("Claw").setDescription("Deal 3 damage to \n opponent").setManaCost(3).setDamage(3).setPictureFile("claw.png").build());
      }
      break;
    case "healing hands":
      for (int i = 0; i < numberOfCards; i++) {
        deck.add(healingHands = new BygCard().setNavn("Healing Hands").setDescription("Heal for 2 HP").setManaCost(2).setHeal(2).setPictureFile("healing.jpg").build());
      }
      break;
    case "mana vial":
      for (int i = 0; i < numberOfCards; i++) {
        deck.add(manaVial = new BygCard().setNavn("Mana Vial").setDescription("Increase mana by 1 \n permenantly").setManaCost(0).setManaAdd(1).setPictureFile("mana_vial.png").build());
      }
      break;
    case "flaming mana":
      for (int i = 0; i < numberOfCards; i++) {
        deck.add(flamingMana = new BygCard().setNavn("Flaming Mana").setDescription("Increase mana by 2 \n permenantly and take \n 1 damage").setManaCost(0).setManaAdd(2).setSelfDamage(1).setPictureFile("fire_potion.png").build());
      }
      break;
    case "dagger":
      for (int i = 0; i < numberOfCards; i++) {
        deck.add(dagger = new BygCard().setNavn("Dagger").setDescription("Deal 1 damage to \n opponent").setManaCost(0).setDamage(1).setPictureFile("dagger.png").build());
      }
      break;
    case "siphon blood":
      for (int i = 0; i < numberOfCards; i++) {
        deck.add(siphonBlood = new BygCard().setNavn("Siphon Blood").setDescription("Deal 2 damage to \n opponent and heal \n yourself for 1 HP").setManaCost(3).setDamage(2).setHeal(1).setPictureFile("blood_magic.png").build());
      }
      break;
    case "fire sword":
      for (int i = 0; i < numberOfCards; i++) {
        deck.add(fireSword = new BygCard().setNavn("Fire Sword").setDescription("Deal 6 damage and \n take 1 damage").setManaCost(5).setDamage(6).setSelfDamage(1).setPictureFile("fire_sword.png").build());
      }
      break;
    }
  }
}
