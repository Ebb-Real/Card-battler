class Enemy{
  Enemy(){}
int attacknumber=1;
void enemyTurn(){
 if (playerturn==false){ //<>//
   println("balls"); //<>//
   attacknumber=int(random(10));
   switch(attacknumber){
     case (0):
     println("miss");
     break;
     case (1):case (2):case (3):case (4):
     println("normal attack" + " " + attacknumber);
     break;
     case (5):case (6):case (7):case (8):
     println("block" + " " + (attacknumber-4));
     break;
     case (9):case (10):
     println("special attack" + " " + attacknumber);
     break;
   }
   println(attacknumber);
 }
}
}
