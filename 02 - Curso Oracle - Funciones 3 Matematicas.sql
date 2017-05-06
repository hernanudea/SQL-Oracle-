
----------------------------------------------------------------------------
-- VIDEO 19
--FUNCIONES MATEMATICAS
  
  --ABS() => valor absoluto
  SELECT ABS(10) POSITIVO, ABS(0) CERO, ABS(-10) NEGATIVO
  FROM dual;

  --ACOS(), ASIN(n),ATAN(n), COS(n), SEN(n), TAN(n)  =>funciones trigonometricas, en radianes
  SELECT ACOS(-1), ACOS(0), ACOS(.045) FROM dual;
  
  --CEIL() =>entero mas pequeño mayor o igual a n
  SELECT CEIL(9.8), CEIL(-7.8), CEIL(0), CEIL(5) FROM dual;
  
  --FLOOR(n) =>entero mas grande menor o igual a n
  SELECT FLOOR(9.8), FLOOR(-7.8), FLOOR(0), FLOOR(5) FROM dual;
  
  --EXP(N) => exponencial
  SELECT EXP(1) "e"FROM DUAL;
  
  --LN => LOGARITMO NATURAL
  
  SELECT LN(2.7) FROM dual;
  
  --POWER(n1, n2) => eleva n1 a la potencia n2
  SELECT POWER(2, 10), POWER(3,3), POWER(5,3), POWER(2, -3) from DUAL;
  
  --SIGN => signo de un numero
  
  SELECT SIGN(2), SIGN(-2), SIGN(0) FROM dual;