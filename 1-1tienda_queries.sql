-- Consulta 1: Llistar el nom de tots els productes
SELECT nombre AS nom_producte
FROM producto;

-- Consulta 2: Llistar noms i preus de tots els productes
SELECT nombre AS nom_producte, precio AS preu
FROM producto;

-- Consulta 3: Llistar totes les columnes de la taula producto
SELECT *
FROM producto;

-- Consulta 4: Llistar el nom dels productes, el preu en euros i el preu en dòlars (USD)
SELECT 
    nombre AS nom_producte,
    precio AS preu_euros,
    (precio * 1.1) AS preu_dolars
FROM producto;

-- Consulta 5: Llistar el nom dels productes, el preu en euros i el preu en dòlars amb àlies
SELECT 
    nombre AS nom_producte,
    precio AS euros,
    (precio * 1.1) AS dolars
FROM producto;

-- Consulta 6: Llistar noms i preus de tots els productes amb noms en majúscules
SELECT 
    UPPER(nombre) AS nom_producte,
    precio AS preu
FROM producto;

-- Consulta 7: Llistar noms i preus de tots els productes amb noms en minúscules
SELECT 
    LOWER(nombre) AS nom_producte,
    precio AS preu
FROM producto;

-- Consulta 8: Llistar nom dels fabricants i els dos primers caràcters en majúscules
SELECT 
    nombre AS nom_fabricant,
    UPPER(LEFT(nombre, 2)) AS inicials
FROM fabricante;

-- Consulta 9: Llistar noms i preus de tots els productes amb el preu arrodonit
SELECT 
    nombre AS nom_producte,
    ROUND(precio) AS preu_arrodonit
FROM producto;

-- Consulta 10: Llistar noms i preus de tots els productes amb el preu truncat
SELECT 
    nombre AS nom_producte,
    TRUNCATE(precio, 0) AS preu_truncat
FROM producto;

-- Consulta 11: Llistar el codi dels fabricants que tenen productes
SELECT DISTINCT codigo_fabricante AS codi_fabricant
FROM producto;

-- Consulta 12: Llistar el codi únic dels fabricants que tenen productes
SELECT DISTINCT codigo_fabricante AS codi_fabricant_unic
FROM producto;

-- Consulta 13: Llistar els noms dels fabricants en ordre ascendent
SELECT nombre AS nom_fabricant
FROM fabricante
ORDER BY nombre ASC;

-- Consulta 14: Llistar els noms dels fabricants en ordre descendent
SELECT nombre AS nom_fabricant
FROM fabricante
ORDER BY nombre DESC;

-- Consulta 15: Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
SELECT nombre AS nom_producte, precio AS preu
FROM producto
ORDER BY nombre ASC, precio DESC;

-- Consulta 16: Retornar una llista amb les 5 primeres files de la taula fabricante
SELECT *
FROM fabricante
LIMIT 5;

-- Consulta 17: Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT *
FROM fabricante
LIMIT 2 OFFSET 3;

-- Consulta 18: Llistar els productes amb preu superior a 100
SELECT nombre AS nom_producte, precio AS preu
FROM producto
WHERE precio > 100;

-- Consulta 19: Llistar els productes ordenats per preu ascendent
SELECT nombre AS nom_producte, precio AS preu
FROM producto
ORDER BY precio ASC;

-- Consulta 20: Llistar el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
SELECT nombre AS nom_producte
FROM producto
WHERE codigo_fabricante = 2;

-- Consulta 21: Llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT 
    producto.nombre AS nom_producte,
    producto.precio AS preu,
    fabricante.nombre AS nom_fabricant
FROM producto
INNER JOIN fabricante
    ON producto.codigo_fabricante = fabricante.codigo;

-- Consulta 22: Llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic
SELECT 
    producto.nombre AS nom_producte,
    producto.precio AS preu,
    fabricante.nombre AS nom_fabricant
FROM producto
INNER JOIN fabricante
    ON producto.codigo_fabricante = fabricante.codigo
ORDER BY fabricante.nombre ASC;

-- Consulta 23: Llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades
SELECT 
    producto.codigo AS codi_producte,
    producto.nombre AS nom_producte,
    producto.codigo_fabricante AS codi_fabricant,
    fabricante.nombre AS nom_fabricant
FROM producto
INNER JOIN fabricante
    ON producto.codigo_fabricante = fabricante.codigo;


-- Consulta 24: Nom del producte, el seu preu i el nom del seu fabricant, del producte més barat
SELECT 
    producto.nombre AS nom_producte,
    producto.precio AS preu,
    fabricante.nombre AS nom_fabricant
