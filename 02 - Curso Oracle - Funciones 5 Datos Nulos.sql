--VIDEO 23
--FUNCIONES PARA DATOS NULOS
--NVL, NVL2, COALESCE


--NVL(x1, x2) => si x1 es no null lo regresa, si x2 es no null y x2 si, entonces regresa x2
SELECT last_name, NVL(department_id, 0), department_id
FROM employees
ORDER BY 2;
--si department_id es null, regresa 0 (cero) en su lugar

SELECT first_name, salary, commission_pct,
      salary + (salary * commission_pct) "Compensación"
FROM employees
WHERE first_name LIKE 'T%';

-- reemplazando con cero
SELECT first_name, salary, NVL(commission_pct, 0),
      salary + NVL(salary * commission_pct, 0) "Compensación"
FROM employees
WHERE first_name LIKE 'T%';


--NVL2(x1, x2, x3) => regresa x3 si x1=null; regresa x2 si x1!=null

SELECT first_name, salary, commission_pct,
      NVL2(commission_pct, salary + salary * commission_pct, salary) "Compensación"
FROM employees
WHERE first_name LIKE 'T%';

--COALSCE(lista) =>recibe lista de expresiones separados por comas, si x1 es null, revisa x2, si no, regresa x1
--regresa la primera expresion no null

SELECT last_name, salary, commission_pct as comm,
      COALESCE(salary + salary * commission_pct, salary + 100, 900) Comisión--900 nunca es null, es un valor por default 
FROM employees
WHERE last_name LIKE 'T%';



--------------------------------------------------------------------------------------------
--VIDEO 24
--FUNCIONES ADICIONALES

--DECODE(x, m1, r1, m2, r2, m3, r3......)

SELECT country_id, country_name, region_id,
      DECODE(region_id, 1, 'Europa',
                        2, 'America',
                        3, 'Asia',
                        'Otro') Region
FROM countries;


--GREATEST(listaExpresiones) => las ordena de menor a mayor, selecciona la mayor

SELECT GREATEST('01-ABR-08', '30-DIC-08','20-ENE-10') FROM dual;
--estos datos son cadenas, se acomodan de menor a mayor como cadenas
--el primer tipo de datos de la lista, indica que tipo van a ser los siguientes

SELECT GREATEST(TO_DATE('01-ABR-2008', 'DD-Mon-YYYY'), '30-DIC-08','20-ENE-10') FROM dual;

SELECT GREATEST(245, 'zyx', 123) from dual; --produce error, espera que todos sean numeros
SELECT GREATEST('zyx', 245, 123) from dual; --comparación entre caracteres

SELECT last_name, salary, GREATEST(salary * 0.15, 500) Bono
from employees
WHERE department_id IN (30, 10)
ORDER BY last_name;


--LEAST(lista) => retorna el menor
SELECT LEAST (SYSDATE, '15-MAR-2002', '17-JUN-2002') FROM dual;

SELECT LEAST(TO_DATE('01-ABR-09','DD-Mon-YY'), '30-DIC-08','20-ENE-10') FROM dual;

SELECT last_name, salary, least(salary * 0.15, 500) Bono
from employees
WHERE department_id IN (30, 10)
ORDER BY last_name;