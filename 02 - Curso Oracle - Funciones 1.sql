-- FUNCIONES
--video 11
-- FUNTION CONCAT

SELECT 'Esto es una cadena.' || ' Otra cadena' FROM dual;
SELECT CONCAT('Esto es una cadena.',' Otra cadena') FROM dual;  

--anidando CONCAT
SELECT CONCAT(CONCAT('UNO',' DOS'), ' TRES')  FROM dual;  

--usando las dos formas de concatenar en el mismo SELECT
SELECT CONCAT(CONCAT(first_name, ' '), last_name) "Nombre Empelado", 
        first_name || ' ' || last_name AS "Nombre Empelado 2"
      from employees
      WHERE department_id= 30;


---------------------------------------------------------------------------------
--FUNTION SUBSTR
--Clase 12
  --sintaxis: SUBSTR(cadena, x, [,y]) y es opcional, x inicio, y cantidad de caracteres
  --muestra los caranteres desde el 10 hasta el final
  SELECT SUBSTR('Esto es una cadena muy larga de ejemplo', 10) from dual;
  
  --si quieri mostrar desde un indice hasta otro, y, es cantidad
SELECT SUBSTR('Esto es una cadena muy larga de ejemplo', 10, 2) from dual;

--(10000-8)= 9992, iniciando en indice 3 y mostrando dos caracteres 92
--indice inicia en 1
SELECT SUBSTR(10000-8, 3, 2) from dual;

--hallar el mes
SELECT SYSDATE, SUBSTR(SYSDATE, 4,2) FROM dual;


SELECT 'Nombre: ' || SUBSTR(first_name,1, 1)
        || '. ' || last_name  AS "Nombre"
        FROM employees
        WHERE SUBSTR(job_id, 1, 2)= 'AD';
        
      --video 13
      --FUNCION SUBSTR parte 2
      
      --ejecutar como sys as sysdba
SELECT file_name
FROM dba_data_files;

--si no queiero el nombre tan largo
--busco la posicion de la diganal

--funcion INTSTR, retorna la posicion donde encuentra la primera aparicion de un caracter en un string
--sintaxis: INTSTR(cadena, 'caracter')
SELECT INSTR (file_name, '\'), file_name
FROM DBA_DATA_FILES;

--si quiero la ultima aparicion uso -1, como tercer parametro
SELECT INSTR (file_name, '\', -1), file_name
FROM DBA_DATA_FILES;

SELECT SUBSTR(file_name, INSTR(file_name, '\', -1) + 1), file_name
FROM DBA_DATA_FILES;

--FUNCION INSTR
-- video 14
--devuelve la posicion donde encuentra una cadena dentro de otra, termine hacia adelante y hacia atras
--Sintaxis INSTR(Cadena, cadenaBuscar, indiceInicial, NumeroRepeticion)
--por defecto el tercer y cuarto parametro estan en 1

SELECT INSTR('Hola mundo', 'mu') from dual;
--sencible a myusculas minusculas

SELECT INSTR('Hola mundo', 'otracadena') from dual;
--si no está retorna 0(cero)

SELECT SYSDATE, INSTR(SYSDATE, '17') from dual;

--por defento busca la primera
SELECT INSTR('1#3#5#7#9#', '#')  from dual;

--por defento busca la primera
SELECT INSTR('1#3#5#7#9#', '#', 5,2)  from dual;

--si quiero la tercera ocurrencia
SELECT INSTR('1#3#5#7#9#', '#', 1,3)  from dual;

SELECT * FROM DEPARTMENTS
WHERE INSTR(department_name, 'on') = 2;

--FUNTION LENGTH()
--video 15

SELECT LENGTH('Esto es una cadena') FROM DUAL;
SELECT SYSDATE AS "FECHA", LENGTH(SYSDATE) AS "LARGO" FROM DUAL;
SELECT LENGTH('1 + 2 = ' || '3') FROM DUAL;

SELECT * FROM COUNTRIES
WHERE LENGTH(COUNTRY_NAME) >10;

--FUNCION LOWER()
--video 16
-- resive cadena y la convierte en minusculas

SELECT LOWER('Esto es una CADENA') from dual;
SELECT LOWER(30 + 50) from dual;


--para buscar los empelados cuyo apellido inicia por us en mayusculas y minisculas
SELECT first_name, last_name, LOWER(last_name) AS "Apellidos en Minusculas"
from EMPLOYEES
WHERE LOWER(last_name) LIKE ('%ur%')
ORDER BY first_name;