-- Estudo de Pl/SQL
-- Michael Douglas Bonfogo.
-----------------------------------------------------------------------------------------------

CREATE TABLE <TABELA> (<COLUNA> <TIPO> <OPCIONAIS>);

CREATE TABLE TESTE (ID  NUMBER(1));

Create table tabela ( 
    Id  number PRIMARY KEY, 
    Nome varchar2(10) NOT NULL
    )


Drop table tabela;

/* ______________________________________________________________________________________________ */

SELECT [DADOS] FROM [TABELAS] WHERE [CONDIÇÃO]

SELECT * FROM TABELA

SELECT *, *, * FROM TABELA

WHERE:
IN: 
SELECT * FROM TABELA WHERE DADO IN (X, X, ...)

NOT IN
SELECT * FROM TABELA WHERE CAMPO NOT IN ('DADO', 'DADO', ...,)

LIKE
SELECT * FROM TABELA WHERE CAMPO LIKE 'XX%'
SELECT * FROM TABELA WHERE CAMPO LIKE '_X%'
SELECT * FROM TABELA WHERE CAMPO LIKE '_X'

BETWEEN
SELECT * FROM CAMPO WHERE DADO BETWEEN '02-01-2017' AND '06-03-2017'

=
SELECT * FROM TABELA WHERE NOME = 'DADO'

<
SELECT * FROM CAMPO WHERE DADO < PARAMETRO
SELECT * FROM CAMPO WHERE DADO < PARAMETRO AND DADO < PARAMETRO OR DADO < PARAMETRO 

>
SELECT * FROM CAMPO WHERE DADO > PARAMETRO
SELECT * FROM CAMPO WHERE DADO > PARAMETRO AND DADO > PARAMETRO OR DADO > PARAMETRO 

>=
SELECT * FROM CAMPO WHERE DADO >= PARAMETRO
SELECT * FROM CAMPO WHERE DADO >= PARAMETRO AND DADO >= PARAMETRO OR DADO >= PARAMETRO

<> !=
SELECT * FROM CAMPO WHERE DADO <> PARAMETRO
SELECT * FROM CAMPO WHERE DADO <> PARAMETRO AND DADO <> PARAMETRO OR DADO <> PARAMETRO

<=
SELECT * FROM CAMPO WHERE DADO <= PARAMETRO
SELECT * FROM CAMPO WHERE DADO <= PARAMETRO AND DADO <= PARAMETRO OR DADO <= PARAMETRO
/* ______________________________________________________________________________________________ */

INSERT INTO <NOME> (COLUNAS)  VALUES (VALORES)

INSERT INTO table
(column1, column2, ... column_n )
VALUES
(expression1, expression2, ... expression_n );

INSERT INTO TABELA (CAMPO, CAMPO, ...) VALUES (X, X, ...)

UPDATE TABELA SET CAMPO = DADO
UPDATE TABELA SET CAMPO = DADO WHERE CAMPO = DADO = X

DELETE FROM TABELA
DELETE FROM TABELA WHERE CAMPO = PARAMETRO

SELECT * FROM TABELA ORDER BY CAMPO ASC
SELECT CAMPO, CAMPO, ... FROM TABELA WHERE CAMPO >= 'PARAMETRO' ORDER BY CAMPO ASC

/* ______________________________________________________________________________________________ */

DELETE FROM table [WHERE conditions];

Exemplo: 
DELETE FROM customers WHERE last_name = 'Smith';

DELETE FROM customers
WHERE last_name = 'Smith';

/* ______________________________________________________________________________________________ 
UPDATE:
A instrução UPDATE do Oracle é usada para atualizar registros existentes em uma tabela em um banco de dados Oracle. Existem 2 sintaxes para uma consulta de atualização no Oracle, dependendo se você está realizando uma atualização tradicional ou atualizando uma tabela com dados de outra tabela. */

UPDATE table
SET column1 = expression1, column2 = expression2, ... column_n = expression_n 
[WHERE conditions];

UPDATE table1
SET column1 = (SELECT expression1 FROM table2 WHERE conditions) 
[WHERE conditions];


