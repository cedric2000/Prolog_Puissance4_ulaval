
/*###########################################################################
								GAMEPLAY
#############################################################################
Ensemble de prédicat permettant :
	- 
#############################################################################*/	

:- module(gameplay, [jouerCoupX/2, jouerCoupO/2]).
:- use_module(grille).
:- use_module(liste).
	
/*============================================================================
					Joueur X joue coup 
==============================================================================	
	- Grid : La grille à mettre à jour.
	- NoColumn : Numero de la colone à mettre à jour
=============================================================================

	 Cas ou la colonne renseignée est en dehors des bornes  */
jouerCoupX(NoColumn,Grid)	:- 	NoColumn > 7,
								write('\n\t Entrez un numéro de colonne entre 1 et 7\n'),
								displayCoupX(Grid).

	 /* Cas ou la colonne renseignée est pleine  */				
jouerCoupX(NoColumn,Grid)	:-  getColumn(NoColumn,Grid,Column),
								getSize(Column,N),
								N>5,
								write('\n\t La colone est pleine\n'),
								displayCoupX(Grid).

	 /* Cas ok */				
jouerCoupX(NoColumn,Grid)	:-	getColumn(NoColumn,Grid,Column),
								getSize(Column,N),
								N<6,
								addElementColumn(NoColumn, Grid, 'X', NewGrid),
								displayGrid(NewGrid),
								displayCoupO(NewGrid).
											



/*============================================================================
					Joueur O joue coup 
==============================================================================	
	- Grid : La grille à mettre à jour.
	- NoColumn : Numero de la colone à mettre à jour
=============================================================================

	 Cas ou la colonne renseignée est en dehors des bornes  */
jouerCoupO(NoColumn,Grid)	:- 	NoColumn > 7,
								write('\n\t Entrez un numéro de colonne entre 1 et 7\n'),
								displayCoupO(Grid).
		
	 /* Cas ou la colonne renseignée est pleine  */				
jouerCoupO(NoColumn,Grid)	:-	getColumn(NoColumn,Grid,Column),
								getSize(Column,N),
								N>5,
								write('\n\t La colone est pleine\n'),
								displayCoupO(Grid).

	 /* Cas ok */				
jouerCoupO(NoColumn,Grid)	:-	getColumn(NoColumn,Grid,Column),
								getSize(Column,N),
								N<6,
								addElementColumn(NoColumn, Grid, 'O', NewGrid),
								displayGrid(NewGrid),
								displayCoupX(NewGrid).
														