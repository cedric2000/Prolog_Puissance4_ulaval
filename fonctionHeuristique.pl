
/*###########################################################################
						Fonction Heuristique
#############################################################################
Ensemble de prédicat permettant d'obtenir la valor de la fonction heuristique
	pour une grille.
Les valeurs sont attribuer selon ces critères :
	Sur une ligne :
		- [J,J,J,J] +1000000 Combinaison gagnante
		- [J,J,J,_] +500 
		- [_,J,J,J] +500 
		- [_,J,J,_] +200 
		- [J,J,_,_] +200 
		- [_,_,J,J] +200 
	Sur une colonne :
		- [J,J,J,J] +1000000 Combinaison gagnante
		- [J,J,J,_] +500 Combinaison gagnante
		- [J,J,_] +200 Combinaison gagnante
#############################################################################*/	


:- module(fonctionHeuristique, [getValState/3]).
:- use_module(grille).
:- use_module(liste).

/*============================================================================
					Determine la Valeur Heuristique
==============================================================================	
	- Grid : La grille à analyser.
	- J : Le joueur dont on calcul la valeur heuristique.
	- Valor : La valeur heuristique.
=============================================================================*/

getValState(Grid, J, Valor):- 	getValLines(Grid,J,ValorLine),
								getValColumns(Grid,J,ValorColumn),
								plus(ValorLine,ValorColumn,Valor).

							
/*============================================================================
			Détermine la valeur Heuristique sur les lignes
==============================================================================	
	- Grid : La grille à analyser.
	- J : Le joueur dont on calcul la valeur heuristique
	- OldValor : Valeur courante de la valeur heuristique.
	- NewValor : Valeur heuristique mise à jour car un pattern à été trouvé.
	- N : Indice de la ligne courante.
=============================================================================						
	
	Parcours de la grille selon les lignes*/	
getValLines(Grid, J, Valor) :- getValLines(Grid, J, 0, Valor,7).

getValLines(_, _, ValorInit,ValorFinal, 0) :- ValorFinal is ValorInit.
getValLines(Grid, J, ValorInit,ValorFinal, N):- N > 0,
												N1 is N-1,
												getLine(N,Grid,Line),
												getValLine(Line,J, AddValor),
												plus(ValorInit,AddValor,NewValor),
												getValLines(Grid,J, NewValor, ValorFinal, N1).
												
	/*Sur la ligne courante : 4 pion succesif*/		
getValLine(Line, J, Valor):- 	sublist([J,J,J,J], Line),
								Valor = 1000000, !.
												
												
	/*Sur la ligne courante : 3 pion succesif, possibilité d'en rajouté 1 à droite*/	
getValLine(Line, J, Valor):- 	sublist([J,J,J,[]], Line),
								Valor = 500, !.						

	/*Sur la ligne courante : 3 pion succesif, possibilité d'en rajouté 1 à gauche*/												
getValLine(Line, J, Valor)	:- 	sublist([[],J,J,J], Line),
								Valor = 500, ! .							
													
												
	/*Sur la ligne courante : 2 pion succesif, possibilité d'en rajouté 2 à droite*/	
getValLine(Line, J, Valor)	:- 	sublist([J,J,[],[]], Line),
								Valor = 200, !.												

	/*Sur la ligne courante : 2 pion succesif, possibilité d'en rajouté 2 à gauche*/												
getValLine(Line, J, Valor)	:- 	sublist([[],[],J,J], Line),
								Valor = 200,!.												

	/*Sur la ligne courante : 2 pion succesif, possibilité d'en rajouté 1 à gauche et 1 à droite*/												
getValLine(Line, J, Valor)	:- 	sublist([[],J,J,[]], Line),
								Valor = 200,!.		
								
getValLine(Line, J, Valor)	:- 	sublist([[],J,J,[],J], Line),
								Valor = 200,!.
								
getValLine(_, _, 0).	
									
/*============================================================================
			Détermine la valeur Heuristique sur les colonnes
==============================================================================	
	- Grid : La grille à analyser.
	- J : Le joueur dont on calcul la valeur heuristique
	- ValorInit : Valeur courante de la valeur heuristique.
	- ValorFinal : Valeur heuristique mise à jour car un pattern à été trouvé.
	- N : Indice de la ligne courante.
=============================================================================							
															
	Parcours de la grille selon les colonne*/	
getValColumns(Grid, J, Valor) :- getValColumns(Grid, J, 0, Valor,7).

getValColumns(_, _, ValorInit,ValorFinal, 0) :- ValorFinal is ValorInit.
getValColumns(Grid, J, ValorInit,ValorFinal, N)	:-  N > 0,
													N1 is N-1,
													getColumn(N,Grid,Column),
													getValColumn(Column,J, AddValor),
													plus(ValorInit,AddValor,NewValor),
													getValColumns(Grid,J, NewValor, ValorFinal, N1).
												
												
	/*Sur la colonne courante : 4 pion succesif*/		
getValColumn(Column, J, Valor)	:- 	sublist([J,J,J,J], Column),
									Valor = 1000000,
									!.
												
												
	/*Sur la colonne courante : 3 pion succesif, possibilité d'en rajouté 1 au dessus*/								
getValColumn(Column, 'X', Valor):- 	sublist(['X','X','X'], Column),
									not(sublist(['X','X','X','O'], Column)),
									Valor = 500,
									!.										
												
getValColumn(Column, 'O', Valor):- 	sublist(['O','O','O'], Column),
									not(sublist(['O','O','O','X'], Column)),
									Valor = 500,
									!.
										
										
	/*Sur la colonne courante : 2 pion succesif, possibilité d'en rajouté 1 au dessus*/	
getValColumn(Column, 'X', Valor):- 	sublist(['X','X'], Column),
									not(sublist(['X','X','O'], Column)),
									Valor = 200,!.		
		
getValColumn(Column, 'O', Valor):- 	sublist(['O','O'], Column),
									not(sublist(['O','O','X'], Column)),
									Valor = 200,!.					

getValColumn(_, _, 0).	