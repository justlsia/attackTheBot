
// Importation de modules
import 'dart:math';
import 'user_input.dart';

// Importation de classes
import 'bot.dart';
import 'joueur.dart';


// ***** FONCTIONS *****

// Fonction lancé de deux dés (générer un nombre aléatoire entre 1 et 12)
// Paramétre : pseudo du joueur
int lancerDes(String pseudoJoueur) {
  
  // Initialiser la fonction Random (générer des nombres aléatoires)
  Random random = new Random();

  // Création d'un nombre aléatoire entre 1 et 6
  int nbrAleatoire = (random.nextInt(6) + 1) + (random.nextInt(6) + 1);

  print("${pseudoJoueur} a lancé les dés ... ${nbrAleatoire}");

  return nbrAleatoire;
}

// Fonction d'attaque du bot 
// Paramétres : pseudo du joueur, objet Bot 
String attaquerBot(String pseudoJoueur, Bot bot) {

  // Variables 
  int scoreDes      = 0;     // Point de vie perdu du Bot
  String resultat   = "";    // Phrase renvoyé 
  int compteurTour  = 1;     // Compter le nombre de tour effecuté

  // Tant que le bot n'est pas KO (% de vie > 0)
  while (bot.sante > 0) {

    // Attendre que l'utilisateur appuye sur entrée
    readText("${pseudoJoueur}, appuyer sur entrée pour lancer les dés.");

    // Lancer de dés (générer un nombre aléatoire entre 1 et 12)
    scoreDes = lancerDes(pseudoJoueur);

    print("${pseudoJoueur} assène un coup sur le bot avec une force de ${scoreDes}.");

    // Actualiser les points de vie du bot
    bot.sante -= scoreDes;

    // Afficher la santé du bot seulement si supérieur à 0
    if (bot.sante > 0) {
      print("Bot - santé ${bot.sante}%");
    }

    // Afficher le tour en cours
    print("Fin du tour ${compteurTour}");

    // Actualiser le nombre de tour
    compteurTour += 1;

    }

  // Si la santé du bot est inférieur ou égale à 0
  if (bot.sante <= 0) {
    // Partie gagné
    resultat = "Vous avez gagné la partie !";
  }

  // Retourner le resultat 
  return resultat;

}


// ***** MAIN *****

void main(List<String> args) {

  // Variables 
  String resultat     = ""; // Resultat renvoyé
  

  // Création d'un joueur : J1
  final Joueur J1 = Joueur();

  // Création du Bot 1
  final Bot B1 = Bot();

  // Attribution des valeurs de B1
  B1.force      = 1;
  B1.sante      = 100;


  // Récupérer le pseudo du joueur J1
  J1.pseudo = readText("Quel est votre pseudo : ");

  // Attaquer le bot (paramètres : pseudo du joueur, objet bot)
  resultat = attaquerBot(J1.pseudo, B1);

  // Retourner le resultat
  print(resultat);

}
