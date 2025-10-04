% --- Materias (4 clases) ---
materia(introduccion_programacion).
materia(programacion_avanzada).
materia(calculo1).
materia(calculo2).

% --- Cursos aprobados (Alumnos nuevos) ---
aprobada(kevin, introduccion_programacion).
aprobada(kevin, calculo1).

aprobada(fabiana, introduccion_programacion).
aprobada(fabiana, programacion_avanzada).
aprobada(fabiana, calculo1).

aprobada(miguel, calculo1).

aprobada(armando, introduccion_programacion).

% --- Requisitos ---
requisito(programacion_avanzada, introduccion_programacion).
requisito(calculo2, calculo1).

% --- Estados de los cursos ---
estado_curso(Alumno, Curso, ya_aprobado) :-
    aprobada(Alumno, Curso).

estado_curso(Alumno, Curso, puede_cursar) :-
    materia(Curso),
    \+ aprobada(Alumno, Curso),
    forall(requisito(Curso, Pre), aprobada(Alumno, Pre)).

estado_curso(Alumno, Curso, no_puede) :-
    materia(Curso),
    \+ aprobada(Alumno, Curso),
    (requisito(Curso, Pre), \+ aprobada(Alumno, Pre)).

% --- Requisitos faltantes ---
faltan(Alumno, Curso, X) :-
    findall(Pre, (requisito(Curso, Pre), \+ aprobada(Alumno, Pre)), X).
