/* Arvore Genealogica de Familias da Mafia e simulador de combates */

:- dynamic iniciar/1, meuPersonagem/1, oponente/1.

/* Debug de predicados dinamicos */

debug :- listing(iniciar), listing(meuPersonagem), listing(oponente).

/* Operadores */

:-op(900,xfx,[tem, representa,eh]).

/* Loop recursivo para limpar a tela*/

clear(0).
clear(N) :- N>0,nl,M is N-1, clear(M).

/* Cabeçalho */

cabecalho :-
        nl,
        write('Feito Utilizando SWI-Prolog'),nl,
        nl,
        write('Desenvolvedores:'),nl,
        write('Matheus Mello'),nl,
        write('Fagner Rodrigues'),nl,
        write('Edson Gomes'),nl,
        nl.

manual :-
        nl,
        write('Escolha a familia:'),nl,
        write('familia(corleone). ou familia(cordopatri).'),nl,
        nl.

/* Familias */

familia(cordopatri) :-
        nl,
        write('A familia Cordopatri foi quem espalhou a mafia para os EUA era conhecida pela alta venda de armas'),nl,
        write('Escolha agora um membro da familia:'),nl,
        write('membro(arcangeloCordopatri).'),nl,
        write('membro(giuseppinaCordopatri).'),nl,
        write('membro(mariellaCordopatri).'),nl,
        nl.

familia(corleone) :-
        nl,
        write('Familia Corleone fundada e controlada por Vito Corleone. Foi e ainda eh uma das organizacoes criminosas mais temida e poderosa de todos os tempos'),nl,
        write('Escolha agora um membro da familia:'),nl,
        write('membro(vitoCorleone).'),nl,
        write('membro(carmellaCorleone).'),nl,
        write('membro(michaelCorleone).'),nl,
        nl.

/* membros */

membro(vitoCorleone) :-
        nl,
        write('Voce eh Vito Corleone, conhecido como Don Corleone, poderoso chefao da mafia Corleone'),nl,
        write('Vito Corleone possui uma pistola Glock e 150 Pontos de Vida'),nl,
        assert(meuPersonagem(vitoCorleone)),
        oponente(cordopatri),
        nl.

membro(carmellaCorleone) :-
        nl,
        write('Voce eh Carmella Corleone, mulher e braço direitoo de Vito Corleone, tambem conhecida como chefinha'),nl,
        write('Carmela Corleone possui uma faca e 200 pontos de vida'),nl,
        assert(meuPersonagem(carmellaCorleone)),
        oponente(cordopatri),
        nl.

membro(michaelCorleone) :-
        nl,
        write('Voce eh Michael Corleone, filho de Carmella e Vito, Michael eh o menino de ouro da Mafia Corleone'),nl,
        write('Michael Corleone possui uma pistola Colt e 100 pontos de vida'),nl,
        assert(meuPersonagem(michaelCorleone)),
        oponente(cordopatri),
        nl.

membro(arcangeloCordopatri) :-
        nl,
        write('Voce eh Arcangelo Cordopatri, Italiano que aos 30 anos foi para os Estados Unidos e hoje eh conhecido como Mestre das Armas'),nl,
        write('Arcangelo Cordopatri possui uma AK-47 e 100 pontos de vida'),nl,
        assert(meuPersonagem(arcangeloCordopatri)),
        oponente(corleone),
        nl.

membro(giuseppinaCordopatri) :-
        nl,
        write('Voce eh Giuseppina Cordopatri, que ainda mantém o renomado nome da familia Cordopatri, dominando o cartel de armas na Italia'),nl,
        write('Giuseppina Cordopatri possui uma pistola Colt e 150 pontos de vida'),nl,
        assert(meuPersonagem(giuseppinaCordopatri)),
        oponente(corleone),
        nl.

membro(mariellaCordopatri) :-
        nl,
        write('Voce eh Mariella Cordopatri, irma de Arcangelo, Mariella parece nao seguir os passos do irmao e fez sua fama como organizadora do maior torneio de Luta Livre Ilegal dos EUA'),nl,
        write('Mariella Cordopatri luta com a mae e possui 300 pontos de vida'),nl,
        assert(meuPersonagem(mariellaCordopatri)),
        oponente(corleone),
        nl.

/* Gerando Oponente Randomico */

oponente(corleone) :-
        X is random(3),
        oponenteCorleone(X).