FROM producto
INNER JOIN fabricante
    ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio ASC
LIMIT 1;

-- Consulta 25: Nom del producte, el seu preu i el nom del seu fabricant, del producte més car
SELECT 
    producto.nombre AS nom_producte,
    producto.precio AS preu,
    fabricante.nombre AS nom_fabricant
FROM producto
INNER JOIN fabricante
    ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio DESC
LIMIT 1;

-- Consulta 26: Llista de tots els productes del fabricant Lenovo
SELECT 
    producto.nombre AS nom_producte,
    producto.precio AS preu
FROM producto
INNER JOIN fabricante
    ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Lenovo';

-- Consulta 27: Llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €
SELECT 
    producto.nombre AS nom_producte,
    producto.precio AS preu
FROM producto
INNER JOIN fabricante
    ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;

-- Consulta 28: Llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN
SELECT 
    producto.nombre AS nom_producte,
    producto.precio AS preu
FROM producto
INNER JOIN fabricante
    ON producto.codigo_fabricante = fabricante.codigo
WHERE (fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate');

-- Consulta 29: Llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Fent servir l'operador IN
SELECT 
    producto.nombre AS nom_producte,
    producto.precio AS preu
FROM producto
INNER JOIN fabricante
    ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- Consulta 30: Llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e
SELECT 
    producto.nombre AS nom_producte,
    producto.precio AS preu
FROM producto
INNER JOIN fabricante
    ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE '%e';

-- Consulta 31: Llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom
SELECT 
    producto.nombre AS nom_producte,
    producto.precio AS preu
FROM producto
INNER JOIN fabricante
    ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE '%w%';

-- Consulta 32: Llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent)
SELECT 
    producto.nombre AS nom_producte,
    producto.precio AS preu,
    fabricante.nombre AS nom_fabricant
FROM producto
INNER JOIN fabricante
    ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio >= 180
ORDER BY producto.precio DESC, producto.nombre ASC;

-- Consulta 33: Llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades
SELECT DISTINCT fabricante.codigo AS codi_fabricant, fabricante.nombre AS nom_fabricant
FROM fabricante
INNER JOIN producto
    ON fabricante.codigo = producto.codigo_fabricante;

-- Consulta 34: Llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats
SELECT 
    fabricante.codigo AS codi_fabricant,
    fabricante.nombre AS nom_fabricant,
    producto.nombre AS nom_producte
FROM fabricante
LEFT JOIN producto
    ON fabricante.codigo = producto.codigo_fabricante;

-- Consulta 35: Llistat on només apareguin aquells fabricants que no tenen cap producte associat
SELECT 
    fabricante.codigo AS codi_fabricant,
    fabricante.nombre AS nom_fabricant
FROM fabricante
LEFT JOIN producto
    ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.codigo_fabricante IS NULL;

-- Consulta 36: Tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN)
SELECT producto.nombre AS nom_producte, producto.precio AS preu
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND fabricante.nombre = 'Lenovo';

-- Consulta 37: Totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN)
SELECT *
FROM producto
WHERE precio = (
    SELECT MAX(precio)
    FROM producto, fabricante
    WHERE producto.codigo_fabricante = fabricante.codigo
    AND fabricante.nombre = 'Lenovo'
);

-- Consulta 38: Llista el nom del producte més car del fabricant Lenovo
SELECT producto.nombre AS nom_producte
FROM producto
INNER JOIN fabricante
    ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Lenovo'
ORDER BY producto.precio DESC
LIMIT 1;

-- Consulta 39: Llista el nom del producte més barat del fabricant Hewlett-Packard
SELECT producto.nombre AS nom_producte
FROM producto
INNER JOIN fabricante
    ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Hewlett-Packard'
ORDER BY producto.precio ASC
LIMIT 1;

-- Consulta 40: Tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo
SELECT *
FROM producto
WHERE precio >= (
    SELECT MAX(precio)
    FROM producto
    INNER JOIN fabricante
        ON producto.codigo_fabricante = fabricante.codigo
    WHERE fabricante.nombre = 'Lenovo'
);

-- Consulta 41: Tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes
SELECT producto.nombre AS nom_producte, producto.precio AS preu
FROM producto
INNER JOIN fabricante
    ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus' 
AND producto.precio > (
    SELECT AVG(precio)
    FROM producto
    INNER JOIN fabricante
        ON producto.codigo_fabricante = fabricante.codigo
    WHERE fabricante.nombre = 'Asus'
);