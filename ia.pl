
/*###########################################################################
						Inteligence Artificielle
#############################################################################
Ensemble de pr�dicat permettant � l'int�ligence artificielle de d�terminer le
le prochain coup � jouer.
#############################################################################*/	


:- module(ia, [chooseBestMove/2,buidTree2/2]).
:- use_module(grille).
:- use_module(liste).
:- use_module(etat).
:- use_module(arbre).

/*============================================================================
				Constructuction d'un arbre de profondeur 2
==============================================================================	
	- Grid : La grille � analyser.
	- J : Joueur qui doit jouer le prochain coup.
	- Tree : l'arbre remplis.
	- NoColone : La colonne ou il faut joueur le coup.
=============================================================================*/

chooseBestMove(Grid,NoColone) :- 	buidTree(Grid, Tree),
									write(Tree),
									getBestSubstate(Tree, 'X', BestStateResult),
									getNoColumn(Etat,NoColone).
	

/*============================================================================
					Joueur O IA joue coup 
==============================================================================	
	- Grid : La grille � mettre � jour.
	- NoColumn : Numero de la colone � mettre � jour
=============================================================================*/
				
jouerCoup(NoColumn,Grid,NewGrid,Joueur):-	
		getColumn(NoColumn,Grid,Column),
		getSize(Column,N),
		N<6,
		addElementColumn(NoColumn, Grid, Joueur, NewGrid).
					

/*============================================================================
				Constructuction d'un arbre de profondeur 2
==============================================================================	
	- Grid : La grille � analyser.
	- Tree : l'arbre remplis
=============================================================================*/


buidTree2(Grid, Tree) :- 	State = [Grid,0,0,'X',[]],
							write(State),write('\n'),
							buildState(State), 
							write(State).
							
buildStateMin(State, 2,NLargeur ).
buildStateMin(State, Nhauteur,NLargeur ) :-	
		N1 is Nhauteur+1,
		N1 < 2,
		getGrid(State,Grid),
		jouerCoup(NLargeur,Grid,NewGrid,'O'),
		getValState(NewGrid, 'O', Valor),
		State2 = [NewGrid,Valor,NLargeur,'O',[]],
		
		displayGrid(NewGrid),
		
		addSubState(State,State2,NewEtat),
		write('MIN\nN1 :'),write(N1),write('\n'),
		write('State :'),write(State),write('\n'),
		write('NewEtat :'),write(NewEtat),write('\n'),
		
		buildStateMax(State2,N1,1),
		buildStateMax(State2,N1,2),
		buildStateMax(State2,N1,3),
		buildStateMax(State2,N1,4),
		buildStateMax(State2,N1,5),
		buildStateMax(State2,N1,6),
		buildStateMax(State2,N1,7).

buildStateMax(State, 2,NLargeur ).	
buildStateMax(State, Nhauteur,NLargeur ) :-
		N1 is Nhauteur+1,
		N1 < 2,
		getGrid(State,Grid),
		
		jouerCoup(NLargeur,Grid,NewGrid,'X'),
		getValState(NewGrid, 'X', Valor),
		State2 = [NewGrid,Valor,NLargeur,'X',[]],
		
		displayGrid(NewGrid),
		
		addSubState(State,State2,NewEtat),
		
		write('MAX\nN1 :'),write(N1),write('\n'),
		write('State :'),write(State),write('\n'),
		write('NewEtat :'),write(NewEtat),write('\n'),
		
		buildStateMin(State2,N1,1),
		buildStateMin(State2,N1,2),
		buildStateMin(State2,N1,3),
		buildStateMin(State2,N1,4),
		buildStateMin(State2,N1,5),
		buildStateMin(State2,N1,6),
		buildStateMin(State2,N1,7).
		
buildState(State) :-
	buildStateMax(State,0,1),
	buildStateMax(State,0,2),
	buildStateMax(State,0,3),
	buildStateMax(State,0,4),
	buildStateMax(State,0,5),
	buildStateMax(State,0,6),
	buildStateMax(State,0,7).
		