oponente(cordopatri) :-
        X is random(3),
        oponenteCordopatri(X).

/* Oponente Cordopatri */

oponenteCordopatri(0):-
        meuPersonagem(X),
        combate(X,arcangeloCordopatri).

oponenteCordopatri(1):-
        meuPersonagem(X),
        combate(X,giusepinnaCordopatri).

oponenteCordopatri(2):-
        meuPersonagem(X),
        combate(X,mariellaCordopatri).


/* Oponente Corleone */

oponenteCordopatri(0):-
        meuPersonagem(X),
        combate(X,vitoCorleone).

oponenteCordopatri(1):-
        meuPersonagem(X),
        combate(X,carmellaCorleone).

oponenteCordopatri(2):-
        meuPersonagem(X),
        combate(X,michaelCorleone).

combate(X,Y).



/* predicado que iniciará o programa */

start :-
        cabecalho,
        manual.

:- retractall(iniciar(_)), start.



/*
/* Familia Corleone */

ascendente(vitoCorleone,michaelCorleone).
ascendente(carmellaCorleone,michaelCorleone).
ascendente(vitoCorleone,sonnyCorleone).
ascendente(carmellaCorleone,sonnyCorleone).
ascendente(sonnyCorleone,dominicCorleone).
ascendente(michaelCorleone,fredoCorleone).

vitoCorleone eh homem.
carmellaCorleone eh mulher.
michaelCorleone eh homem.
sonnyCorleone eh mulher.
dominicCorleone eh mulher.
fredoCorleone eh homem.

vitoCorleone representa FamiliaCorleone.
carmellaCorleone representa FamiliaCorleone.
michaelCorleone representa FamiliaCorleone.
sonnyCorleone representa FamiliaCorleone.
dominicCorleone representa FamiliaCorleone.
fredoCorleone representa FamiliaCorleone.

vitoCorleone tem glock.
vitoCorleone tem vida = 100.
carmellaCorleone tem faca.
carmellaCorleone tem vida = 100.

vitoCorleone tem aparencia = ('oasjdasd',nl,'akadkas').

/* Familia Cordopatri */

ascendente(arcangeloCordopatri,giuseppinaCordopatri).
ascendente(mariellaCordopatri,giuseppinaCordopatri).
ascendente(arcangeloCordopatri,francescoCordopatri).
ascendente(mariellaCordopatri,francescoCordopatri).
ascendente(giuseppinaCordopatri,avoccatoCordopatri).
acendente(francescoCordopatri,lauraCordopatri).

arcangeloCordopatri eh homem.
giuseppinaCordopatri eh mulher.
mariellaCordopatri eh mulher.
francescoCordopatri eh homem.
avoccatoCordopatri eh homem.
lauraCordopatri eh mulher.

arcangeloCordopatri representa FamiliaCordopatri.
giuseppinaCordopatri representa FamiliaCordopatri.
mariellaCordopatri representa FamiliaCordopatri.
francescoCordopatri representa FamiliaCordopatri.
avoccatoCordopatri representa FamiliaCordopatri.
lauraCordopatri representa FamiliaCordopatri.

arcangeloCordopatri tem taurus.
arcangeloCordopatri tem vida = 100.
giuseppinaCordopatri tem adaga.
giuseppinaCordopatri tem vida = 100.

/* Armas */

glock tem dano = 3.
faca tem dano = 1.5.
adaga tem dano = 1.5.
taurus tem dano = 2.5.

/* Regras de Genealogia */

avo_f(X,Y):- X eh mulher, ascendente(Z,Y),ascendente(X,Z).
avo_m(X,Y):- X eh homem, ascendente(Z,Y), ascendente(X,Z).
pai(X,Y):- X eh homem, ascendente(X,Y).
mae(X,Y):- X eh mulher, ascendente(X,Y).
filho(X,Y):- X eh homem, ascendente(Y,X).
filha(X,Y):- X eh mulher, ascendente(Y,X).
neto(X,Y):- X eh homem, (avo_f(Y,X);avo_m(Y,X)).
neta(X,Y):- X eh mulher, (avo_f(Y,X);avo_m(Y,X)).

/* Funções */


/* Combate */

/* combate(X,Y) :- write(X),write('                        '),write(Y),nl,nl, */
/*               write('\o/'),write('                            '),write('\o/'),nl. */



combate(X,Y) :- clear(5),sleep(3),write(X),sleep(2),clear(5).*/











































