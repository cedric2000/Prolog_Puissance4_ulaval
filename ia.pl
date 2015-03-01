
/*###########################################################################
						Inteligence Artificielle
#############################################################################
Ensemble de prédicat permettant à l'intéligence artificielle de déterminer le
le prochain coup à jouer.
#############################################################################*/	


:- module(ia, [chooseBestMove/2]).
:- use_module(grille).
:- use_module(liste).
:- use_module(etat).
:- use_module(arbre).

/*============================================================================
				Constructuction d'un arbre de profondeur 2
==============================================================================	
	- Grid : La grille à analyser.
	- J : Joueur qui doit jouer le prochain coup.
	- Tree : l'arbre remplis.
	- NoColone : La colonne ou il faut joueur le coup.
=============================================================================*/

chooseBestMove(Grid,J,NoColone) :- buidTree(Grid, Tree).
						   