
/*###########################################################################
						Liste
#############################################################################
Ensemble de prédicat permettant de géré une liste :
	- Ajouter un element en fin de liste.
	- Récupéré un element dans la liste
	- Mettre à jour un element dans la liste.
#############################################################################*/	

:- module(liste, [getElement/3,setElement/4,addElement/3,getSize/2,sublist/2]).
	
/*============================================================================
				Ajouter Element fin liste
==============================================================================	
	- List : List à mettre à jour.
	- Element : Element à ajouter.
	- NewList : Liste mise à jour.
=============================================================================*/

addElement(List,Element, NewList) 	:- 	getSize(List, N), 
										N<7,
										append(List,[Element], NewList). 

/*============================================================================
					Recupéré un element
==============================================================================	
	- Index : Index de l'element.
	- Liste : Liste de recherche.
	- Element : Retourne l'élément spécifier où une liste vide si il n'existe 
					pas
=============================================================================*/

getElement(Index,Liste, []):- getSize(Liste, N), Index > N.
getElement(Index,Liste, Element):- nth1(Index,Liste, Element).
	
	
/*============================================================================
					Modifier un element
==============================================================================	
Paramètres =
	- Index : Index de l'element.
	- Liste : Liste à modfier.
	- Element : L'élément à inséré dans la liste
	- NewList : Retourne la liste modifier
Algoritme = 
	- On supprime la valeur obsolète dans la grille
	- On ajoute la nouvelle valeur au même index.
=============================================================================*/

setElement(IndexModif,Liste,Element, NewList):- nth1(IndexModif,Liste,_,ListTmp), 
												nth1(IndexModif,NewList,Element,ListTmp).
																			
/*============================================================================
					Sous-liste coresspondante
==============================================================================	
Retourne Vrai si Liste contient l'element corespondant.
L'element doit etre une liste 
=============================================================================*/

prefix(P,Liste):-append(P,_,Liste).
sublist(SousListe,Liste):-prefix(SousListe,Liste).
sublist(SousListe,[_|Queu]):-sublist(SousListe,Queu).
																			
/*============================================================================
					Taille de la liste
==============================================================================	
	- SousListe : Queu de la liste courante
	- S : taille de la liste
=============================================================================*/

getSize([],0).
getSize([_|SousListe],S):- 	getSize(SousListe,S1),
							S is S1+1.