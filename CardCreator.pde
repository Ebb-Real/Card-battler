class CardCreator{
  Card claw, healingHands;
  CardCreator(){}
  
  
  void Create(String input){
  switch(input){
  case "claw":
   deck.add(claw = new BygCard().setNavn("Claw").setMana(3).setDamage(2).build());
   break;
   case "healing hands":
   deck.add(healingHands = new BygCard().setNavn("Healing Hands").setMana(2).setHeal(1).build());
   break;
  }
  }
}
