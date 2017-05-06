-- JOIN
--video 32


-- NATURAL  JOIN

--region canada
SELECT region_name
FROM regions NATURAL JOIN countries
WHERE country_name = 'Canada';
-- este join busca las valores iguales en el campo que las relaciona

DESC regions;
DESC countries;

SELECT country_name
FROM countries NATURAL JOIN regions
WHERE region_name = 'Americas';

-- JOIN
-- usa las sentencias USER y ON
-- USING: es necesario que las dos tablas tengan un campo con el mismo nombre
-- ON: 

--USING
SELECT region_name
FROM regions JOIN countries
USING (region_id)
WHERE country_name = 'Canada';

--ON
SELECT country_name
FROM countries JOIN regions
ON (countries.region_id = regions.region_id)
WHERE region_name = 'Americas';


-- CROSS JOIN
-- relaciona todas los campos de las tablas, es un ptoducto de las tablas 
SELECT COUNT(*) FROM countries;  --25
SELECT COUNT(*) FROM regions;  --4

SELECT * FROM regions CROSS JOIN countries;
SELECT COUNT(*) FROM regions CROSS JOIN countries;

--------------------------------------------------
-- JOIN NATURAL
-- video 33
-- Sintaxis: SELECT tabla1.column1, table2.column1,....
--           FROM table1 NTUTAL JOIN table2;
--	debe existir una columna en colun en hamas tablas, mismo nombre y mismo tipo  

SELECT *
FROM locations NATURAL JOIN countries;
--otra forma de hacer lo mismo, la anterior s mas usada y libera la clausula where
--si no se llaman igual las columnas no se puede usar

SELECT *
FROM locations, countries
WHERE locations.country_id = countries.country_id;

--podemos usar el alias de tabla
SELECT l.street_address, l.city, c.country_name
FROM locations l, countries c
WHERE l.country_id = c.country_id;

DESC jobs;
DESC countries;
--no tiene columna común, por lo que la sigueinte columna mostraria muchos resultados jobs*countries

SELECT *
FROM jobs NATURAL JOIN countries;

--la forma correcta es:
SELECT *
FROM jobs, countries;

--EJEMPLO
-- copiar texto del ejemplo

-- cuando uso NATURAL JOIN, no puedo usar alias de tabla en la clausua select
-- Oracle se encarga de descubrir las columnas comunes
-- las no comunes is las puedo especificar con los alias de tablas
SELECT employee_id, jod_id, department_id,
	e.last_name, e.hire_date, jh.end_date
FROM job_history jh NATURAL JOIN employees e;

-----------------------------------------------------
--UNIENDO MULTIPLES TABLAS
--video 34

-- en el ejemplo de hr
-- departments, location, countries, region
-- cada uno pertenece al siguiente

--consulta uniendo estas 4 tablas.
-- departamento con su localización, su pais y su region

DESC departments;

SELECT d.department.name, l.city, c.country_name, r.region_name
FROM departments d
NATURAL JOIN locations l
NATURAL JOIN coutries c
NATURAL JOIN regions r;

--ahora lo mismo usando JOIN ON
SELECT d.department.name, l.city, c.country_name, r.region_name
FROM departments d
JOIN locations l ON(d.location_id = l.location_id)
JOIN coutries c ON(l.country_id = c.country_id)
JOIN regions r ON(c.region_id = r.region_id);


--usando USING
SELECT d.department_name, l.city, c.country_name, r.region_name
FROM departments d
JOIN locations l USING(location_id)
JOIN countries c USING(country_id)
JOIN regions r USING(region_id);

--cuando tenemos campos iguales podemos usar NATURAL JOIN o USING
--cuando NO tenemos campos iguales tenemos que usar ON


SELECT d.department_id, l.city, d.department_name
FROM departments d
JOIN locations l ON (l.location_id = l.location_id AND 
					d.department_name LIKE 'P%');


SELECT d.department_id, l.city, d.department_name
FROM departments d
JOIN locations l ON (l.location_id = l.location_id)
WHERE d.department_name LIKE 'P%';
