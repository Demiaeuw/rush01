% Définition de la fonction my_append/3
my_append([], L, L).
my_append([X|L1], L2, [X|L3]) :- my_append(L1, L2, L3).

% Définition des maisons
maison(M) :- member(M, [1,2,3,4,5]).

% Fonction next_to/3 utilisant my_append/3
next_to(House1, House2, [House1, House2|_]).
next_to(House1, House2, [_|Houses]) :- next_to(House1, House2, Houses).

% Règles de l'énigme
regles(Maisons) :-
    Maisons = [
        maison(1,_,norvegien,_,_,_),
        maison(2,bleu,_,_,_,_),
        maison(3,_,_,lait,_,_),
        maison(4,_,_,_,_,_),
        maison(5,_,_,_,_,_)
    ],
    % Autres règles...
    member(maison(_,rouge,anglais,_,_,_), Maisons),
    member(maison(_,_,suedois,_,_,chien), Maisons),
    member(maison(_,_,danois,the,_,_), Maisons),
    member(maison(_,vert,_,cafe,_,_), Maisons),
    member(maison(_,_,_,_,pallmall,oiseaux), Maisons),
    member(maison(_,jaune,_,_,dunhill,_), Maisons),
    member(maison(_,_,_,biere,bluemaster,_), Maisons),
    member(maison(_,_,allemand,_,prince,_), Maisons),
    next_to(maison(_,_,_,_,blend,_), maison(_,_,_,_,chat), Maisons),
    next_to(maison(_,_,_,_,_,cheval), maison(_,_,_,_,dunhill,_), Maisons),
    next_to(maison(_,_,_,eau,_,_), maison(_,_,_,_,blend,_), Maisons),
    next_to(maison(_,verte,_,_,_,_), maison(_,blanche,_,_,_,_), Maisons).

% Résolution de l'énigme
resoudre :-
    regles(Maisons),
    member(maison(_,_,_,_,_,poisson), Maisons),
    write(Maisons), nl.
