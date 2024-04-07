class CardCreator {
  Card claw, healingHands;
  CardCreator() {
  }

  void Create(String input) {
    switch(input) {
    case "claw":
      deck.add(claw = new BygCard().setNavn("Claw").setDescription("Deal 2 damage to \n opponent").setManaCost(3).setDamage(2).setPictureFile("claw.png").build());
      break;
    case "healing hands":
      deck.add(healingHands = new BygCard().setNavn("Healing Hands").setDescription("Heal for 1 HP").setManaCost(2).setHeal(1).setPictureFile("healing.jpg").build());
      break;
    }
  }
}
