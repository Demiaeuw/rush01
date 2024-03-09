% Définition des femmes 
femme(anne).
femme(betty).
femme(lisa).
femme(sylvie).
femme(eve).
femme(julie).
femme(valerie).

% Définition des hommes
homme(marc).
homme(luc).
homme(jean).
homme(jules).
homme(leon).
homme(loic).
homme(gerard).
homme(jacques).
homme(herve).
homme(paul).

% Définition des mari_de
mari_de(marc, anne).
mari_de(luc, betty).
mari_de(jules, lisa).
mari_de(leon, sylvie).
mari_de(loic, eve).
mari_de(paul, julie).

% Définition des femmes_de
femme_de(Femme, Homme) :- mari_de(Homme, Femme).

% Définition des parents_de
parent_de(marc, jean).
parent_de(anne, jean).
parent_de(marc, jules).
parent_de(anne, jules).
parent_de(marc, leon).
parent_de(anne, leon).
parent_de(luc, lisa).
parent_de(betty, lisa).
parent_de(luc, loic).
parent_de(betty, loic).
parent_de(luc, gerard).
parent_de(betty, gerard).
parent_de(jules, jacques).
parent_de(lisa, jacques).
parent_de(leon, herve).
parent_de(sylvie, herve).
parent_de(leon, julie).
parent_de(sylvie, julie).
parent_de(loic, paul).
parent_de(eve, paul).
parent_de(loic, valerie).
parent_de(eve, valerie).


% Définition des padré
pere_de(Pere, Enfant) :- 
	homme(Pere), 
	parent_de(Pere, Enfant).

% Définition des mère
mere_de(Mere, Enfant) :- 
	femme(Mere), 
	parent_de(Mere, Enfant).

% Définition des enfants
enfant_de(Enfant, Parent) :- 
	parent_de(Parent, Enfant).

% Définition des beaupere_de;
beaupere_de(BeauPere, Individu) :- 
	homme(Individu),
	pere_de(BeauPere, Conjoint), 
	femme_de(Conjoint, Individu);
	femme(Individu),
	pere_de(BeauPere, Conjoint),
	mari_de(Conjoint, Individu).

% Définition des bellemere_de
bellemere_de(BelleMere, Individu) :-
	homme(Individu),
	mere_de(BelleMere, Conjoint),
	femme_de(Conjoint, Individu);
	femme(Individu),
	mere_de(BelleMere, Conjoint),
	mari_de(Conjoint, Individu).