/* ______________________________________________________________________________________________

Data Manipulation Language (DML) Statements NVL
A função Oracle / PLSQL NVL permite substituir um valor quando um valor nulo é encontrado. __ */

SELECT NVL(supplier_city, 'n/a') FROM suppliers;

/* _______________________________________________________________________________________

AND e OR podem ser combinadas em uma instrução SELECT, INSERT, UPDATE ou DELETE
Ao combinar essas condições, é importante usar parênteses para que o banco de dados saiba qual ordem avaliar cada condição._______ */

INSERT INTO suppliers (supplier_id, supplier_name)
SELECT account_no, customer_name
FROM customers
WHERE (customer_name = 'Apple' OR customer_name = 'Samsung')
AND customer_id > 20;

/* _______________________________________________________________________________________

As condições LIKE combinam uma parte de um valor
_______ */

SELECT last_name
FROM customers 
WHERE last_name LIKE 'Ap%';

SELECT supplier_name
FROM suppliers 
WHERE supplier_name LIKE 'Sm_th';

SELECT * 
FROM suppliers 
WHERE account_number LIKE '92314_';

/* _______________________________________________________________________________________

A cláusula IN do Oracle é usada em uma instrução SELECT, UPDATE, INSERT, OU DELETE como condicional.
_______ */

SELECT * 
FROM suppliers 
WHERE available_products IN (’45’, 20);


/* _______________________________________________________________________________________

cláusula GROUP BY é usada em uma instrução SELECT para coletar dados em vários registros e agrupar os resultados por uma ou mais colunas.
_______ */

SELECT category COUNT(*)
AS "Number of suppliers" 
FROM suppliers 
WHERE available_products > 45 GROUP BY category;

/* _______________________________________________________________________________________

IS NULL é usada para testar um valor NULL 
_______ */

INSERT INTO suppliers (supplier_id, supplier_name) 
SELECT account_no, name
FROM customers 
WHERE city IS NULL;

/* _______________________________________________________________________________________

IS NOT NULL é usada para testar um valor NOT NULL
_______ */

INSERT INTO suppliers (supplier_id, supplier_name) 
SELECT account_no, name 
FROM customers WHERE city IS NOT NULL


/* _______________________________________________________________________________________

ORDER BY é usada para ordenar os registros em seu conjunto de resultados, só pode ser usada em instruções SELECT

_______ */

SELECT supplier_city 
FROM suppliers 
WHERE supplier_name = Microsoft
ORDER BY supplier_city;

/* _______________________________________________________________________________________
LOWER <> UPPER é uma função utilizada para converter todas as letras de uma determinada string para letra maiúscula e minúscula
_______ */

SELECT city 
FROM customers 
WHERE city LIKE UPPER(‘araraquara’);

SELECT city 
FROM customers 
WHERE city LIKE LOWER(‘ARARAQUARA’);


/* _______________________________________________________________________________________

SUBSTR permite extrair uma parte de uma determinada string.

_______ */

SUBSTR(‘This is a test’, 6 ,2); 
Resultado: ‘is’

/* _______________________________________________________________________________________

LENGTH retorna o tamanho de uma string.

_______ */

LEGNTH(‘This is a test’); 
Resultado: 14

/* _______________________________________________________________________________________

REPLACE subistitui uma sequência de caracteres desejados.
_______ */

REPLACE(‘123This is a test123’, ‘123’);
Resultado: ‘This is a test’

/* _______________________________________________________________________________________

Funções de Datas
_______ */


SELECT SYSDATE FROM DUAL

SELECT TRUNC(SYSDATE) FROM DUAL

SELECT TO_CHAR(HIREDATE, ‘DD/MM HH:MI’) 
FROM EMP

/* _______________________________________________________________________________________

Funções de Agrupamento:
_______ */

SELECT COUNT(*) FROM EMP

SELECT COUNT(DISTINCT ENAME) FROM EMP

SELECT MAX(SAL) FROM EMP


/* _______________________________________________________________________________________

A função DECODE Oracle / PLSQL possui a funcionalidade de uma instrução IF-THEN-ELSE.

_______ */

