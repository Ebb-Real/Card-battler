class Enemy {
  int currentEnemyHealth;
  int enemyStartingHealth;
  int enemyMaxHealth;
  int attackMinimum;
  int attackMaximum;
  int critMinimum;
  int critMaximum;
  int healMinimum;
  int healMaximum;
  PImage enemyHeart;
  PImage attackIntent, healIntent, missIntent, critIntent, currentIntent;

  Enemy(int enemyStartingHealthInput, int enemyMaxHealthInput, int attackMinimumInput, int attackMaximumInput, int healMinimumInput, int healMaximumInput, int critMinimumInput, int critMaximumInput) {
    enemyStartingHealth = enemyStartingHealthInput;
    currentEnemyHealth = enemyStartingHealthInput;
    enemyMaxHealth = enemyMaxHealthInput;
    attackMinimum = attackMinimumInput;
    attackMaximum = attackMaximumInput;
    critMinimum = critMinimumInput;
    critMaximum = critMaximumInput;
    healMinimum = healMinimumInput;
    healMaximum = healMaximumInput;
  }

  int action;
  int power;

  void intent() {
    action = int(random(10));
    switch(action) {
      case (0):
      power = 0;
      currentIntent = missIntent;
      break;
      case(1):
      case (2):
      case (3):
      case (4):
      case (5):
      power = int(random(attackMinimum, attackMaximum));
      currentIntent = attackIntent;
      break;
      case (6):
      case (7):
      case (8):
      power = int(random(healMinimum, healMaximum));
      currentIntent = healIntent;
      break;
      case (9):
      case (10):
      power = int(random(critMinimum, critMaximum));
      currentIntent = critIntent;
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
    currentEnemyHealth = currentEnemyHealth - damage;
    if (currentEnemyHealth <= 0) {
      b1.hide();
      b2.hide();
      menuButton.hide();
      menuButton2.show();
      manager.skiftGameState("winScreen");
    }
  }

  void enemyAttack (int damage) {
    playerHealth.playerHurt(damage);
  }

  void enemyHeal(int healingAmmount) {
    currentEnemyHealth = currentEnemyHealth + healingAmmount;
    if (currentEnemyHealth > enemyMaxHealth) {
      currentEnemyHealth = enemyMaxHealth;
    }
  }

  void enemyUI() {
    for (int i = 0; i < currentEnemyHealth; i++) {
      image(enemyHeart, width/2 - (enemyHeart.width * currentEnemyHealth)/2 + i * enemyHeart.width, 0);
    }

    image(currentIntent, width/5 * 4, height/3.5);
    currentIntent.resize(width/14, height/8);
    textSize(height/20);
    text("Enemy Intent", width/5 * 4 + currentIntent.width/2, height/3.5 + currentIntent.height - 240);
    text(Integer.toString(power), width/5 * 4 + currentIntent.width/2, height/3.5 + currentIntent.height/2 + 20);
  }

  void enemyLoad() {
    enemyHeart = loadImage("Enemy Heart.png");
    enemyHeart.resize(width/25, width/25);
    attackIntent = loadImage("Attack intent.png");
    healIntent = loadImage("Heal intent.png");
    missIntent = loadImage("Miss intent.png");
    critIntent = loadImage("Crit intent.png");
    attackIntent.resize(width/5, width/5);
    healIntent.resize(width/5, width/5);
    missIntent.resize(width/5, width/5);
    critIntent.resize(width/5, width/5);
  }
}
