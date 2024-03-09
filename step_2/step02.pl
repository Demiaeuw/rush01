% Définition des maisons
maison(M) :- member(M, [1,2,3,4,5]).

% Règles de l'énigme
% <-- n°maison , couleur , nationalité , boisson , cigarre , animal. -->
regles(Maisons) :-
	Maisons = [maison(1,_,norvegien,_,_,_), maison(2,bleu,_,_,_,_), maison(3,_,_,lait,_,_), maison(4,_,_,_,_,_), maison(5,_,_,_,_,_)],
	member(maison(_,rouge,anglais,_,_,_), Maisons),
	member(maison(_,_,suedois,_,_,chien), Maisons),
	member(maison(_,_,danois,the,_,_), Maisons),
	member(maison(_,vert,_,cafe,_,_), Maisons),
	member(maison(_,_,_,_,pallmall,oiseaux), Maisons),
	member(maison(_,jaune,_,_,danhill,_), Maisons),
	member(maison(_,_,_,bieres,bluemaster,_), Maisons),
	member(maison(_,_,allemand,_,prince,_), Maisons),
	member(maison(_,_,_,_,_,_), Maisons),
	member(maison(_,_,_,_,_,_), Maisons),
	member(maison(_,_,_,_,_,_), Maisons),
	member(maison(_,_,_,_,_,_), Maisons),
	member(maison(_,_,_,_,_,_), Maisons),
	member(maison(_,_,_,_,_,_), Maisons),
	member(maison(_,_,_,_,_,_), Maisons),
	member(maison(_,_,_,_,_,_), Maisons),
	member(maison(_,_,_,_,_,_), Maisons),
	member(maison(_,_,_,_,_,_), Maisons),
	member(maison(_,_,_,_,_,_), Maisons),
	member(maison(_,_,_,_,_,_), Maisons).

% append/3

% Résolution de l'énigme
resoudre :-
	regles(Maisons),
	member(maison(_,_,_,_,_,poisson), Maisons),
	write(Maisons), nl.
