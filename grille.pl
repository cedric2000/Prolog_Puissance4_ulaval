
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

:- module(grille, [getLine/3,getColumn/3]).
	
/*============================================================================
					Récupéré une ligne de la grille
==============================================================================	
	- Grid : Grille à analyser.
	- NbLine : numéro de la ligne.
	- Line : List composé des elements de la ligne NbLine.
=============================================================================*/

getLine(Grid, NbLine, Line) :- maplist(nth1(NbLine), Grid, Line).

/*============================================================================
						Récupéré une colonne de la grille
==============================================================================	
	- Grid : Grille à mettre à jour.
	- NbColumn : numéro de la colonne.
	- Column : List composé des elements de la colonne NbColumn.
=============================================================================*/

getColumn(Grid, NbColumn, Column) :- nth1(NbColumn,Grid,Column). 
	
/*============================================================================
				Ajouter Element colone N
==============================================================================	
	- Grid : Grille à mettre à jour.
	- NbColumn : numéro de la colonne.
	- NewGrid : Grille mise à jour.
=============================================================================*/

addElement(Grid,NbColumn, NewGrid) :- .


