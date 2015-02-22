
/*###########################################################################
						LANCEUR
#############################################################################
Ensemble de prédicat permettant :
	- Lancer une partie en mode 2 joueur.
	- Lancer une partie en mode 1 joueur contre L'IA.
#############################################################################*/	

:- use_module(affichage).
:- use_module(grille).
:- use_module(gameplay).

jouer2P	:- 	emptyGrid(G),
			displayGrid(G),
			displayCoupX(G).

test	:-	grid1(G1),
			displayGrid(G1),
			displayCoupX(G1).

					
emptyGrid(G):- G = [[],[],[],[],[],[],[]].
grid1(G1):- G1 =[	
					['0','0','0','X','X'],				/*col 1*/
					[],									/*col 2*/
					['X'],								/*col 3*/
					['0','0','0'],						/*col 4*/
					['X','X'],							/*col 5*/
					[],									/*col 6*/
					[]		
				].
				
