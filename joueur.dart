
// Classe : Joueur
import 'app.dart';
import 'bot.dart';

class Joueur {

    String pseudo       = "";
    int score           = 0;
    int force           = 0;
    int sante           = 0;

  // Méthodes

  void displayPlayerInfo() {
    print("État du joueur ${this.pseudo} : force = ${this.force} - santé = ${this.sante} - score = ${this.score}");
  }

  void attackBot(Bot bot) {
    // Appel de la fonction lancerDes pour déterminer la force de l'attaque
    int scoreDes = lancerDes(this.pseudo);
    // Calcul des dégâts en multipliant le score des dés par la force du Bot
    int degats = scoreDes * bot.force;
    // Affichage de l'action d'attaque
    print("${this.pseudo} assène un coup sur le bot avec une force de ${degats}."); 
    // Réduction de la santé du Bot en fonction des dégâts
    bot.sante -= degats;
    // Vérification si la santé du Bot est négative
    if (bot.sante < 0) { 
      // Réinitialisation de la santé à zéro si elle est négative
      bot.sante = 0; 
    }
    // Affichage de la santé restante du Bot
    print("Bot - Santé ${bot.sante}%"); 
  }


  void levelUp() {
    // Augmenter la force du joueur de 1 
    this.force += 1;
    print("${this.pseudo} augmente sa force de 1 après cette victoire !");
  }

}