DECODE (  [Coluna], ARGUMENTO 1, RESPOSTA 1, ARGUMENTO N, RESPOSTA N, VALOR DEFAULT );

SELECT ENAME, JOB,
DECODE,(JOB, ‘CLERK’, ‘WORKER’, ‘MANAGER’, ‘BOSS’, ‘UNDEFINED’) RESULT
FROM EMP 
WHERE SAL>1000 AND EMPNO > 1000 AND SAL < 10000
ORDER BY SAL;

/* _______________________________________________________________________________________

BETWEEN é usada para recuperar valores dentro de um intervalo em uma instrução SELECT, INSERT, UPDATE ou DELETE.

_______ */

SELECT * 
FROM order_details 
WHERE order_date BETWEEN TO_DATE ('2014/02/01', 'yyyy/mm/dd') AND TO_DATE ('2014/02/28', 'yyyy/mm/dd');


/* _______________________________________________________________________________________
SubSelect
É possível usar subselect onde deveria haver colunas, tabelas ou até mesmo condições.
_______ */

SELECT (SELECT ENAME FROM EMP WHERE EMPNO = 7839) FROM EMP

SELECT * FROM ( SELECT ENAME FROM EMP)

SELECT * FROM EMP WHERE ENAME = (SELECT ENAME FROM EMP WHERE EMPNO = 7839)

SELECT (SELECT ENAME FROM EMP Z WHERE Z.EMPNO = E.EMPNO ) FROM EMP E

/* _______________________________________________________________________________________

HAVING:  
HAVING é usada em combinação com a cláusula GROUP BY para restringir os grupos de linhas retornadas a apenas aqueles cuja condição é VERDADEIRA.
_______ */

SELECT DEPTNO, AVG(SAL) 
FROM EMP 
GROUP BY DEPTNO HAVING COUNT(*) > 3


/* _______________________________________________________________________________________

Triggers:

_______ */

CREATE [ OR REPLACE ] 
TRIGGER <NOME> 
BEFORE INSERT ON <TABELA> [ FOR EACH ROW ] 
DECLARE <VARIAVEIS> 
BEGIN <CODIGO> EXCEPTION WHEN ... END; /

/* _______________________________________________________________________________________

Package:
Package é um conjunto de objetos PLSQL que são “empacotados” com uma sintaxe especial BEGIN/END.
Podemos ter numa package: Cursores, functions, procedures, exceptions, variáveis, comandos TYPE etc.
Vantagens de se utilizar package: conteúdo oculto, projeto orientado a objetos, persistência de objetos e melhor performance.
_______ */

CREATE [ OR REPLACE ] 
TRIGGER <NOME> BEFORE INSERT ON <TABELA> [ FOR EACH ROW ] 
DECLARE <VARIAVEIS> BEGIN <CODIGO> EXCEPTION WHEN ... END; /

/* _______________________________________________________________________________________

UNION, UNION ALL, INTERSECT e MINUS
_______ */

UNION, UNION ALL, INTERSECT, MINUS

UNION:

SELECT * FROM TABELA1
UNION 
SELECT * FROM TABELA2

UNION ALL:

SELECT * FROM TABELA1
UNION ALL
SELECT * FROM TABELA2

INTERSECT:

SELECT * FROM TABELA1
INTERSECT
SELECT * FROM TABELA2

MINUS:

SELECT * FROM TABELA1
MINUS
SELECT * FROM TABELA2

/* _______________________________________________________________________________________

APELIDOS OU ALIAS PARA TABELAS
_______ */

Anteriormente vimos que era possível definir alias/apelidos para uma coluna:
SELECT NOME AS NOME_COMPLETO

No Oracle, o mesmo também é possível para tabelas:
FROM PESSOA P

Este recurso deve ser utilizado quando for feito uma junção entre duas tabelas, normalmente pode ocorrer situações onde suas colunas possuem a mesma nomenclatura.

/* _______________________________________________________________________________________

Declare
_______ */

