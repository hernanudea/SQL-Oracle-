--SELECT * FROM JOBS;

--describe = desc
DESCRIBE jobs;

--sentencia basica, varios campos
SELECT job_id,
      min_salary,
      max_salary
      FROM jobs;

--usando alias , debo usar comillas "" si quiero que respete masyusculas y minusculas
SELECT job_id AS "Trabajo", 
      min_salary AS Minimo,
      max_salary AS Maximo
      FROM jobs;
      desc EMPLOYEES;
      
--usaremos la sentencia DISTINCT para que no muestre valores duplicados
SELECT department_id FROM employees;

SELECT DISTINCT department_id FROM employees;

--distict con mas de una columna

SELECT DISTINCT department_id, job_id FROM employees;

SELECT * FROM REGIONS;

--   TABLA DUAL  --

--permite hacer select de operaciones matematicas y otras

SELECT * FROM dual;

SELECT  3 * 4 FROM dual;

SELECT 'Hola Mundo'  as ssss FROM dual; 

SELECT SYSDATE FROM dual;

SELECT USER FROM dual;

SELECT LAST_DAY(SYSDATE) FROM dual;

--concatenar cadema

SELECT 'Esto es una cadena.' || ' ' || 'otra cadena' FROM dual;

SELECT ('Usuario: ' || USER || ', el dia de hoy es: ' || SYSDATE) AS "Consulta" FROM DUAL;

--para imprimir una comilla simple se antepone otra comilla simple
SELECT 'I''m ' || USER FROM dual;

--CLASE 08 --
--FILTRON CON LA CLAUSULA WHERE

--solo los del departamenteo 90
SELECT first_name || ' ' || last_name "Nombre", department_id
FROM employees
WHERE department_id=90;

SELECT department_name
FROM departments
WHERE department_id = 80;

desc job_history;
SELECT * FROM JOB_HISTORY;

desc REGIONS;

SELECT * FROM job_history
WHERE job_id = 'AC_ACCOUNT';

SELECT * FROM countries
WHERE region_id=4;

SELECT region_name FROM Regions
WHERE region_id=4;

--usando otros operadore de comparación
SELECT first_name || ' ' || last_name "Nombre", commission_pct "Comisión"
FROM employees
WHERE commission_pct >= .35;

--usando un arreglo de parametros

--muestra una lista de objetos que cumplen filtro
SELECT first_name || ' ' || last_name "Nombre", department_id "Departamento"
FROM employees
WHERE DEPARTMENT_ID IN (10, 20, 30);

--muestra una lista de objetos diferentes al filtro anterior
SELECT first_name || ' ' || last_name "Nombre", department_id "Departamento"
FROM employees
WHERE DEPARTMENT_ID NOT IN (10, 20, 30);


--------------------------------------------------
-- Clase 09
-- Mas filtros

-- NOT invierte el filtro, en este ejemplo muestra las menores a 30, no las mayores
SELECT first_name, department_id
FROM EMPLOYEES
WHERE NOT DEPARTMENT_ID > 30; 

--AND, que cumpla ambas condiciones
SELECT first_name, last_name, salary
FROM EMPLOYEES
WHERE last_name = 'Smith' AND salary > 7500;

--OR, alguno cumpla la condicion
SELECT first_name, last_name
FROM EMPLOYEES
WHERE first_name = 'Kelly' OR last_name = 'Smith';


--BETWEEB, muestra un valor entre otros dos valores, un rango, en oracle es inclusivo en ambos lados
SELECT first_name, last_name, salary
FROM EMPLOYEES
WHERE salary BETWEEN 5000 AND  6000;

--con los otros operadores
SELECT first_name, last_name, salary
FROM EMPLOYEES
WHERE salary >= 5000 AND  salary <=6000;

--% Comodin, espresa una cadena de caracteres
--empieza por Su
SELECT first_name, last_name
FROM EMPLOYEES
WHERE first_name LIKE 'Su%';

--termina por a
SELECT first_name, last_name
FROM EMPLOYEES
WHERE first_name LIKE '%a';

--empieza por C y termina por a
SELECT first_name, last_name
FROM EMPLOYEES
WHERE first_name LIKE 'C%a';

--contiene almenos una m
SELECT first_name, last_name
FROM EMPLOYEES
WHERE first_name LIKE '%m%';


-- para consultar cuales son NULL se usa IS
SELECT first_name, last_name
FROM EMPLOYEES
WHERE department_id IS NULL;

-- para consultar los que NO son null
SELECT first_name, last_name
FROM EMPLOYEES
WHERE department_id IS NOT NULL;

----------------------------------------------------
--clase 10

--ORDER BY
SELECT * FROM countries
WHERE REGION_ID BETWEEN 1 and 3
ORDER BY region_id, country_name;

SELECT first_name || ' ' || last_name "Nombre Empleado"
FROM employees
WHERE department_id = 80
ORDER BY last_name;

SELECT last_name
FROM employees
ORDER BY last_name DESC;

--ordenamiento ascendente y desendente en la misma consulta
SELECT last_name, first_name
FROM employees
ORDER BY last_name ASC, first_name DESC;


-- correspondiente posicion cardinal
-- en 4 corresponde a manager_id, 2 corresponde a hire_date, 3 corresponde a salary,
SELECT first_name, hire_date, salary, manager_id AS MID
FROM employees
WHERE department_id IN (110, 100)
ORDER BY 4, 2, 3;

--los valores null son mayores que los datos normales
SELECT last_name, commission_pct
FROM EMPLOYEES
WHERE LAST_NAME LIKE 'R%'
ORDER BY commission_pct ASC, last_name DESC;


