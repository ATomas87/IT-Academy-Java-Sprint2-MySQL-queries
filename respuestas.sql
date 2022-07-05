-- Llista el nom de tots els productes que hi ha en la taula producto.
SELECT nombre FROM tienda.producto;
-- Llista els noms i els preus de tots els productes de la taula producto.
SELECT nombre, precio FROM tienda.producto;
-- Llista totes les columnes de la taula producto.
SELECT * FROM tienda.producto;
-- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
SELECT nombre, precio, round(precio/1.21,2) precio FROM tienda.producto;
-- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.
SELECT nombre 'nom de producto' , precio euros, round(precio/1.21,2) dòlars FROM tienda.producto;
-- Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
SELECT upper(nombre), precio FROM tienda.producto;
-- Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.
SELECT lower(nombre), precio FROM tienda.producto;
-- Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, upper(left(nombre,2)) codigo FROM tienda.fabricante;
-- Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
SELECT nombre, round(precio) FROM tienda.producto;
-- Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre, truncate(precio, 0) FROM tienda.producto;
-- Llista el codi dels fabricants que tenen productes en la taula producto.
SELECT codigo_fabricante FROM tienda.producto;
-- Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
SELECT DISTINCT codigo_fabricante FROM tienda.producto;
-- Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre FROM tienda.fabricante ORDER BY nombre ASC;
-- Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre FROM tienda.fabricante ORDER BY nombre DESC;
-- Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
SELECT nombre, precio FROM tienda.producto ORDER BY nombre ASC, precio DESC;
-- Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT * FROM tienda.fabricante LIMIT 5;
-- Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM tienda.fabricante LIMIT 4, 2;
-- Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
SELECT * FROM tienda.producto ORDER BY precio ASC LIMIT 1;
-- Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT * FROM tienda.producto ORDER BY precio DESC LIMIT 1;
-- Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
SELECT * FROM tienda.producto WHERE codigo_fabricante=2;
-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT p.nombre, p.precio, f.nombre fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante=f.codigo;
-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
SELECT p.nombre, p.precio, f.nombre fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante=f.codigo ORDER BY f.nombre ASC;
-- Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
SELECT p.codigo, p.nombre, p.codigo_fabricante, f.nombre fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante=f.codigo;
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT p.nombre, p.precio, f.nombre fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante=f.codigo ORDER BY p.precio ASC LIMIT 1;
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT p.nombre, p.precio, f.nombre fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante=f.codigo ORDER BY p.precio DESC LIMIT 1;
-- Retorna una llista de tots els productes del fabricant Lenovo.
SELECT * FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante=f.codigo WHERE f.nombre='Lenovo';
-- Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
SELECT * FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante=f.codigo WHERE f.nombre='Crucial' WHERE p.precio > 200;
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.
SELECT * FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante=f.codigo WHERE (f.nombre='Asus' OR f.nombre='Hewlett-Packard' OR f.nombre='Seagate');
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Fent servir l'operador IN.
SELECT * FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante=f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT p.nombre, p.precio, f.nombre fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante=f.codigo WHERE f.nombre LIKE '%e';
-- Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
SELECT p.nombre, p.precio, f.nombre fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante=f.codigo WHERE f.nombre LIKE '%w%';
-- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
SELECT p.nombre, p.precio, f.nombre fabricante FROM tienda.producto p JOIN tienda.fabricante f ON p.codigo_fabricante=f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;
-- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT DISTINCT f.codigo, f.nombre FROM tienda.fabricante f RIGHT JOIN tienda.producto p ON f.codigo = p.codigo_fabricante;
-- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT f.codigo, f.nombre, p.nombre FROM tienda.fabricante f LEFT JOIN tienda.producto p ON f.codigo = p.codigo_fabricante;
-- Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT f.codigo, f.nombre, p.nombre FROM tienda.fabricante f LEFT JOIN tienda.producto p ON f.codigo = p.codigo_fabricante WHERE p.nombre IS NULL;
-- Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
SELECT p.nombre, p.precio, f.nombre fabricante FROM tienda.fabricante f LEFT JOIN tienda.producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo';
-- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).
SELECT * FROM tienda.producto WHERE precio = (SELECT MAX(p.precio) FROM tienda.producto p LEFT JOIN tienda.fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo');
-- Llista el nom del producte més car del fabricant Lenovo.
SELECT p.nombre FROM tienda.producto p LEFT JOIN tienda.fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1;
-- Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT p.nombre FROM tienda.producto p LEFT JOIN tienda.fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Hewlett-Packard' ORDER BY p.precio ASC LIMIT 1;
-- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
-- Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.

-- Base de dades Universidad

-- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT nombre, apellido1, apellido2 FROM universidad.persona per WHERE per.tipo='alumno';
-- Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT nombre, apellido1, apellido2 FROM universidad.persona per WHERE per.tipo='alumno' AND per.telefono IS NULL;
-- Retorna el llistat dels alumnes que van néixer en 1999.
SELECT * FROM universidad.persona per WHERE per.tipo='alumno' AND extract(YEAR FROM per.fecha_nacimiento) = 1999;
-- Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT * FROM universidad.persona per WHERE per.tipo='profesor' AND per.telefono IS NULL AND per.nif LIKE '%K';
-- Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT * FROM universidad.asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
-- Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT per.apellido1, per.apellido2, per.nombre, dep.nombre departamento FROM universidad.persona per RIGHT JOIN universidad.profesor pro ON per.id = pro.id_profesor LEFT JOIN universidad.departamento dep ON pro.id_departamento = dep.id ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
-- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT per.nombre, per.apellido1, per.apellido2, per.nif, asi.nombre, cur.anyo_inicio, cur.anyo_fin FROM universidad.persona per LEFT JOIN alumno_se_matricula_asignatura alasig ON per.id = alasig.id_alumno LEFT JOIN asignatura asi ON alasig.id_asignatura = asi.id LEFT JOIN curso_escolar cur ON alasig.id_curso_escolar = cur.id WHERE per.nif = '26902806M';
-- Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT DISTINCT dep.nombre FROM universidad.asignatura asi LEFT JOIN grado gra ON asi.id_grado = gra.id LEFT JOIN universidad.profesor pro USING (id_profesor) LEFT JOIN universidad.departamento dep ON pro.id_departamento = dep.id WHERE gra.nombre = 'Grado en Ingeniería Informática (Plan 2015)' AND asi.id_profesor IS NOT NULL;
-- Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT * FROM universidad.persona per LEFT JOIN universidad.alumno_se_matricula_asignatura alasig ON per.id = alasig.id_alumno LEFT JOIN curso_escolar cur ON alasig.id_curso_escolar = cur.id WHERE cur.anyo_inicio = 2018 GROUP BY per.id;

-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

-- Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT dep.nombre departamento, per.apellido1, per.apellido2, per.nombre FROM universidad.profesor pro RIGHT JOIN universidad.persona per ON pro.id_profesor = per.id LEFT JOIN universidad.departamento dep ON pro.id_departamento = dep.id WHERE per.tipo = 'profesor' ORDER BY departamento DESC, apellido1 DESC, apellido2 DESC, nombre DESC;
-- Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT dep.nombre departamento, per.apellido1, per.apellido2, per.nombre FROM universidad.profesor pro RIGHT JOIN universidad.persona per ON pro.id_profesor = per.id LEFT JOIN universidad.departamento dep ON pro.id_departamento = dep.id WHERE per.tipo = 'profesor' AND dep.nombre IS NULL;
-- Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT dep.id, dep.nombre FROM universidad.departamento dep LEFT JOIN universidad.profesor pro ON dep.id = pro.id_departamento WHERE pro.id_profesor IS NULL;
-- Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
-- Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT * FROM universidad.asignatura WHERE id_profesor IS NULL;
-- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.

-- Consultes resum:

-- Retorna el nombre total d'alumnes que hi ha.
SELECT count(id) FROM universidad.persona WHERE tipo='alumno';
-- Calcula quants alumnes van néixer en 1999.
SELECT count(id) FROM universidad.persona WHERE tipo='alumno' AND extract(YEAR FROM fecha_nacimiento) = 1999;
-- Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT dep.nombre, count(pro.id_profesor) profesores FROM universidad.profesor pro RIGHT JOIN universidad.departamento dep ON pro.id_departamento = dep.id GROUP BY id_departamento HAVING count(pro.id_profesor) > 0 ORDER BY profesores DESC;
-- Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT dep.nombre, count(pro.id_profesor) profesores FROM universidad.profesor pro RIGHT JOIN universidad.departamento dep ON pro.id_departamento = dep.id GROUP BY id_departamento ORDER BY profesores DESC;
-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT gra.nombre, count(asi.id) asignaturas FROM universidad.grado gra LEFT JOIN universidad.asignatura asi ON gra.id = asi.id_grado GROUP BY gra.nombre ORDER BY asignaturas DESC;
-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT gra.nombre, count(asi.id) asignaturas FROM universidad.grado gra LEFT JOIN universidad.asignatura asi ON gra.id = asi.id_grado GROUP BY gra.nombre HAVING asignaturas > 40;
-- Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
-- Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
-- Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
-- Retorna totes les dades de l'alumne/a més jove.
SELECT * FROM universidad.persona WHERE tipo='alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
-- Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.

