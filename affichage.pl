
/*###########################################################################
								AFFICHAGE
#############################################################################
Ensemble de pr�dicat permettant :
	- Affichage d'en element quelconque dans la console
	- Affichage d'une liste de N element.
	- Affichage d'une liste de liste sous la forme d'une grille (ou matrice)
#############################################################################*/	

:- module(affichage, [displayGrid/1]).
	
/*============================================================================
							Afficher Grille
=============================================================================	
	- E : element courant de la liste.
	- NoElem : Element Courant de la grille
	- List : List pr�sente � l'indice NoElem de la grille
=============================================================================*/

displayGrid(_,7).										/*On s'arete � 7*/
displayGrid(Grid, NoElem):- NoElem < 7,
							Next is NoElem+1,
							nth1(NoElem,Grid,List),		/*Recuperation de la sous list � l'indice courant*/
							displayList(List),			/*Afficher sous liste*/
							write('\n'),
							displayGrid(Grid, Next).
						
displayGrid(G):- displayGrid(G,1).



/*==========================================================================
						Afficher liste
=============================================================================	
	- Element : element courant de la liste
	- List : liste des element suivant
=============================================================================*/
displayList([]):- write('|').
displayList([Element|List]):-  	write('|'),
								displayElement(Element),
								displayList(List).


/*====================================================================
						Afficher element
=======================================================================	
	- Element : Element � afficher
=======================================================================*/

displayElement([]):- write(' '),!.
displayElement(Element):- write(Element).
