% Nationalite, Couleur, Animal, Boisson, Fume
appartient_a(X, [X|_]).
appartient_a(X, [_|L]) :- appartient_a(X, L).

a_droite_de(A, B, [A, B|_]).
a_droite_de(A, B, [_|Y]) :- a_droite_de(A, B, Y).

a_cote_de(A, B, [A, B|_]).
a_cote_de(A, B, [B, A|_]).
a_cote_de(A, B, [_|Y]) :- a_cote_de(A, B, Y).

% Prédicat pour afficher une maison
afficher_maison(Numero, m(N, C, A, B, F)) :-
    write('Maison '), write(Numero), write(' : '), nl,
    write('  Nationalité : '), write(N), nl,
    write('  Couleur : '), write(C), nl,
    ->  write('\033[32m  Animal : \033[0m'), write(A), nl
    ;   write('  Animal : '), write(A), nl),
    write('  Boisson : '), write(B), nl,
    write('  Fume : '), write(F), nl.

% Prédicat pour afficher la liste de maisons
afficher_maisons([]).
afficher_maisons([Maison|Reste]) :-
    afficher_maison(Maison),
    nl,
    afficher_maisons(Reste).

% Prédicat pour afficher la liste de maisons avec numéro
afficher_maisons_numero([], _).
afficher_maisons_numero([Maison|Reste], Numero) :-
    afficher_maison(Numero, Maison),
    nl,
    NextNumero is Numero + 1,
    afficher_maisons_numero(Reste, NextNumero).

solve(Maisons) :-
    Maisons = [m(_, _, _, _, _),
               m(_, _, _, _, _),
               m(_, _, _, _, _),
               m(_, _, _, _, _),
               m(_, _, _, _, _)],
    appartient_a(m(anglais, rouge, _, _, _), Maisons), % L’Anglais vit dans la maison rouge.
    appartient_a(m(suedois, _, chiens, _, _), Maisons), % Le Suédois a des chiens.
    appartient_a(m(danois, _, _, the, _), Maisons), % Le Danois boit du thé.
    a_droite_de(m(_, verte, _, _, _), m(_, blanche, _, _, _), Maisons), % La maison verte est à gauche de la maison blanche.
    appartient_a(m(_, verte, _, cafe, _), Maisons), % Le propriétaire de la maison verte boit du café.
    appartient_a(m(_, _, oiseaux, _, pall_mall), Maisons), % La personne qui fume des Pall Mall a des oiseaux.
    appartient_a(m(_, jaune, _, _, dunhill), Maisons), % Le propriétaire de la maison jaune fume des Dunhill.
    Maisons = [_, _, m(_, _, _, lait, _), _, _], % La personne qui vit dans la maison du centre boit du lait.
    Maisons = [m(norvegien, _, _, _, _)|_], % Le Norvégien habite dans la première maison.
    a_cote_de(m(_, _, _,_, blend), m(_, _, chats, _, _), Maisons), % L’homme qui fume des Blend vit à côté de celui qui a des chats.
    a_cote_de(m(_, _, cheval, _, _), m(_, _, _, _, dunhill), Maisons), % L’homme qui a un cheval est le voisin de celui qui fume des Dunhill.
    appartient_a(m(_, _, _, biere, blue_master), Maisons), % Le propriétaire qui fume des Blue Master boit de la bière.
    appartient_a(m(allemand, _, _, _, prince), Maisons), % L’Allemand fume des prince.
    a_cote_de(m(norvegien, _, _, _, _), m(_, bleue, _, _, _), Maisons), %  Le Norvégien vit juste à côté de la maison bleue.
    a_cote_de(m(_, _, _, _, blend), m(_, _, _, eau, _), Maisons), % L’homme qui fume des Blend a un voisin qui boit de l’eau.
    appartient_a(m(_, _, poisson, _, _), Maisons), % Qui a le poisson ?
    % Affichage des maisons avec numéro
    afficher_maisons_numero(Maisons, 1).

