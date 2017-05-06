--FUNCIONES PARA DATOS NULOS
--NLV, NVL2, COALSCE


--NLV(x1, x2) => si x1 es no null lo regresa, si x2 es no null y x2 si, entonces regresa x2
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
