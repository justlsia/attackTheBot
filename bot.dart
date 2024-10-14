// Classe Bot
import 'app.dart';
import 'joueur.dart';

class Bot {
  
  // Attaque du bot
  int force       = 0;
  // Pourcentage de vie du bot
  int sante       = 0;


  // Méthodes
  void displayBotInfo() {
    print("État du bot : force = ${this.force} - santé = ${this.sante}");
  }

  void attackPlayer(Joueur joueur) {
    // Appel de la fonction lancerDes pour déterminer la force de l'attaque
    int scoreDes = lancerDes("Bot");
    // Calcul des dégâts en multipliant le score des dés par la force du Bot
    int degats = scoreDes * force;
    // Affichage de l'action d'attaque
    print("Bot attaque ${joueur.pseudo} avec une force de $degats.");
    // Réduction de la santé du joueur en fonction des dégâts 
    joueur.sante -= degats;
    // Vérification si la santé du joueur est négative
    if (joueur.sante < 0) {
      // Réinitialisation de la santé à zéro si elle est négative
      joueur.sante = 0;
    }
    // Affichage de la santé restante du joueur
    print("${joueur.pseudo} - Santé ${joueur.sante}%");
    }


}
