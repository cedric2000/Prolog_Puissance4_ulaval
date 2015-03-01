
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
:- use_module(gameplay1p).
:- use_module(fin_jeu).
:- use_module(fonctionHeuristique).
:- use_module(ia).
:- use_module(etat).
:- use_module(arbre).

joue2	:- 	emptyGrid(G),
			displayGrid(G),
			displayCoupX(G).
	
test	:-	grid1(G),
			displayGrid(G),
			buidTree(G, State),
			write('State Finale : '),write(State),write('\n').			
	
t(N) :- (N>5 -> write('N>5');
			   write('N<5')).
			
emptyGrid(G):- G = [[],[],[],[],[],[],[]].
grid1(G1):- G1 =[	
					['X','O'],
					['X','X','X','X','O','O'],
					['X','X','O'],			
					['O'],
					['X','X'],
					['X','X'],
					['X']
				].
				
				
				
