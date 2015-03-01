
/*###########################################################################
								GAMEPLAY
#############################################################################*/

:- module(gameplay2p, [jouerCoupX/2, jouerCoupO/2]).
:- use_module(grille).
:- use_module(liste).
:- use_module(fin_jeu).
	
/*============================================================================
					Joueur X r�el joue coup 
==============================================================================	
	- Grid : La grille � mettre � jour.
	- NoColumn : Numero de la colone � mettre � jour
=============================================================================

	 Cas ou la colonne renseign�e est en dehors des bornes  */
jouerCoupX(NoColumn,Grid)	:- 	NoColumn > 7,
								write('\n\t Entrez un num�ro de colonne entre 1 et 7\n'),
								displayCoupX(Grid).

	/* Cas ou la colonne renseign�e est pleine  */				
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
					Joueur O IA joue coup 
==============================================================================	
	- Grid : La grille � mettre � jour.
	- NoColumn : Numero de la colone � mettre � jour
=============================================================================



	 Cas ou la colonne renseign�e est en dehors des bornes  */
jouerCoupO(NoColumn,Grid)	:- 	NoColumn > 7,
								write('\n\t Entrez un num�ro de colonne entre 1 et 7\n'),
								displayCoupO(Grid).
		
	 /* Cas ou la colonne renseign�e est pleine  */				
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
														