
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
    // Appeler la fonction lancerDes pour déterminer la force de l'attaque
    int scoreDes = lancerDes(this.pseudo);
    // Calculer les dégâts en multipliant le score des dés par la force du Bot
    int degats = scoreDes * bot.force;
    // Afficher l'action d'attaque
    print("${this.pseudo} assène un coup sur le bot avec une force de ${degats}."); 
    // Réduir la santé du Bot en fonction des dégâts
    bot.sante -= degats;
    // Vérifier si la santé du Bot est négative
    if (bot.sante < 0) { 
      // Réinitialiser la santé à zéro si elle est négative
      bot.sante = 0; 
    }
    // Afficher la santé restante du Bot
    print("Bot - Santé ${bot.sante}%"); 
  }


  void levelUp() {
    // Augmenter la force du joueur de 1 
    this.force += 1;
    print("${this.pseudo} augmente sa force de 1 après cette victoire !");
  }

}


