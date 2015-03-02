
/*###########################################################################
						ETAT
#############################################################################
Ensemble de pr�dicat permettant de g�r� un �tat.
Un �tat est mod�liser par une liste sous la forme :
	[ G , VH , NoCol, J, SubState]
Ou :
	- G est la Grille.
	- VH est la Valeur Heuristique.
	- NoCol est le num�ro de colone jou� pour arriv� � cet etat.
	- J est le joueur qui doit jou� le prochain coup.
	- SubState est la liste des �tats atteignable depuis l'�tat courant.
#############################################################################*/	

:- module(etat, [
					addSubState/3,
					
					getGrid/2,
					getValor/2,
					getNoColumn/2,
					getJoueur/2,
					getSubStates/2,

					setGrid/3,
					setValor/3,
					setNoColumn/3,
					setJoueur/3,
					setSubStates/3
				]).
:- use_module(etat).	
:- use_module(liste).
:- use_module(grille).


/*============================================================================
						Constructeur
==============================================================================*/

addSubState(Etat,[],NewEtat) :- NewEtat = Etat.
addSubState(Etat,SubState,NewEtat) 	:-  getSubStates(Etat,SubStates),
										append([SubState],SubStates,NewSubStates),
										setSubStates(Etat,NewSubStates,NewEtat).
										

										
/*============================================================================
						Accesseur
==============================================================================*/
getGrid(Etat,G) :- getElement(1,Etat,G).
getValor(Etat,V) :- getElement(2,Etat,V).
getNoColumn(Etat,NoColumn) :- getElement(3,Etat,NoColumn).
getJoueur(Etat,J) :- getElement(4,Etat,J).
getSubStates(Etat,SubStates) :- getElement(5,Etat,SubStates).

/*============================================================================
						Modificateur
==============================================================================*/
setGrid(Etat,G,NewEtat) :- setElement(1,Etat,Etat,G,NewEtat).
setValor(Etat,V,NewEtat) :- setElement(2,Etat,V,NewEtat).
setNoColumn(Etat,NoColumn,NewEtat) :- setElement(3,Etat,NoColumn,NewEtat).
setJoueur(Etat,J,NewEtat) :- setElement(4,Etat,J,NewEtat).
setSubStates(Etat,SubStates,NewEtat) :- setElement(5,Etat,SubStates,NewEtat).
										
	