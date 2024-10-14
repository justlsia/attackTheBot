// Classe Bot
import 'app.dart';
import 'joueur.dart';

class Bot {
  
  int force       = 0;  // Force d'attaque
  int sante       = 0;  // Pourcentage de vie 


  // Méthodes
  void displayBotInfo() {
    print("État du bot : force = ${this.force} - santé = ${this.sante}");
  }

  void attackPlayer(Joueur joueur) {
    // Appeller fonction lancerDes pour déterminer la force de l'attaque
    int scoreDes = lancerDes("Bot");
    // Calculer les dégâts en multipliant le score des dés par la force du Bot
    int degats = scoreDes * force;
    // Afficher l'action d'attaque
    print("Bot attaque ${joueur.pseudo} avec une force de $degats.");
    // Réduir la santé du joueur en fonction des dégâts 
    joueur.sante -= degats;
    // Vérifier si la santé du joueur est négative
    if (joueur.sante < 0) {
      // Réinitialier la santé à zéro si elle est négative
      joueur.sante = 0;
    }
    // Afficher la santé restante du joueur
    print("${joueur.pseudo} - Santé ${joueur.sante}%");
    }

}
