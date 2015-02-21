
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

:- module(grille, [getLine/3,getColumn/3]).
	
/*============================================================================
					R�cup�r� une ligne de la grille
==============================================================================	
	- Grid : Grille � analyser.
	- NbLine : num�ro de la ligne.
	- Line : List compos� des elements de la ligne NbLine.
=============================================================================*/

getLine(Grid, NbLine, Line) :- maplist(nth1(NbLine), Grid, Line).

/*============================================================================
						R�cup�r� une colonne de la grille
==============================================================================	
	- Grid : Grille � mettre � jour.
	- NbColumn : num�ro de la colonne.
	- Column : List compos� des elements de la colonne NbColumn.
=============================================================================*/

getColumn(Grid, NbColumn, Column) :- nth1(NbColumn,Grid,Column). 
	
/*============================================================================
				Ajouter Element colone N
==============================================================================	
	- Grid : Grille � mettre � jour.
	- NbColumn : num�ro de la colonne.
	- NewGrid : Grille mise � jour.
=============================================================================*/

addElement(Grid,NbColumn, NewGrid) :- .


