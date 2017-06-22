SELECT country_name
FROM countries
WHERE country_name LIKE 'A%';



---------------------------------------------------
--video 26
--AVG(DISTINCT | ALL columna)

SELECT AVG(5) FROM employees;
--el avg de un entero es el entero

SELECT round(AVG(salary),2) FROM employees;

--promedio de los salarios distintos
SELECT round(AVG(DISTINCT salary),2) FROM employees;

SELECT AVG(commission_pct) FROM employees;

--cantidad tiempo que han trabajado en el area de programación

SELECT last_name, job_id, ROUND((SYSDATE - hire_date) / 365.25, 2) "Años Trabajados"
FROM employees
WHERE job_id = 'IT_PROG';

SELECT ROUND(AVG((SYSDATE - hire_date) / 365.25), 2) "Años Trabajados"
FROM employees
WHERE job_id = 'IT_PROG';

-----------------------------------
--funcion de agregado
--video27
--SUM([DISTINCT | ALL])


SELECT SUM(salary) from employees;
--todos cuyos valores no son nulos

SELECT salary FROM employees WHERE salary IS NULL;

SELECT sum(2) from employees;
--suma 2 por cada registro en el resustado de la consulta

SELECT SUM(DISTINCT salary) FROM employees;

--solo agrega los no null
SELECT SUM(commission_pct) FROM employees;
SELECT SUM(DISTINCT commission_pct) FROM employees;

--cuantos años han trabajado todos los mienbros de la compañia hasta la fecha actual
SELECT ROUND(SUM(SYSDATE - hire_date) / 365.25, 2) "Total Años"
FROM employees;

--solo recibe numeros, no fechas o cadenas
------------------------------------------------
--video 28
--MIN([DISTINCT | ALL], expresion)
--MAX([DISTINCT | ALL], expresion)
--operan con fecha, numero, caracter, entre otros

SELECT MIN(commission_pct), MAX(commission_pct) FROM employees;

SELECT MIN(start_date), MAX(end_date) FROM job_history;

--con usa cadena
SELECT MIN(job_id), MAX(job_id) FROM employees;

SELECT MIN(hire_date), MIN(salary), MAX(hire_date), MAX(salary)
FROM employees
WHERE JOB_ID = 'SA_REP';

--calcular el promedio de la longitud de el nombre de todos los paises, redondear al siguiente entero

SELECT ROUND(AVG(LENGTH(country_name))) "Promedio de Longitudes"
FROM countries;   
