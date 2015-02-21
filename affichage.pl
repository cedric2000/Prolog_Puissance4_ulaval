
/*###########################################################################
								AFFICHAGE
#############################################################################
Ensemble de prédicat permettant :
	- Affichage d'en element quelconque dans la console
	- Affichage d'une liste de N element.
	- Affichage d'une liste de liste sous la forme d'une grille (ou matrice)
#############################################################################*/	

:- module(affichage, [displayGrid/1]).
:- use_module(grille).
	
/*============================================================================
							Afficher Grille
==============================================================================	
	- Grid : La grille à afficher.
	- NoElem : Element Courant de la grille
	- List : List présente à l'indice NoElem de la grille
=============================================================================*/

displayGrid(_,7).										/*On s'arete à 7*/
displayGrid(Grid, NoElem):- NoElem < 7,
							Next is NoElem+1,
							getLine(Grid, NoElem,List),	/*Recuperation de la sous list à l'indice courant*/
							displayList(List),				/*Afficher sous liste*/
							write('\n'),
							displayGrid(Grid, Next).
displayGrid(G):- displayGrid(G,1).



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
