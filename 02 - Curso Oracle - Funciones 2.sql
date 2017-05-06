----------------------------------------------------------------------------
-- VIDEO 17
--LPAD o RPAD = hacer un relleno a la izquierda o derecha
--LPAD(c, i, [c2])
-- el caracter de relleno por defecto es el espacio
SELECT LPAD('Cadena', 10), RPAD('Cadena', 10) FROM dual;

--si ponemos el caracter de relleno
SELECT LPAD('Cadena', 10, '-'), RPAD('Cadena', 10, '-') FROM dual;


SELECT LPAD(RPAD('INICIO', 20, '*'), 34, '*') centrado FROM dual;

--con mas de un caracter de relleno
SELECT LPAD(SYSDATE, 14, '-?'), RPAD(SYSDATE, 14, '-?') FROM DUAL;

SELECT LPAD(last_name, 10) lpad_name,
      LPAD(salary, 8, '*') lpad_salary
FROM employees
WHERE last_name LIKE 'J%';


----------------------------------------------------------------------------
-- VIDEO 18
--FUNTION REPLACE
--REPLACE(c1, c2, [c3])

SELECT REPLACE ('downtown', 'down', 'up') from dual;

--si no especificamos el tercer parametro, se elimina la segunda cadena de la primera
SELECT REPLACE ('downtown', 'down') from dual;

--se reemplaza cada ocurrencia de la cadena a reemplazar 
SELECT REPLACE(10000 - 3, '9', '85') FROM dual;
--9997 => 8585857

SELECT REPLACE(SYSDATE, '03', '08') FROM dual;  

SELECT last_name, salary, REPLACE(salary, '0', '000') "Salario Soñado"
FROM employees
WHERE job_id = 'SA_MAN';

