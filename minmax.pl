:- module(minimax, [minimax/3]).

% minimax(Pos, BestNextPos, Val)
% Pos is a position, Val is its minimax value.
% Best move from Pos leads to position BestNextPos.

% -------------------------------------------------------------------------------------------

% The minimax algorithm is recursive by nature. 
% The terminal case (second minimax rule) is triggered when the analyzed state (Pos) has no successors.
% In this case, the evaluation of the state is the utility of this leaf. 
% The recursive case (first minimax rule) is triggered when the analyzed state has successors. 
% In this case, minimax generates the list1 of all the successors obtained by applying 
% all the possible moves from Pos (NextPosList), and looks for the best successors in 
% this list (BestNextPos) with the best value (Val).

minimax(Pos, BestNextPos, Val) :-                     % Pos has successors
    bagof(NextPos, move(Pos, NextPos), NextPosList),
    best(NextPosList, BestNextPos, Val), !.

minimax(Pos, _, Val) :-                     % Pos has no successors
    utility(Pos, Val).
	
% !!!! Notice that rules utility and move are problem-dependent, and will need to be defined
% 		when implementing a particular game. However, we can define the best predicate	

% ---------------------------------------------------------------------------------------------

best([Pos], Pos, Val) :-                                % There is no more position to compare
    minimax(Pos, _, Val), !.

best([Pos1 | PosList], BestPos, BestVal) :-             % There are other positions to compare
    minimax(Pos1, _, Val1),
    best(PosList, Pos2, Val2),
    betterOf(Pos1, Val1, Pos2, Val2, BestPos, BestVal).
	
% ----------------------------------------------------------------------------------------------
	
betterOf(Pos0, Val0, _, Val1, Pos0, Val0) :-   % Pos0 better than Pos1
    min_to_move(Pos0),                         % MIN to move in Pos0
    Val0 > Val1, !.                            % MAX prefers the greater value

betterOf(Pos0, Val0, _, Val1, Pos0, Val0) :-   % Pos0 better than Pos1
    max_to_move(Pos0),                         % MAX to move in Pos0
    Val0 < Val1, !.                            % MIN prefers the lesser value

betterOf(_, _, Pos1, Val1, Pos1, Val1).        % Otherwise Pos1 better than Pos0