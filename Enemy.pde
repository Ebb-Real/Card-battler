class Enemy {
  int currentEnemyHealth;
  int maxHealth;
  int attackMinimum;
  int attackMaximum;
  int critMinimum;
  int critMaximum;
  int healMinimum;
  int healMaximum;
  Enemy(int enemyStartingHealth, int maxHealthInput, int attackMinimumInput, int attackMaximumInput, int healMinimumInput, int healMaximumInput, int critMinimumInput, int critMaximumInput) {
    currentEnemyHealth=enemyStartingHealth;
    maxHealth=maxHealthInput;
    attackMinimum=attackMinimumInput;
    attackMaximum=attackMaximumInput;
    critMinimum=critMinimumInput;
    critMaximum=critMaximumInput;
    healMinimum=healMinimumInput;
    healMaximum=healMaximumInput;
  }
  int action;
  int power;

  void intent() {
    action=int(random(10));
    switch(action) {
      case (0):
      println("miss");
      break;
      case(1):
      case (2):
      case (3):
      case (4):
      case (5):
      power=int(random(attackMinimum, attackMaximum));
      println("attack " + power);
      break;
      case (6):
      case (7):
      case (8):
      power=int(random(healMinimum, healMaximum));
      println("heal " + power);
      break;
      case (9):
      case (10):
      power=int(random(critMinimum, critMaximum));
      println("crit " + power);
      break;
    }
  }

  void enemyTurn() {
    switch(action) {
      case (0):
      break;
      case(1):
      case (2):
      case (3):
      case (4):
      case (5):
      enemyAttack(power);
      break;
      case (6):
      case (7):
      case (8):
      enemyHeal(power);
      break;
      case (9):
      case (10):
      enemyAttack(power);
      break;
    }
  }


  void enemyHurt(int damage) {
    currentEnemyHealth=currentEnemyHealth-damage;
    if (currentEnemyHealth<=0) {
      println("You win congratulations");
    }
  }

  void enemyAttack (int damage) { //<>//
    playerHealth.playerHurt(damage); //<>//
  } //<>//

  void enemyHeal(int healingAmmount) { //<>//
    currentEnemyHealth=currentEnemyHealth+healingAmmount; //<>//
  } //<>//
}
