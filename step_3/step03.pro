% Représentation des états
% Un état est représenté par [PositionPeon, PositionChèvre, PositionLoup, PositionChou]
% Les positions possibles sont 'gauche' et 'droite'
% 0 représente la rive gauche et 1 la rive droite
% Les entités présentes sur la rive gauche au début
initial([gauche, gauche, gauche, gauche]).

% Vérifier si l'état est valide
% L'état est valide si la chèvre et le chou ne sont pas ensemble sans surveillance
% et si la chèvre n'est pas avec le loup
valide([X, _, X, _]) :- !, fail. % Chèvre et loup ensemble sans surveillance
valide([X, X, _, _]) :- !, fail. % Chèvre et chou ensemble sans surveillance
valide(_).

% Mouvements possibles
% Peut-être vous pourriez également utiliser une approche avec des listes,
% mais pour simplifier, nous allons énumérer les mouvements possibles
% sous forme de prédicats uniques.
move([gauche, gauche, G, C], [droite, droite, G, C]).
move([gauche, G, gauche, C], [droite, G, droite, C]).
move([gauche, G, L, gauche], [droite, G, L, droite]).
move([gauche, gauche, L, C], [droite, droite, L, C]).
move([droite, droite, G, C], [gauche, gauche, G, C]).
move([droite, G, droite, C], [gauche, G, gauche, C]).
move([droite, G, L, droite], [gauche, G, L, gauche]).
move([droite, droite, L, C], [gauche, gauche, L, C]).

% Déplacement en bateau
% Pour chaque mouvement possible, vérifiez si l'état résultant est valide
% et si c'est le cas, déplacez-vous et affichez l'état
boat(X, Y) :- move(X, Y), valide(Y), write(Y), nl.

% Résolution du problème
% Utilisation de la récursion pour explorer tous les états possibles
solve(X, X).
solve(X, Y) :- boat(X, Z), solve(Z, Y).

% Prédicat d'arité 0 pour lancer le programme
main :- initial(State), solve(State, [droite, droite, droite, droite]).

% Exécution du programme
% Utilisez simplement le prédicat main pour résoudre le problème
% Il affichera les états successifs menant à la solution
