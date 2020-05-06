getSolution(S):-
    S=[1/_,2/_,3/_,4/_,5/_,6/_,7/_,8/_],
    solution(S).

getSolution(S, B):-
    S = B,
	listCount(S, Count),
	eight(Count),
    solution(S).

listCount([], 0):-!.   

listCount([_Head|Tail], Count):-
    listCount(Tail, TailCount),
    Count is TailCount + 1.

eight(8).

solution([]).

solution([X/Y | Others]) :-
    solution(Others),
    member(Y, [1, 2, 3, 4, 5, 6, 7, 8]),
    nokill(X/Y, Others).
         

nokill(_, []).        
       
nokill(X/Y, [X1/Y1 | Others]) :-
    Y =\= Y1,  
    Y1-Y =\= X1-X, 
    Y1-Y =\= X-X1,
    nokill(X/Y, Others).
