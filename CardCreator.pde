class CardCreator {
  Card claw, healingHands;
  CardCreator() {
  }

  void Create(String input) {
    switch(input) {
    case "claw":
      deck.add(claw = new BygCard().setNavn("Claw").setDescription("Deal 3 damage to \n opponent").setManaCost(3).setDamage(3).setPictureFile("claw.png").build());
      break;
    case "healing hands":
      deck.add(healingHands = new BygCard().setNavn("Healing Hands").setDescription("Heal for 1 HP").setManaCost(2).setHeal(1).setPictureFile("healing.jpg").build());
    case "mana vial":
      deck.add(healingHands = new BygCard().setNavn("Mana Vial").setDescription("Increase mana by 1 \n permenantly").setManaCost(0).setManaAdd(1).setPictureFile("mana_vial.png").build());
      break;
    }
  }
}
