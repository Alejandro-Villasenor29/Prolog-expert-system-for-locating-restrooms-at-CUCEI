% Inicio del sistema experto
:- dynamic(si/1).
:- dynamic(no/1).

iniciar:-
    write('---- Recomendador de ba\xF1\os en CUCEI ----'),nl,
    write('Responde a las preguntas con "si." o con "no." para poder recomendarte un ba\xF1\o '),nl,
    write('----------------------------------'),nl,
    analisis(A),
    write(A),
    cerrar.

% Enfermedades
analisis(bano_modulo_alfa):- bano_modulo_alfa, !.
analisis(bano_modulo_beta):- bano_modulo_beta, !.
analisis(bano_biblioteca)  :- bano_biblioteca, !.
analisis(bano_auditorio_enrique_diaz_de_leon) :- bano_auditorio_enrique_diaz_de_leon, !.
analisis(bano_proulex_A_mano_derecha)  :- bano_proulex_A_mano_derecha, !.
analisis(bano_auditorio_antonio_rodriguez) :- bano_auditorio_antonio_rodriguez, !.
analisis(bano_mano_derecha_modulo_e)     :- bano_mano_derecha_modulo_e, !.
analisis(bano_modulo_i)   :- bano_modulo_i, !.
analisis(haste_aqui_mismo):- haste_aqui_mismo, !.

% Reglas de identificación
bano_modulo_alfa :-
    verificar('Te importa que el ba\xF1\o este limpio'),
    verificar('Te importa que el ba\xF1\o tenga buena infraestructura (que el piso y los asientos no esten rotos)'),
    verificar('Te importa que el ba\xF1\o tenga buenos insumos (papel de ba\xF1\o y jabon)'),
    verificar('Te importa la disponibilidad (si normalmente esta abierto)'),
    verificar('Estas cerca del modulo Alfa'),
    write('Te recomiendo ir al ba\xF1\o del modulo Alfa.'), nl.

bano_modulo_beta :-
    verificar('Te importa que el ba\xF1\o este limpio'),
    verificar('Te importa que el ba\xF1\o tenga buena infraestructura (que el piso y los asientos no esten rotos)'),
    verificar('Te importa que el ba\xF1\o tenga buenos insumos (papel de ba\xF1\o y jabon)'),
    verificar('Te importa la disponibilidad (si normalmente esta abierto)'),
    verificar('Estas cerca del modulo Beta'),
    write('Te recomiendo ir al ba\xF1\o del modulo Beta.'), nl.

bano_biblioteca :-
    verificar('Te importa que el ba\xF1\o este limpio'),
    verificar('Te importa que el ba\xF1\o tenga buenos insumos (papel de ba\xF1\o y jabon)'),
    verificar('Estas cerca de la Biblioteca o CID'),
    write('Te recomiendo ir al ba\xF1\o de la Biblioteca.'), nl.

bano_auditorio_enrique_diaz_de_leon :-
    verificar('Te importa que el ba\xF1\o este limpio'),
    verificar('Te importa que el ba\xF1\o tenga buenos insumos (papel de ba\xF1\o y jabon)'),
    verificar('Estas cerca del auditorio Enrique Diaz de Leon'),
    write('Te recomiendo ir al ba\xF1\o del auditorio Enrique Diaz de Leon.'), nl.

bano_proulex_A_mano_derecha :-
    verificar('Te importa que el ba\xF1\o tenga buena infraestructura (que el piso y los asientos no esten rotos)'),
    verificar('Te importa que el ba\xF1\o tenga buenos insumos (papel de ba\xF1\o y jabon)'),
    verificar('Te importa la disponibilidad (si normalmente esta abierto)'),
    verificar('Estas cerca de proulex o coordinacion academica?'),
    write('Te recomiendo ir al ba\xF1\o que esta a mano derecha de la entrada del modulo A.'), nl.

bano_auditorio_antonio_rodriguez :-
    verificar('Te importa que el ba\xF1\o este limpio'),
    verificar('Te importa que el ba\xF1\o tenga buena infraestructura (que el piso y los asientos no esten rotos)'),
    verificar('Estas cerca del auditorio Antonio Rodriguez'),
    write('Te recomiendo ir al ba\xF1\o a un lado del auditorio Antonio Rodriguez.'), nl.

bano_mano_derecha_modulo_e :-
    verificar('Te importa que el ba\xF1\o este limpio'),
    verificar('Te importa que el ba\xF1\o tenga buena infraestructura (que el piso y los asientos no esten rotos)'),
    verificar('Estas cerca del modulo E'),
    write('Te recomiendo ir al ba\xF1\o a mano derecha del modulo E.'), nl.

bano_modulo_i :-
    verificar('Estas cerca del modulo I'),
    write('Te recomiendo ir al ba\xF1\o del modulo I.'), nl.

haste_aqui_mismo :-
    write('Lo siento no hay ningun ba\xF1\os que cumpla tus estandares, recomendamos hacerte aqui mismo o bajar tus estandares'), nl.

% Reglas de preguntas y verificación
preguntar(Requisitos):-
    %write('Te importa alguna de las siguientes cosas a la hora de decidir si quieres ir al ba\xF1\os '), 
    write(Requisitos), write('?'), nl,
    read(Respuesta), nl,
    ((Respuesta == si; Respuesta == s) -> assertz(si(Requisitos)); assertz(no(Requisitos)), fail).

verificar(Requisitos):-
    (si(Requisitos) -> true; (no(Requisitos) -> fail; preguntar(Requisitos))).
    
% Cierre del sistema
cerrar :- retract(si(_)), fail.
cerrar :- retract(no(_)), fail.
cerrar.