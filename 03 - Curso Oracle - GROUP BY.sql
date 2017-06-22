--video 29
--Cláusula GROUP BY

 SELECT AVG(salary) FROM employees;
 --si quiero ver el promedio pero por cada departamento
 
 SELECT department_id,  ROUND(AVG(salary))
 FROM employees
 GROUP BY department_id
 ORDER BY 2 DESC;
 
 -- para poder agrupar por una caracteristica, esta debe estar en el select
 
 --buscar el munero de empleados que tiene cada uno de lo manager
 SELECT COUNT(*), manager_id
 FROM employees
 GROUP BY manager_ID
 ORDER BY 1 DESC, 2 NULLS LAST;
 --NULLS LAST=> los null al final
 
 
 --buscar maximo salaro y el conteo de empleados por departamento
   SELECT MAX(salary), COUNT(*)
   FROM employees
   GROUP BY department_id
   ORDER BY department_id;
   
   --buscar numero paises por region en la tabla paises
   SELECT region_id, COUNT(*)
   FROM countries
   GROUP BY region_id
   ORDER BY region_id;
   
   --buscar los empleados que han renunciado por cada año
   SELECT TO_CHAR(end_date, 'yyyy') "Año",
      COUNT(*) Empleados
    FROM job_history
    GROUP BY TO_CHAR(end_date, 'yyyy')
    ORDER BY COUNT(*) DESC; 
    --ordenando por una expresion
    
    SELECT TO_CHAR(end_date, 'yyyy') "Año",
      COUNT(*) Empleados
    FROM job_history
    GROUP BY TO_CHAR(end_date, 'yyyy')
    ORDER BY TO_CHAR(end_date, 'yyyy') DESC; 
    
    
    SELECT end_date, COUNT(*)
    FROM job_history;  --arroja error
    --todas las columnas que no son de agrupación deben estar en un group by
    SELECT end_date, COUNT(*)
    FROM job_history
    GROUP BY end_date;
    
    SELECT end_date, start_date, COUNT(*)
    FROM job_history
    GROUP BY end_date; --arroja error
    
    SELECT end_date, start_date, COUNT(*)
    FROM job_history
    GROUP BY end_date, start_date; 
    
    
    --video 30
    --GROUP BY
    
    SELECT department_id, SUM(commission_pct)
    FROM employees
    WHERE commission_pct IS NOT NULL
    GROUP BY department_id;
    
    SELECT department_id, job_id, SUM(commission_pct)
    FROM employees
    WHERE commission_pct IS NOT NULL
    GROUP BY department_id, job_id;
    
    SELECT department_id, job_id, SUM(commission_pct)
    FROM employees
    WHERE commission_pct IS NOT NULL
    GROUP BY department_id, job_id;
    --podemos agregar hasta 255 columnas en la agrupación
    
    --Ejercicio
    
    SELECT TO_CHAR(end_date, 'yyyy'), job_id, COUNT(*)
    FROM job_history
    GROUP BY TO_CHAR(end_date, 'yyyy'), job_id
    ORDER BY COUNT(*) DESC;
    
    /*
    seleccionar la longitud del nombre mas corto y el mas largo
    de los empleados que sean representantes de ventas
    */
    
    SELECT MAX(LENGTH(last_name)), MIN(LENGTH(last_name))
    FROM employees
    WHERE job_id = 'SA_REP';
    
    ---------------------------------------------------------
    --video 31
    --HAVING => filtrar y refinar los resultados de las consultas basados en grupos
    
    SELECT department_id
    FROM job_history
    WHERE  department_id IN (50, 60, 80, 110);
    
    --conteo de empleados en el departamento que cambiaron de trabajo
    
    SELECT department_id, COUNT(*)
    FROM job_history
    WHERE  department_id IN (50, 60, 80, 110)
    GROUP BY department_id;
    --cuando usamos WHERE, la cluasula GROUP BY va despues de esta
    --si nos dijeran mayor a 1
    --no podemos hacer funciones de agrupacion fuera de GROUP BY
    --no podemos usar el AND en el WHERE
    --aqui debemos usar HAVING despues de GROUP BY
    SELECT department_id, COUNT(*)
    FROM job_history
    WHERE  department_id IN (50, 60, 80, 110)
    GROUP BY department_id
    HAVING COUNT(*) > 1;
    
    SELECT job_id, AVG(salary), COUNT(*)
    FROM employees
    GROUP BY job_id;
    
    SELECT job_id, AVG(salary), COUNT(*)
    FROM employees
    GROUP BY job_id
    HAVING AVG(salary) > 10000
    ORDER BY 2 DESC;
     
     --promedio mayor a 10000 cuando el conteo de empleados sea mayor a 1
    SELECT job_id, AVG(salary), COUNT(*)
    FROM employees
    GROUP BY job_id
    HAVING AVG(salary) > 10000 AND COUNT(*) > 1
    ORDER BY 2 DESC;
    --HAVING solo se usa con grupos, no puede existir sin las funciones de agrupamiento
    
    /*
    identificar los dias de la semana en los cuales 15 o mas stak
    fueron contratados. listar los dias y el numero de empleados contratados en cada uno de ellos
    */
    
    SELECT TO_CHAR(hire_date, 'DAY'), COUNT(*)
    FROM employees
    GROUP BY TO_CHAR(hire_date, 'DAY')
    HAVING COUNT(*) >= 15
    ORDER BY COUNT(*);