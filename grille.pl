
/*###########################################################################
						Grille
#############################################################################
Une grille est modéliser par une liste de liste suivant les lignes, 
puis les colonnes

Ensemble de prédicat permettant de géré une grille :
	- Récupéré une colonne de la grille
	- Récupéré une ligne de la grille
	- Placer un element sur une colonne	(toujours en bas)
#############################################################################*/	

:- module(grille, [getLine/3,addElementColumn/4]).
:- use_module(liste).

/*============================================================================
					Récupéré une ligne de la grille
==============================================================================	
	- Grid : Grille à analyser.
	- NbLine : numéro de la ligne.
	- Line : List composé des elements de la ligne NbLine.
=============================================================================*/

getLine(NbLine,Grid,Line) :- maplist(getElement(NbLine), Grid, Line).

/*============================================================================
						Récupéré une colonne de la grille
==============================================================================	
	- Grid : Grille à mettre à jour.
	- NbColumn : numéro de la colonne.
	- Element : Element à ajouter.
	- Column : List composé des elements de la colonne NbColumn.
=============================================================================*/

getColumn(NbColumn,Grid,Column) :- getElement(NbColumn,Grid,Column). 
	
	
/*============================================================================
				Ajouter Element colone N
==============================================================================	
	- Grid : Grille à mettre à jour.
	- NbColumn : numéro de la colonne.
	- NewGrid : Grille mise à jour.
=============================================================================*/

addElementColumn(Index, Grid, Element, NewGrid) :- getColumn(Index, Grid, Column), 			/* Récupéré la colone choisis */
											addElement(Column, Element, NewColumn),		/* On ajoute l'element dans la liste colone*/
											setElement(Index,Grid,NewColumn, NewGrid).	/*On met à jour la grille*/

