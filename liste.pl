
/*###########################################################################
						Liste
#############################################################################
Ensemble de pr�dicat permettant de g�r� une liste :
	- Ajouter un element en fin de liste.
	- R�cup�r� un element dans la liste
	- Mettre � jour un element dans la liste.
#############################################################################*/	

:- module(liste, [getElement/3,setElement/4,addElement/3,getSize/2,sublist/2]).
	
/*============================================================================
				Ajouter Element fin liste
==============================================================================	
	- List : List � mettre � jour.
	- Element : Element � ajouter.
	- NewList : Liste mise � jour.
=============================================================================*/

addElement(List,Element, NewList) 	:- 	getSize(List, N), 
										N<7,
										append(List,[Element], NewList). 

/*============================================================================
					Recup�r� un element
==============================================================================	
	- Index : Index de l'element.
	- Liste : Liste de recherche.
	- Element : Retourne l'�l�ment sp�cifier o� une liste vide si il n'existe 
					pas
=============================================================================*/

getElement(Index,Liste, []):- getSize(Liste, N), Index > N.
getElement(Index,Liste, Element):- nth1(Index,Liste, Element).
	
	
/*============================================================================
					Modifier un element
==============================================================================	
Param�tres =
	- Index : Index de l'element.
	- Liste : Liste � modfier.
	- Element : L'�l�ment � ins�r� dans la liste
	- NewList : Retourne la liste modifier
Algoritme = 
	- On supprime la valeur obsol�te dans la grille
	- On ajoute la nouvelle valeur au m�me index.
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