DECLARE
V_ID_AUDITORIA VARCHAR2(20);
V_NOME VARCHAR2(100): 'JOÃO';
V_DATA DATE;

V_NOME TABELA1.NOMETABELA%TYPE;
BEGIN

-- Atribuição através de SELECT:

SELECT V_NOME
INTO V_NOME_AUX
FROM TABELA1
WHERE ID = 1;

-- Atribuição Direta:
vlRETORNO := FALSE;
VQTD ACERTOS := 0;
V_AUX := V_AUX + 1;



/* _______________________________________________________________________________________
Estruturas condicionais- IF
_______ */

IF V_ID = 15 THEN
<EXECUTA ALGO>
ELSE
<EXECUTA ALGO>
END IF;

IF V_ID = 15 THEN
<EXECUTA ALGO>
ELSIF V_ID =20 AND V_SIT = 1 THEN
<EXECUTA ALGO>
ELSE
<EXECUTA ALGO>
END IF;

/* _______________________________________________________________________________________

Estruturas condicionais- CASE
_______ */

DECLARE
V_COR   VARCHAR2 (30):= 'VERDE';
V_SEMAFORO VARCHAR2 (30);
BEGIN
V_SEMAFORO := CASE V_COR 
WHEN 'VERDE' THEN 'SIGA EM FRENTE'
WHEN 'AMARELO' THEN 'ATENÇÃO'
WHEN 'VERMELHO' THEN 'PARE'
ELSE 'ERRO NO SEMÁFORO'
END;
END;


/* _______________________________________________________________________________________

SQL JOINS ????
_______ */



/* _______________________________________________________________________________________

Estruturas de repetição – FOR (valor inicial e final)
_______ */

FOR CONTADOR IN [REVERSE] VALOR_INI..VALOR_FIM LOOP 
<EXECUTA COMANDOS>
END LOOP;

-- Estruturas de repetição – FOR (select)

FOR interador 
IN (SELECT CAMPO1, CAMPO2, CAMPO3 FROM TABELA1) 
LOOP <EXECUTA COMANDOS> 
END LOOP;

/* _______________________________________________________________________________________

Estruturasde repetição-WHILE
_______ */

WHILE CONDIÇÃO LOOP
<EXECUTA COMANDO>
END LOOP;

/* _______________________________________________________________________________________

Estruturasde repetição-LOOP
_______ */

LOOP
<EXECUTA COMANDOS>
IF CONDIÇÃO THEN EXIT;
END LOOP;

/* _______________________________________________________________________________________

Function -Estrutura
_______ */

FUNCTION F_TESTE (PARAMETRO IN OUT TIPO_PARAMETRO) RETURN TIPO_RETORNO IS
<DECLARAÇÃO DE VARIAVEIS DA FUNÇÃO>
BEGIN
<EXECUÇÃO DE COMANDOS>
RETURN VALOR_RETORNO;
END;

/* _______________________________________________________________________________________

Function -Exemplo
_______ */

DECLARE
v_teste VARCHAR2(50);
v_tipc NUMBER:=15;

FUNCTION f_teste(p_tipo IN NUMBER) RETURN VARCHAR2 IS vf_descricao VARCHAR2(50);

BEGIN
SELECT TOC.DESCRICAO
INTO vf_descricao
FROM Teste TOC
WHERE TOC.ID = p_tipo;

return vf_descricao;

EXCEPTION
WHEN NO_DATA_FOUND THEN
RETURN 'ERRO AO OBTER DESCRICAO';
END;

BEGIN
v_teste := f_teste(v_tipo);
DBMS_OUTPUT.PUT_LINE(V_TESTE);
END;


/* _______________________________________________________________________________________

Procedures
_______ */

procedure proc_teste(parametro IN OUT tipo_parametro) IS 
<DECLARAÇÃO DE VARIAVEIS DA PROCEDURE>
BEGIN
<EXECUÇÃO DE COMANDOS>
END proc_teste;

/* _______________________________________________________________________________________

PARAMETROS
_______ */




/* _______________________________________________________________________________________


_______ */

/* _______________________________________________________________________________________


_______ */