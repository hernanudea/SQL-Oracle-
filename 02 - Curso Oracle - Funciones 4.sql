--VIDEO 20
-- TOCHAR() => convierte datos de otro tipo en tipo caracter
--TO_CHAR(EXPR, [formato], [lenguaje])

SELECT TO_CHAR(10) FROM dual;
SELECT TO_CHAR(0000001) FROM dual;
SELECT TO_CHAR(000001, '0999999') FROM dual;
--el 9 representa un digito
--el cero inicial indica que si el numero tiene ceros al comienzo estos se deben mantener

SELECT job_title, max_salary, TO_CHAR(max_salary, '$99,999.99'),
TO_CHAR(max_salary, '$9,999.99')
FROM jobs
WHERE UPPER(job_title) LIKE '%PRESIDENT%';

--cuando el formato no puede representar el valor muestra los caracteres ####

SELECT TO_CHAR(SYSDATE) FROM dual;

SELECT TO_CHAR(SYSDATE, 'Month') FROM dual;
SELECT TO_CHAR(SYSDATE, 'MM') FROM dual;
SELECT TO_CHAR(SYSDATE, 'Mon') FROM dual;
SELECT TO_CHAR(SYSDATE, 'YEAR') FROM dual;
SELECT TO_CHAR(SYSDATE, 'DAY') FROM dual;
SELECT TO_CHAR(SYSDATE, 'DD') FROM dual;
SELECT TO_CHAR(SYSDATE, 'D') FROM dual;
--extraemos solo una parte de la fecha, existen otros modificadores

SELECT first_name || ' ' || last_name "Nombre Completo",
      SUBSTR(first_name, 1,1) ||'. '|| last_name "Nombre Corto",
      TO_CHAR(hire_date, 'fmDD Month YYYY') "Fecha Contratación" 
FROM EMPLOYEES;

--utilizando el tercer argmento, otro lenguaje
SELECT TO_CHAR(SYSDATE, 'Day Ddspth, Month YYYY', 'nls_date_language=German')
from dual;
--sp => mostrar el dia por sus letras
--ht => dia ordinal
--con otro lenguaje
SELECT TO_CHAR(SYSDATE, 'Day Ddspth, Month YYYY', 'nls_date_language=Danish')
from dual;

--VIDEO 21
--TO_DATE(c, [fmt], [nslparam])

--para cambia el formato de las fechas

ALTER SESSION SET nls_date_format = 'DD-Mon-RRRR HH24:MI:SS';
--el cambio es solo a nivel de sección
--los parametros no indicados se ponene con ceros

SELECT TO_DATE('25_Dic_2017') from dual;

SELECT TO_DATE('25-Dic', 'DD-MM') FROM DUAL;
--el segundo parametro es un nuevo formato
--el año por defecto es el año actual

SELECT TO_DATE('25-Dic-2017 18:25:36', 'DD-Mon-YYYY HH24:MI:SS') FROM DUAL;
SELECT TO_DATE('30-Sep-2007', 'DD/Mon/YYYY') FROM DUAL;
SELECT TO_DATE('Sep-2007 13', 'Mon/YYYY HH24') FROM dual; -- el 13 es la hora

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > TO_DATE('01/12/2000', 'MM/DD/YYYY') 
ORDER BY hire_Date;

--ver documentación para mas formatos de tipo fecha

--VIDEO 22
--funciones para fechas
--SYSDATE => fecha actual
	SELECT SYSDATE FROM dual;
	
	--ADD_MONTHS(d, i) => agrega una cantidad de meses a una fecha
	--donde d es una fecha e i los meses a agregar
	SELECT SYSDATE, ADD_MONTHS(SYSDATE, -1) ANTERIOR, ADD_MONTHS(SYSDATE, 12) "En un Año"FROM dual;
  
  --MONTHS_BETWEEN() cantidad de meses entre dos fechas
  SELECT FLOOR(MONTHS_BETWEEN('21/02/1979', '08-04-1992')) f1,
         FLOOR(MONTHS_BETWEEN('30-10-2013', '19-10-2016')) f2,
         FLOOR(MONTHS_BETWEEN('21/02/1979', '26-06-1986')) f3,
         FLOOR(MONTHS_BETWEEN('28-02-2010', '31/03/2008')) f4,
         FLOOR(MONTHS_BETWEEN('31/03/2008', '28-02-2010')) f5
  FROM dual;
  --retorna negativo cuando la primera fecha ocurre primero en el timpo, positivos en el caso contrario
  
  
  --LAST_DAY => retorna el ultimo dia del mes actual
  SELECT SYSDATE, LAST_DAY(SYSDATE) fin_de_mes from dual;
  
  SELECT LAST_DAY('01-02-2900') FROM DUAL; -- no es bisiesto
  
  SELECT SYSDATE HOY,
         LAST_DAY(SYSDATE) "FIN DE MES", --ultimo dia del mes
         LAST_DAY(SYSDATE) + 1 "SIGUIENTE MES" --primer dia siguiente mes 
        FROM dual;
        
        --si sumamos a una fecha un entero sumanos (restamos) esa cantidad de dias en la fecha
        
        ALTER SESSION SET NLS_DATE_FORMAT='DD-Mon-YYYY HH24:MI:SS';
        
  --ROUND(d, [fmt]) => redondeo
  SELECT SYSDATE, ROUND(SYSDATE, 'HH24') "REDONDEO EN HORAS",
                  ROUND(SYSDATE) "REDONDEO FECHA",
                  ROUND(SYSDATE, 'MM') "REDONDEO MESES",
                  ROUND(SYSDATE, 'YY') "REDONDEO AÑOS"
  FROM dual;
  --desde la mitad del ia se redondea al siguiente dia
  
  
  --TRUNC(d, [fmt]) => reemplaza en una fecha
  SELECT SYSDATE, TRUNC(SYSDATE, 'HH24') "REDONDEO EN HORAS",
                  TRUNC(SYSDATE) "REDONDEO FECHA",
                  TRUNC(SYSDATE, 'MM') "REDONDEO MESES",
                  TRUNC(SYSDATE, 'YY') "REDONDEO AÑOS"
  FROM dual;
  -- redondea al comienzo del dia
  