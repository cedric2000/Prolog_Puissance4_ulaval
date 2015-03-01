
/*###########################################################################
							Arbre
#############################################################################
Ensemble de pr�dicat permettant de creer un arbre d'etat
#############################################################################*/	


:- module(arbre, [buidTree/2]).
:- use_module(grille).
:- use_module(liste).
:- use_module(etat).

/*============================================================================
				Constructuction d'un arbre de profondeur 2
==============================================================================	
	- Grid : La grille � analyser.
	- Tree : l'arbre remplis
=============================================================================*/

buidTree(Grid, Tree) :- 	State = [Grid,0,0,'X',[]],
							buidNextStatesMAX(Grid, 'X', State, Tree2,0),
							buidNextStatesMIN(Tree2,'O',FinalTree),
							Tree = FinalTree.

									
/*============================================================================
				Constructuction des sous-etat
==============================================================================	
Cr�e les sous �tat de l'�tat en entr�e. (soit 7 au maximum)

	- Grid : La grille � analyser.
	- J : le joueur qui doit jouer le prochain coup
	- State : l'etat auquel on rajoute des sous arbres � chaque tour
	- Tree : L'abre finale.
	- N : Variable d'iteration.
=============================================================================*/	
							
buidNextStatesMAX(Grid, J, State, Tree,N ) :- 	
		N < 7,
		N1 is N+1,
		jouerCoup(N1,Grid,NewGrid,J),
		State2 = [NewGrid,0,N1,J,[]],
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
Cr�e les sous �tat de chaque sous etat. 

	- Grid : La grille � analyser.
	- J : le joueur qui doit jouer le prochain coup
	- State : l'etat auquel on rajoute des sous arbres � chaque tour
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
	- Grid : La grille � mettre � jour.
	- NoColumn : Numero de la colone � mettre � jour
=============================================================================*/
				
jouerCoup(NoColumn,Grid,NewGrid,Joueur):-	
		getColumn(NoColumn,Grid,Column),
		getSize(Column,N),
		N<6,
		addElementColumn(NoColumn, Grid, Joueur, NewGrid).
												
/*============================================================================
					Determine le meilleur sous Etat 
==============================================================================	
	- Grid : La grille � mettre � jour.
	- NoColumn : Numero de la colone � mettre � jour
=============================================================================*/												

getBestSubstate(Tree, J, State,7) :- 
		N < 7,
		N1 is N+1,	
		getElement(N1,SubStates,State),
		getGrid(State,Grid).	/*Pas Finis*/							