
/*###########################################################################
						Inteligence Artificielle
#############################################################################
Ensemble de pr�dicat permettant � l'int�ligence artificielle de d�terminer le
le prochain coup � jouer.
#############################################################################*/	


:- module(ia, [chooseBestMove/2]).
:- use_module(grille).
:- use_module(liste).
:- use_module(etat).
:- use_module(arbre).

/*============================================================================
				Constructuction d'un arbre de profondeur 2
==============================================================================	
	- Grid : La grille � analyser.
	- J : Joueur qui doit jouer le prochain coup.
	- Tree : l'arbre remplis.
	- NoColone : La colonne ou il faut joueur le coup.
=============================================================================*/

chooseBestMove(Grid,J,NoColone) :- buidTree(Grid, Tree).
						   