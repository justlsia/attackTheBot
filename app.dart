// Importation de modules
import 'dart:math';
import 'dart:io';

// Importation de classes
import 'bot.dart';
import 'joueur.dart';


// ----- FONCTIONS -----

// Lancé de dés (générer un nombre aléatoire entre 1 et 12)
int lancerDes(String pseudo) {
  
  // Générer un nombre aléatoire entre 1 et 12
  Random random = new Random();
  int randomNbr = (random.nextInt(6) + 1) + (random.nextInt(6) + 1);

  print("${pseudo} a lancé les dés ... ${randomNbr}");

  return randomNbr;
}

// Fonctions de récupération de la réponse de l'utilisateur
String readText(String question) {
  print(question);
  return stdin.readLineSync().toString();
}


// ***** MAIN *****
void main(List<String> args) {

  // Variables
  int botDefeated = 0; // Nombre total de bot vaincus

  // Créer un joueur
  Joueur player = new Joueur(); 
  player.pseudo = "pseudoPlayer";
  player.force = 1;
  player.sante = 100;

  // Boucle de jeu
  while (true) {

    // Créer un bot avec une force aléatoire (pour augmenter la difficulté)
    Bot bot = new Bot(); 
    bot.force = Random().nextInt(3) + 1;
    bot.sante = 100;

    // Récupérer le pseudo du joueur
    player.pseudo = readText("Quel est votre pseudo ?");

    // Boucle de combat tant que le joueur et le bot sont en vie
    while (player.sante > 0 && bot.sante > 0) {

      print("----- Tour en cours -----");

      // Tour du joueur
      player.attackBot(bot);
      bot.displayBotInfo();

      // Si le bot est KO
      if (bot.sante <= 0) {
        // Le joueur monte de niveau (gain de force)
        player.levelUp();
        botDefeated++;
        break;
      }

      // Tour du bot
      bot.attackPlayer(player);
      player.displayPlayerInfo();

      // Sauter un espace après le tour du bot
      readText("Appuyez sur entrée pour passer au prochain tour...");

      // Si le joueur est KO
      if (player.sante <= 0) {
        // Fin de la partie
        break;
      }
    }

    // Si le joueur est KO
    if (player.sante <= 0) {
      print("${player.pseudo} a perdu la partie après avoir vaincu $botDefeated bots !");
      break;
    }


    // Demander au joueur s'il veut continuer à affronter d'autres bots
    String continuer = readText("Voulez-vous affronter un autre bot ? (oui/non)");
    if (continuer.toLowerCase() != "oui") {
      print("${player.pseudo} a vaincu un total de $botDefeated bots !");
      break;
    }
  }
  
}
