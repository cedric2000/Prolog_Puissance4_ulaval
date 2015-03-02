
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
:- use_module(fonctionHeuristique).
:- use_module(ia).
:- use_module(etat).

joue2	:- 	emptyGrid(G),
			displayGrid(G),
			displayCoupX(G).
			
	
test	:-	grid1(G),
			displayGrid(G),
			buidTree(G, Tree),
			write(Tree).	
	
			
emptyGrid(G):- G = [[],[],[],[],[],[],[]].
grid1(G1):- G1 =[	
					[],
					['O'],
					['X','X'],			
					['O'],
					['O'],
					[],
					[]
				].
				
				
				
