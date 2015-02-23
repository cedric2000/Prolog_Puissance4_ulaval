
/*###########################################################################
								AFFICHAGE
#############################################################################
Ensemble de prédicat permettant :
	- Affichage d'en element quelconque dans la console
	- Affichage d'une liste de N element.
	- Affichage d'une liste de liste sous la forme d'une grille (ou matrice)
	- Affichage du choix des joueurs pour le prochain tour.
#############################################################################*/	

:- module(affichage, [displayGrid/1,displayCoupX/1,displayCoupO/1,displayWinner/1]).
:- use_module(grille).
	
/*============================================================================
							Afficher Grille
==============================================================================	
	- Grid : La grille à afficher.
	- NoElem : Element Courant de la grille
	- List : List présente à l'indice NoElem de la grille
=============================================================================*/

displayGrid(_,0).										/*On s'arete à 0*/
displayGrid(Grid, NoElem):- NoElem > 0,
							Next is NoElem-1,
							getLine(NoElem,Grid,List),	/*Recuperation de la sous list à l'indice courant*/
							displayList(List),			/*Afficher sous liste*/
							write('\n\t\t'),
							displayGrid(Grid, Next).


displayGrid(G)	:- 	write('\n\t\t 1 2 3 4 5 6 7'),
					write('\n\t\t# # # # # # # #'),
					write('\n\t\t'),
					displayGrid(G,6),
					write('###############\n\n').				

/*============================================================================
						Afficher liste
==============================================================================	
	- Element : element courant de la liste
	- List : liste des element suivant
=============================================================================*/
displayList([]):- write('|').
displayList([Element|List]):-  	write('|'),
								displayElement(Element),
								displayList(List).


/*============================================================================
						Afficher element
==============================================================================	
	- Element : Element à afficher
=============================================================================*/

displayElement([]):- write(' '),!.
displayElement(Element):- write(Element).


/*============================================================================
					Affiche le choix du prochain coup 
==============================================================================	
	- Grid : La grille de jeu
=============================================================================*/


displayCoupX(Grid):-	isWinner(Grid,'O'), 
						displayWinner('O'),!.
							
displayCoupX(Grid):- 	write('\t    Joueur X  | choisir la colonne : '),			
						read(NoColumn), 
						jouerCoupX(NoColumn, Grid).

						
displayCoupO(Grid):-	isWinner(Grid,'X'), 
						displayWinner('X'),!.
								
displayCoupO(Grid):- 	write('\t    Joueur O  | choisir la colonne : '),			
						read(NoColumn), 
						jouerCoupO(NoColumn, Grid).

/*============================================================================
						Affiche le gagnant
==============================================================================	
	- Joueur : Le joueur qui à gagner.
=============================================================================*/						

displayWinner(Joueur) :- write('\t        Le Joueur '), write(Joueur), write(' a gagné !!!!').
					
