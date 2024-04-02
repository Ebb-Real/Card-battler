  class Health {
    int maxHealth;
    int startingHealth;
    
    Health(int startingHealthInput,int maxHealthInput){
    maxHealth=maxHealthInput;
    startingHealth=startingHealthInput;
  }
  
    int currentHealth;
    void playerHeal(int healAmmount){
    if (currentHealth<maxHealth){
    currentHealth=currentHealth+healAmmount;
    }
    else{
    println("you've reached max health");
    }
    }
    
    void playerHurt(int damageAmmount){ //<>//
    currentHealth=currentHealth-damageAmmount; //<>//
    if (currentHealth<0){ //<>//
    println("you lose"); //<>//
    } //<>//
    } //<>//
} //<>//
