% The Dundies

%consumoDeCafe/2 -> Empleado, Cant
consumoDeCafe(michael, 2).
consumoDeCafe(dwight,5).
consumoDeCafe(angela,1).
consumoDeCafe(jim,2).
consumoDeCafe(kevin,0).
consumoDeCafe(oscar,1).
consumoDeCafe(toby,30).
consumoDeCafe(phyllis,4).
consumoDeCafe(ryan,2).
consumoDeCafe(kelly,3).
consumoDeCafe(andy,3).
consumoDeCafe(stanley,4).
consumoDeCafe(meredith,1).
consumoDeCafe(erin,0).
consumoDeCafe(darryl,0).
consumoDeCafe(pam, 2).

%importancia/2 -> Dundie, Importancia
importancia(mejorJefeDelMundo,100).
importancia(sensei,5).
importancia(jimothy,10).
importancia(mejorPapa,15).
importancia(mejorMama,15).
importancia(masPequenia,10).
importancia(zapatosBlancos,30).
importancia(masAtractivoDeLaOficina,20).
importancia(mejorCoqueteo,10).
importancia(crucigrama,15).
importancia(peorVendedor,5).
importancia(abejaMasOcupada,10).
importancia(compromisoMasLargo,15).

% Punto 1
% Decimos que alguien toma mucho café cuando la cantidad de tazas al día es mayor a 10.

empleado(Alguien) :- consumoDeCafe(Alguien,_). % alguien que consume cafe -> es un empleado

tomoMuchoCafe(Persona) :-
    empleado(Persona),
    consumoDeCafe(Persona,Cantidad),
    Cantidad > 10.

% Punto 2
% gano/2 -> Empleado, Dundie que gano
ganoDundie(michael, mejorJefeDelMundo).
ganoDundie(meredith, mejorMama).
% Dwight NO ganó el premio al peor vendedor. --> NO me importa
ganoDundie(pam, zapatosBlancos).

ganoDundie(dwight, sensei).

ganoDundie(jim, jimothy).
ganoDundie(jim, mejorPapa).

ganoDundie(angela, masPequenia).
ganoDundie(ryan, masAtractivoDeLaOficina).
ganoDundie(kelly, mejorCoqueteo).
ganoDundie(stanley, crucigrama).
ganoDundie(oscar, peorVendedor).
ganoDundie(phyllis, abejaMasOcupada).

ganoDundie(meredith, compromisoMasLargo).

% Punto 3
nuncaGanoDundie(Alguien) :-
    empleado(Alguien),
    not(ganoDundie(Alguien,_)).

ganoMasDeUnaVez(Alguien) :-
    empleado(Alguien),
    ganoDundie(Alguien,Dundie1),
    ganoDundie(Alguien,Dundie2),
    Dundie1 \= Dundie2.

ganoExactamenteUnaVez(Alguien) :-
    empleado(Alguien),
    ganoDundie(Alguien,_),
    not(ganoMasDeUnaVez(Alguien)).

% Punto 4
puntaje(Alguien, Dundie, Puntaje) :-
    empleado(Alguien),
    consumoDeCafe(Alguien, Cantidad),
    ganoDundie(Alguien, Dundie),
    importancia(Dundie, Importancia),
    Puntaje is Cantidad * Importancia.

% Punto 5
% ¿Qué nombre tiene mi predicado? ganadorSupremo
% ¿Qué aridad tiene? ¿Qué estoy relacionando? /1 -> Empleado
% ¿Es un hecho, una regla? ¿Tiene muchas cláusulas? Necesito una regla

% NO existe alguien que tenga un puntaje mayor al empleado supremo!!

ganadorSupremo(EmpleadoSupremo) :-
    empleado(EmpleadoSupremo),
    ganoDundie(EmpleadoSupremo,Dundie),
    not(tienePuntajeMayor(_, EmpleadoSupremo)).  % es decir, ningun empleado cualquiera (_) tiene mas puntos que el empleado supremo

% Quiero saber si un empleado tiene mayor puntaje que otro
tienePuntajeMayor(EmpleadoMayor, EmpleadoMenor) :-
    empleado(EmpleadoMayor),
    empleado(EmpleadoMenor),
    puntaje(EmpleadoMayor, _, PuntajeMayor),
    puntaje(EmpleadoMenor, _, PuntajeMenor),
    PuntajeMayor > PuntajeMenor.