
/*###########################################################################
						Inteligence Artificielle
#############################################################################
Ensemble de prédicat permettant à l'intéligence artificielle de déterminer le
le prochain coup à jouer.
#############################################################################*/	


:- module(ia, [buidTree/2]).
:- use_module(grille).
:- use_module(liste).
:- use_module(etat).


/*============================================================================
					Joueur O IA joue coup 
==============================================================================	
	- Grid : La grille à mettre à jour.
	- NoColumn : Numero de la colone à mettre à jour
=============================================================================*/
				
jouerCoup(NoColumn,Grid,NewGrid,Joueur):-	
		getColumn(NoColumn,Grid,Column),
		getSize(Column,N),
		N<6,
		addElementColumn(NoColumn, Grid, Joueur, NewGrid).
					

/*============================================================================
				Constructuction d'un arbre de profondeur 3
==============================================================================	
	- Grid : La grille à analyser.
	- Tree : l'arbre remplis
=============================================================================*/

buidTree(Grid, Tree) :- 	State = [Grid,0,0,'X',[]],
							buildState(State,Tree).
							
buildStateMin(_, 1,_,[]).
buildStateMin(State, Nhauteur,NLargeur,Result) :-
		Nhauteur < 1,
		N1 is Nhauteur+1,
		
		getGrid(State,Grid),
		jouerCoup(NLargeur,Grid,NewGrid,'O'),
		getValState(NewGrid, 'O', Valor),
		State1 = [NewGrid,Valor,NLargeur,'O',[]],
		
		buildStateMax(State1,N1,1,Result1),
		addSubState(State1,Result1,State2),
		
		buildStateMax(State1,N1,2,Result2),
		addSubState(State2,Result2,State3),
		
		buildStateMax(State1,N1,3,Result3),
		addSubState(State3,Result3,State4),
		
		buildStateMax(State1,N1,4,Result4),
		addSubState(State4,Result4,State5),
		
		buildStateMax(State1,N1,5,Result5),
		addSubState(State5,Result5,State6),
		
		buildStateMax(State1,N1,6,Result6),
		addSubState(State6,Result6,State7),
		
		buildStateMax(State1,N1,7,Result7),
		addSubState(State7,Result7,Result).

		
buildStateMax(_, 1,_,[]).
buildStateMax(State, Nhauteur,NLargeur,Result ) :-
		Nhauteur < 1,
		N1 is Nhauteur+1,
		
		getGrid(State,Grid),
		jouerCoup(NLargeur,Grid,NewGrid,'X'),

		getValState(NewGrid, 'X', Valor),
		State1 = [NewGrid,Valor,NLargeur,'X',[]],
		buildStateMin(State1,N1,1,Result1),
		addSubState(State1,Result1,State2),
		
		buildStateMin(State1,N1,2,Result2),
		addSubState(State2,Result2,State3),
		
		buildStateMin(State1,N1,3,Result3),
		addSubState(State3,Result3,State4),
		
		buildStateMin(State1,N1,4,Result4),
		addSubState(State4,Result4,State5),
		
		buildStateMin(State1,N1,5,Result5),
		addSubState(State5,Result5,State6),
		
		buildStateMin(State1,N1,6,Result6),
		addSubState(State6,Result6,State7),
		
		buildStateMin(State1,N1,7,Result7),
		addSubState(State7,Result7,Result).
		
buildState(State,StateFinal) :-
		buildStateMax(State,0,1,Result1),
		addSubState(State,Result1,State2),
		
		buildStateMax(State,0,2,Result2),
		addSubState(State2,Result2,State3),
		
		buildStateMax(State,0,3,Result3),
		addSubState(State3,Result3,State4),
		
		buildStateMax(State,0,4,Result4),
		addSubState(State4,Result4,State5),
		
		buildStateMax(State,0,5,Result5),
		addSubState(State5,Result5,State6),
		
		buildStateMax(State,0,6,Result6),
		addSubState(State6,Result6,State7),
		
		buildStateMax(State,0,7,Result7),
		addSubState(State7,Result7,StateFinal).
		
