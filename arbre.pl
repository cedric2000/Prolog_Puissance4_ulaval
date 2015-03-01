
/*###########################################################################
							Arbre
#############################################################################
Ensemble de prédicat permettant de creer un arbre d'etat
#############################################################################*/	


:- module(arbre, [buidTree/2,getBestSubstate/3]).
:- use_module(grille).
:- use_module(liste).
:- use_module(etat).

/*============================================================================
				Constructuction d'un arbre de profondeur 2
==============================================================================	
	- Grid : La grille à analyser.
	- Tree : l'arbre remplis
=============================================================================*/

buidTree(Grid, Tree) :- 	State = [Grid,0,0,'X',[]],
							buidNextStatesMAX(Grid, 'X', State, Tree2,0),
							buidNextStatesMIN(Tree2,'O',FinalTree),
							Tree = FinalTree.

									
/*============================================================================
				Constructuction des sous-etat
==============================================================================	
Crée les sous état de l'état en entrée. (soit 7 au maximum)

	- Grid : La grille à analyser.
	- J : le joueur qui doit jouer le prochain coup
	- State : l'etat auquel on rajoute des sous arbres à chaque tour
	- Tree : L'abre finale.
	- N : Variable d'iteration.
=============================================================================*/	
							
buidNextStatesMAX(Grid, J, State, Tree,N ) :- 	
		N < 7,
		N1 is N+1,
		jouerCoup(N1,Grid,NewGrid,J),
		getValState(NewGrid, J, Valor),
		write(Valor),write('\n'),
		State2 = [NewGrid,Valor,N1,J,[]],
		addSubState(State, State2, NewState),
		buidNextStatesMAX(Grid, J, NewState, Tree, N1),!.
	
	/*cas ou la ligne courante est pleine*/
buidNextStatesMAX(Grid, J, State, Tree,N ) :- 	
		N < 7,
		N1 is N+1,
		getValState(Grid, J, Valor),
		State2 = [Grid,Valor,N1,J,[]],
		addSubState(State, State2, NewState),
		buidNextStatesMAX(Grid, J, NewState, Tree, N1),!.
		
	/*Cas d'arret*/	
buidNextStatesMAX(Grid, J, State, Tree,7 ) :- Tree = State.
		
		

/*============================================================================
			Constructuction des sous-etat des sous-etats
==============================================================================	
Crée les sous état de chaque sous etat. 

	- Grid : La grille à analyser.
	- J : le joueur qui doit jouer le prochain coup
	- State : l'etat auquel on rajoute des sous arbres à chaque tour
	- Tree : L'abre finale.
	- N : Variable d'iteration.
=============================================================================
		
	Initialisation */
buidNextStatesMIN(State,J,FinalTree) :- 
		getSubStates(State,SubStates),
		buidNextStatesMIN(SubStates, J,FinalSubStates,0),
		setSubStates(State,FinalSubStates,FinalTree).
						
	/*Cas basique*/				
buidNextStatesMIN(SubStates, J,FinalSubStates,N ) :-
		N < 7,
		N1 is N+1,
		getElement(N1,SubStates,State),
		getGrid(State,Grid),
		buidNextStatesMAX(Grid, 'O', State, Tree2,0),
		setElement(N1,SubStates,Tree2, NewSubStates),
		buidNextStatesMIN(NewSubStates, J,FinalSubStates,N1).
		
	/*Cas d'arret*/	
buidNextStatesMIN(SubStates, J,FinalSubStates,7) :- FinalSubStates = SubStates.
					
					

											
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
					Determine le meilleur sous Etat 
==============================================================================	
	- Grid : La grille à mettre à jour.
	- NoColumn : Numero de la colone à mettre à jour
=============================================================================*/												

getBestSubstate(Tree, J, BestStateResult) :- 
		getSubStates(Tree,SubStates),
		getBestSubstateForX(SubStates,J,0,BestStateResult,0).
		
		
getBestSubstateForX(SubStates, J, BestValorResult,BestStateResult, 7).
getBestSubstateForX(SubStates, J, BestValorResult,BestStateResult, N) :- 
		N < 7,
		N1 is N+1,	
		write('N1 :'),write(N1),write('\n'),
		getElement(N1,SubStates,StateCourant),
		getSubStates(StateCourant,SubStates2),
		getElement(1,SubStates2,FirstState),
		
		getBestSubstateForO(SubStates2, 'O', FirstState, BestSubState,0),
		write('BestSubState 1 : '),write(BestSubState),write('\n'),
		getValor(StateCourant,ValeurCourante),
		getValor(BestSubState,ValeurBestState),
		ResultCourant is ValeurCourante - ValeurBestState,
		(ResultCourant>BestValorResult -> 
			BestStateResult = StateCourant;
			BestStateResult=BestStateResult
		),
		getBestSubstateForX(SubStates, J, BestValorResult,BestStateResult, N1).

getBestSubstateForO(SubStates, J, PreviousBestState, BestState,7) :- BestState = PreviousBestState.
getBestSubstateForO(SubStates, J, PreviousBestState,BestState,N) :- 
		N < 7,
		N1 is N+1,	
		write('N2 :'),write(N1),write('\n'),
		getElement(N1,SubStates,State),
		write('Sous State O:'),write(State),write('\n'),
		getValor(State,ValeurCourante),
		write('PreviousBestState:'),write(PreviousBestState),write('\n'),
		getValor(PreviousBestState,ValeurBestState),
		(ValeurCourante>ValeurBestState -> 
			PreviousBestState = ValeurCourante;
			PreviousBestState=PreviousBestState
		),
		getBestSubstateForO(SubStates, J, PreviousBestState,BestState,7).

		