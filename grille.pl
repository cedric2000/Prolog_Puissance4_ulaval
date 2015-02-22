
/*###########################################################################
						Grille
#############################################################################
Une grille est mod�liser par une liste de liste suivant les lignes, 
puis les colonnes

Ensemble de pr�dicat permettant de g�r� une grille :
	- R�cup�r� une colonne de la grille
	- R�cup�r� une ligne de la grille
	- Placer un element sur une colonne	(toujours en bas)
#############################################################################*/	

:- module(grille, [getLine/3,addElementColumn/4]).
:- use_module(liste).

/*============================================================================
					R�cup�r� une ligne de la grille
==============================================================================	
	- Grid : Grille � analyser.
	- NbLine : num�ro de la ligne.
	- Line : List compos� des elements de la ligne NbLine.
=============================================================================*/

getLine(NbLine,Grid,Line) :- maplist(getElement(NbLine), Grid, Line).

/*============================================================================
						R�cup�r� une colonne de la grille
==============================================================================	
	- Grid : Grille � mettre � jour.
	- NbColumn : num�ro de la colonne.
	- Element : Element � ajouter.
	- Column : List compos� des elements de la colonne NbColumn.
=============================================================================*/

getColumn(NbColumn,Grid,Column) :- getElement(NbColumn,Grid,Column). 
	
	
/*============================================================================
				Ajouter Element colone N
==============================================================================	
	- Grid : Grille � mettre � jour.
	- NbColumn : num�ro de la colonne.
	- NewGrid : Grille mise � jour.
=============================================================================*/

addElementColumn(Index, Grid, Element, NewGrid) :- getColumn(Index, Grid, Column), 			/* R�cup�r� la colone choisis */
											addElement(Column, Element, NewColumn),		/* On ajoute l'element dans la liste colone*/
											setElement(Index,Grid,NewColumn, NewGrid).	/*On met � jour la grille*/

