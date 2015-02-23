
/*###########################################################################
						LANCEUR
#############################################################################
Ensemble de prédicat permettant :
	- Lancer une partie en mode 2 joueur.
	- Lancer une partie en mode 1 joueur contre L'IA.
#############################################################################*/	

:- use_module(affichage).
:- use_module(grille).
:- use_module(liste).
:- use_module(gameplay).
:- use_module(fin_jeu).

joue2	:- 	emptyGrid(G),
			displayGrid(G),
			displayCoupX(G).

test	:-	grid1(G),
			isWinner(G,'X').

test1	:-	grid1(G1),
			isWinner(G1,'O').

test2	:-	grid1(G1),
			isWinner(G1,'X',6).
			


emptyGrid(G):- G = [[],[],[],[],[],[],[]].
grid1(G1):- G1 =[	
					['O','O','O','O','X','X'],				/*col 1*/
					[],									/*col 2*/
					['X'],								/*col 3*/
					['X','O','O'],						/*col 4*/
					['X','X'],							/*col 5*/
					['X'],									/*col 6*/
					['X']		
				].
				
