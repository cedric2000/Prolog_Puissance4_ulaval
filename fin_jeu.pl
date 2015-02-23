
/*###########################################################################
						Fin de jeu
#############################################################################
Une grille est mod�liser par une liste de liste suivant les lignes, 
puis les colonnes

Ensemble de pr�dicat permettant de g�r� une grille :
	- R�cup�r� une colonne de la grille
	- R�cup�r� une ligne de la grille
	- Placer un element sur une colonne	(toujours en bas)
#############################################################################*/	

:- module(fin_jeu,[isWinner/2]).
:- use_module(liste).
:- use_module(grille).

/*============================================================================
					Condition de victoire globale
==============================================================================	
	- Grid : Grille � analyser.
	- J : joueur
=============================================================================*/

isWinner(Grid,Joueur) 	:- 	isEndHor(Grid,Joueur,6);
							isEndVert(Grid,Joueur,7).

							
/*============================================================================
					Condition de victoire horizontal 
==============================================================================	
	- Grid : Grille � analyser.
	- J : joueur
	- N : variable d'incr�ment inialiser avec la longeur de la grille
=============================================================================*/

isEndHor(Grid,J,N) 	:- 	getLine(N,Grid,Line),
						sublist([J,J,J,J], Line),!.									 
isEndHor(Grid,J,N) 	:-  N > 0,
						N1 is N-1,
						isEndHor(Grid,J,N1).
						
/*============================================================================
					Condition de victoire verticale
==============================================================================	
	- Grid : Grille � analyser.
	- J : joueur
	- N : variable d'incr�ment inialiser avec la hauteur de la grille
=============================================================================*/					
isEndVert(Grid,J,N) :-	getColumn(N,Grid,Column),
						sublist([J,J,J,J], Column),!.
isEndVert(Grid,J,N) :- 	N > 0,
						N1 is N-1,
						isEndVert(Grid,J,N1).
					
					