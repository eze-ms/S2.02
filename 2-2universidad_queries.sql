-- Consulta 1: Llistat alfabètic d'alumnes
SELECT apellido1 AS primer_apellido, apellido2 AS segundo_apellido, nombre
FROM persona
WHERE tipo = 'alumno'
ORDER BY apellido1, apellido2, nombre;

-- Consulta 2: Alumnes sense telèfon
SELECT apellido1 AS primer_apellido, apellido2 AS segundo_apellido, nombre
FROM persona
WHERE tipo = 'alumno' AND telefono IS NULL;

-- Consulta 3: Alumnes nascuts el 1999
SELECT apellido1 AS primer_apellido, apellido2 AS segundo_apellido, nombre, fecha_nacimiento
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- Consulta 4: Professors sense telèfon i NIF amb K
SELECT apellido1 AS primer_apellido, apellido2 AS segundo_apellido, nombre, nif
FROM persona
WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';

-- Consulta 5: Assignatures del primer quadrimestre
SELECT nombre AS nom_assignatura
FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- Consulta 6: Professors i departaments
SELECT 
    persona.apellido1 AS primer_apellido,
    persona.apellido2 AS segundo_apellido,
    persona.nombre AS nom_professor,
    departamento.nombre AS nom_departament
FROM persona
INNER JOIN departamento
ON persona.id = departamento.id
WHERE persona.tipo = 'profesor'
ORDER BY persona.apellido1, persona.apellido2, persona.nombre;

-- Consulta 7: Assignatures i anys del curs escolar per a un alumne
SELECT 
    asignatura.nombre AS nom_assignatura,
    curso_escolar.anyo_inicio AS any_inici,
    curso_escolar.anyo_fin AS any_fi
FROM alumno_se_matricula_asignatura
INNER JOIN asignatura 
    ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id
INNER JOIN curso_escolar 
    ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
INNER JOIN persona 
    ON alumno_se_matricula_asignatura.id_alumno = persona.id
WHERE persona.nif = '26902806M';

-- Consulta 8: Departaments amb professors d'Enginyeria Informàtica
SELECT DISTINCT departamento.nombre AS nom_departament
FROM departamento
INNER JOIN persona 
    ON departamento.id = persona.id
INNER JOIN asignatura 
    ON persona.id = asignatura.id_profesor
WHERE asignatura.id_grado = 4;

-- Consulta 9: Alumnes matriculats en el curs escolar 2018/2019
SELECT DISTINCT persona.nombre AS nom_alumne, persona.apellido1 AS primer_apellido, persona.apellido2 AS segon_apellido
FROM alumno_se_matricula_asignatura
INNER JOIN persona 
    ON alumno_se_matricula_asignatura.id_alumno = persona.id
INNER JOIN curso_escolar 
    ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019;

-- Consulta 10: Professors i departaments amb LEFT JOIN
SELECT 
    departamento.nombre AS nom_departament,
    persona.apellido1 AS primer_apellido,
    persona.apellido2 AS segon_apellido,
    persona.nombre AS nom_professor
FROM persona
LEFT JOIN departamento
    ON persona.id = departamento.id
WHERE persona.tipo = 'profesor'
ORDER BY departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre;

-- Consulta 11: Professors sense departament (RIGHT JOIN)
SELECT 
    persona.nombre AS nom_professor,
    persona.apellido1 AS primer_apellido,
    persona.apellido2 AS segon_apellido
FROM persona
LEFT JOIN departamento
    ON persona.id = departamento.id
WHERE persona.tipo = 'profesor' AND departamento.id IS NULL;

-- Consulta 12: Departaments sense professors
SELECT 
    departamento.nombre AS nom_departament
FROM departamento
LEFT JOIN persona
    ON departamento.id = persona.id
WHERE persona.id IS NULL;

-- Consulta 13: Professors sense assignatures
SELECT 
    persona.nombre AS nom_professor,
    persona.apellido1 AS primer_apellido,
    persona.apellido2 AS segon_apellido
FROM persona
LEFT JOIN asignatura
    ON persona.id = asignatura.id_profesor
WHERE persona.tipo = 'profesor' AND asignatura.id IS NULL;

-- Consulta 14: Assignatures sense professor assignat
SELECT 
    asignatura.nombre AS nom_assignatura
FROM asignatura
WHERE id_profesor IS NULL;

-- Consulta 15: Departaments sense assignatures impartides
SELECT DISTINCT departamento.nombre AS nom_departament
FROM departamento
LEFT JOIN persona
    ON departamento.id = persona.id
LEFT JOIN asignatura
    ON persona.id = asignatura.id_profesor
WHERE asignatura.id IS NULL;

-- Consulta 16: Nombre total d'alumnes que hi ha
SELECT COUNT(*) AS total_alumnes
FROM persona
WHERE tipo = 'alumno';

-- Consulta 17: Calcula quants alumnes van néixer en 1999
SELECT COUNT(*) AS alumnes_1999
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- Consulta 18: Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT departamento.nombre AS nom_departament, COUNT(persona.id) AS num_professors
FROM persona
INNER JOIN departamento
    ON persona.id = departamento.id
WHERE persona.tipo = 'profesor'
GROUP BY departamento.nombre
ORDER BY num_professors DESC;

-- Consulta 19: Listat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT departamento.nombre AS nom_departament, COUNT(persona.id) AS num_professors
FROM departamento
LEFT JOIN persona
    ON departamento.id = persona.id
WHERE persona.tipo = 'profesor' OR persona.tipo IS NULL
GROUP BY departamento.nombre;

-- Consulta 20: Llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT grado.nombre AS nom_grado, COUNT(asignatura.id) AS num_assignatures
FROM grado
LEFT JOIN asignatura
    ON grado.id = asignatura.id_grado
GROUP BY grado.nombre;

-- Consulta 21: Llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT grado.nombre AS nom_grado, COUNT(asignatura.id) AS num_assignatures
FROM grado
LEFT JOIN asignatura
    ON grado.id = asignatura.id_grado
GROUP BY grado.nombre
HAVING COUNT(asignatura.id) > 40;

-- Consulta 22: Llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus
SELECT grado.nombre AS nom_grado, asignatura.tipo AS tipus_assignatura, SUM(asignatura.creditos) AS suma_credits
FROM grado
INNER JOIN asignatura
    ON grado.id = asignatura.id_grado
GROUP BY grado.nombre, asignatura.tipo;

-- Consulta 23: Llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
SELECT curso_escolar.anyo_inicio AS any_inici, COUNT(DISTINCT alumno_se_matricula_asignatura.id_alumno) AS num_alumnes
FROM curso_escolar
INNER JOIN alumno_se_matricula_asignatura
    ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
GROUP BY curso_escolar.anyo_inicio;

-- Consulta 24: Llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id) AS num_assignatures
FROM persona
LEFT JOIN asignatura
    ON persona.id = asignatura.id_profesor
WHERE persona.tipo = 'profesor'
GROUP BY persona.id, persona.nombre, persona.apellido1, persona.apellido2
ORDER BY num_assignatures DESC;

-- Consulta 25: Totes les dades de l'alumne/a més jove.
SELECT *
FROM persona
WHERE tipo = 'alumno'
ORDER BY fecha_nacimiento DESC
LIMIT 1;

-- Consulta 26: Llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.
SELECT persona.nombre, persona.apellido1, persona.apellido2
FROM persona
INNER JOIN departamento
    ON persona.id = departamento.id
LEFT JOIN asignatura
    ON persona.id = asignatura.id_profesor
WHERE persona.tipo = 'profesor' AND asignatura.id IS NULL;



