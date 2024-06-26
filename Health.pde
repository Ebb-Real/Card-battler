class Health {
  int maxHealth;
  int currentHealth;
  int startingHealth;
  PImage heart;

  Health(int startingHealthInput, int maxHealthInput) {
    startingHealth = startingHealthInput;
    maxHealth = maxHealthInput;
    currentHealth = startingHealth;
  }

  void playerHeal(int healAmmount) {
    if (currentHealth < maxHealth) {
      currentHealth = currentHealth + healAmmount;
    } else {
    }
  }

  void playerHurt(int damageAmmount) {
    currentHealth = currentHealth - damageAmmount;
    if (currentHealth <= 0) {
        manager.skiftGameState("gameOverScreen");
        menuButton2.show();
        menuButton.hide();
        b1.hide();
        b2.hide();
    }
  }

  void ui() {
    for (int i = 0; i < currentHealth; i++) {
      image(heart, width/2-(heart.width * currentHealth)/2 + i * heart.width, height - heart.height);
    }
  }


  void load() {
    heart = loadImage("heart.png");
    heart.resize(width/25, width/25);
  }
}
