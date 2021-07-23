% forward mutant 1. Does not check for positiv effects.
% Line 32.
                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This file must implements following predicates:
%% step(+State, -ActionDef, -NewState)
%%   Return descendant of State and ActionDefinition that was used.
%% is_goal(State) - is true when State is a goal state.  
%%      repeating(Goal1, Goal2):-  Goal1 is the same as Goal2.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-use_module(library(ordsets)).

make_init_state(I):-
                get_init(I),
                get_goal(G),
                bb_put(fictiveGoal, G).


make_solution(S, S).
                
%step(State, ActionDef, NewState):-
%               get_action(A, ActionDef),
%               get_precondition(A, P),    mysubset(P, State),  % choose suitable action
%               get_negativ_effect(A, NE), ord_subtract(State, NE, State2),     
%               get_positiv_effect(A, PE), ord_union(State2, PE, NewState).

step(State, ActionDef, NewState):-
                get_action(A, ActionDef),
                get_precondition(A, P1), sort(P1, P), mysubset(P, State),       % choose suitable action
                get_negativ_effect(A, NE1), sort(NE1, NE), ord_subtract(State, NE, NewState).
%                get_positiv_effect(A, PE1), sort(PE1, PE), ord_union(State2, PE, NewState).
%               print('State: '), print(State), nl,
%               print('Precondition: '), print(P), nl,
%               print('Positive effect: '), print(PE), nl,
%               print('Negative effect: '), print(NE), nl,
%               print('State2: '), print(State2), nl,
%               print('NewState: '), print(NewState), nl, nl.


is_goal(S):-
                get_goal(G),
                ord_subset(G, S).

repeating(S1, S2):-
                S1 =  S2.
                
