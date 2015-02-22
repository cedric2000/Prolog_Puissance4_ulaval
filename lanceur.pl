
:- use_module(affichage).
:- use_module(grille).

test	:- 	emptyGrid(G),displayGrid(G).	

test1	:-	grid1(G1),
			displayGrid(G1),
			addElementColumn(4,G1,'X', G2),
			displayGrid(G2),
			addElementColumn(3,G2,'X', G3),
			displayGrid(G3).

					
emptyGrid(G):- G = [[],[],[],[],[],[],[]].
grid1(G1):- G1 =[	
					[],				/*col 1*/
					[],				/*col 2*/
					['X'],			/*col 3*/
					['0','0','0'],	/*col 4*/
					['X','X'],		/*col 5*/
					[],				/*col 6*/
					[]		
				].
				
