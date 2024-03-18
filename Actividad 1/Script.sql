SET SERVEROUTPUT ON;
--CASO 1
--Primera Ejecucion

VAR b_porcentaje NUMBER;
EXEC :b_porcentaje:=40;
VAR b_run VARCHAR2(10);
EXEC :b_run:='11846972';
--Segunda Ejecutar
VAR b_run2 VARCHAR2(10);
EXEC :b_run2 := '18560875'





 
DECLARE
    v_rut VARCHAR2(10);
    v_nombre VARCHAR2(100);
    v_sueldo EMPLEADO.SUELDO_EMP %TYPE;
    v_bono NUMBER;
    

BEGIN

    SELECT NUMRUT_EMP || '-' || DVRUT_EMP,
           NOMBRE_EMP || ' ' || APPATERNO_EMP || ' ' || APMATERNO_EMP,
           SUELDO_EMP
    INTO v_rut,v_nombre,v_sueldo
    FROM EMPLEADO
    WHERE NUMRUT_EMP = :b_run2;
    v_bono := ROUND(v_sueldo * 0.4);
    DBMS_OUTPUT.PUT_LINE('DATOS CALCULO BONIFICACION EXTRA DEL  ' || :b_porcentaje || '% DEL SUELDO');
    DBMS_OUTPUT.PUT_LINE('Nombre Empleado:  ' || v_nombre);
    DBMS_OUTPUT.PUT_LINE('RUT Empleado:  ' || v_rut);
    DBMS_OUTPUT.PUT_LINE('Sueldo:  $' || v_sueldo);
    DBMS_OUTPUT.PUT_LINE('Bono:    $' || v_bono);
    DBMS_OUTPUT.PUT_LINE('Viendo nomas');

END;

/*
--CASO 2
VAR b_rut VARCHAR2(10);
EXEC :b_rut := 12487147;
VAR b_rut2 VARCHAR2(10);
EXEC :b_rut2 := 12861354;
VAR b_rut3 VARCHAR2(10);
EXEC :b_rut3 := 13050258

DECLARE
    rut VARCHAR2(10);
    nombre VARCHAR2(50);
    est_civil VARCHAR2(50);
    renta CLIENTE.RENTA_CLI %TYPE;


BEGIN
    SELECT NUMRUT_CLI || '-' || DVRUT_CLI,
       NOMBRE_CLI || ' ' || APPATERNO_CLI || ' ' || APMATERNO_CLI,
       EC.DESC_ESTCIVIL,
       C.RENTA_CLI


        INTO rut,nombre,est_civil,renta
        FROM CLIENTE C JOIN ESTADO_CIVIL EC
            ON C.ID_ESTCIVIL = EC.ID_ESTCIVIL
        WHERE C.NUMRUT_CLI = :b_rut;

        DBMS_OUTPUT.PUT_LINE('DATOS DEL CLIENTE.');
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || nombre);
        DBMS_OUTPUT.PUT_LINE('RUN:' || rut);
        DBMS_OUTPUT.PUT_LINE('Estado Civil: ' || est_civil);
        DBMS_OUTPUT.PUT_LINE('Renta: ' || to_char(renta,'$9g999g999'));


END;
*/

--CASO 3
/*
var b_rut VARCHAR2(10);
EXEC :b_rut := '12260812';

var b_rut2 VARCHAR2(10);
EXEC :b_rut2 := '11999100';


DECLARE
    nombre VARCHAR2(100);
    rut VARCHAR2(10);
    sueldo EMPLEADO.SUELDO_EMP%TYPE;
    sueldo_reajustado NUMBER(10);
    reajuste NUMBER(10);
    sueldo_reajustado2 NUMBER(10);
    reajuste2 NUMBER(10);


BEGIN

    SELECT NOMBRE_EMP, NUMRUT_EMP || '-' || DVRUT_EMP,
            SUELDO_EMP,
            ROUND(SUELDO_EMP * (1+8.5/100)),
            ROUND(SUELDO_EMP * (1+8.5/100)) - SUELDO_EMP,

            ROUND(SUELDO_EMP * (1+20/100)),
            ROUND(SUELDO_EMP * (1+8.5/100)) - SUELDO_EMP
            INTO NOMBRE,RUT,SUELDO,SUELDO_REAJUSTADO,REAJUSTE, sueldo_reajustado2,reajuste2
            FROM EMPLEADO
            WHERE NUMRUT_EMP = :b_rut
            AND SUELDO_EMP BETWEEN 200000 AND 400000;

            DBMS_OUTPUT.PUT_LINE('NOMBRE DEL EMPLEADO: ' || NOMBRE);
            DBMS_OUTPUT.PUT_LINE('RUT: ' || RUT);
            DBMS_OUTPUT.PUT_LINE('SIMULACION 1:');
            DBMS_OUTPUT.PUT_LINE('SUELDO ACTUAL: $' || sueldo);
            DBMS_OUTPUT.PUT_LINE('SUELDO REAJUSTADO: $'|| sueldo_reajustado);
            DBMS_OUTPUT.PUT_LINE('REAJUSTE: $' || reajuste);
            DBMS_OUTPUT.PUT_LINE('SIMULACION 2');
            DBMS_OUTPUT.PUT_LINE('SUELDO ACTUAL:' || sueldo);
            DBMS_OUTPUT.PUT_LINE('SUELDO REAJUSTADO: $'|| sueldo_reajustado2);
            DBMS_OUTPUT.PUT_LINE('REAJUSTE: $' || reajuste2) ;

END;
*/

/*
VAR b_tipo_propiedad VARCHAR2(100);
EXEC :b_tipo_propiedad := 'Parcela sin Casa';

VAR b_tipo_propiedad2 VARCHAR2(100);
EXEC :b_tipo_propiedad2 := 'Parcela con Casa';

VAR b_total_propiedades2 VARCHAR2(100);

VAR b_tipo_propiedad3 VARCHAR2(100);
EXEC :b_tipo_propiedad3 := 'Sitio';

VAR b_tipo_propiedad4 VARCHAR2(100);
EXEC :b_tipo_propiedad4 := 'Local Comercial';

VAR b_tipo_propiedad5 VARCHAR2(100);
EXEC :b_tipo_propiedad5 := 'Departamento Amoblado';

VAR b_tipo_propiedad6 VARCHAR2(100);
EXEC :b_tipo_propiedad6 := 'Departamento sin Amoblar';

VAR b_tipo_propiedad7 VARCHAR2(100);
EXEC :b_tipo_propiedad7 := 'Casa Amoblada';

VAR b_tipo_propiedad8 VARCHAR2(100);
EXEC :b_tipo_propiedad8 := 'Casa sin Amoblar';




DECLARE
    tipo_propiedad VARCHAR2(100);
    total_propiedad VARCHAR2(100);
    total_valorArriendo VARCHAR2(100);

BEGIN
    
    

SELECT TP.DESC_TIPO_PROPIEDAD,
       COUNT(DISTINCT P.NRO_PROPIEDAD) ,
       SUM(P.VALOR_ARRIENDO)
       INTO tipo_propiedad,total_propiedad, total_valorArriendo
FROM TIPO_PROPIEDAD TP 
    JOIN PROPIEDAD P
        ON TP.ID_TIPO_PROPIEDAD = P.ID_TIPO_PROPIEDAD
WHERE TP.DESC_TIPO_PROPIEDAD = :b_tipo_propiedad
        
        
GROUP BY TP.DESC_TIPO_PROPIEDAD;


    --1ra propiedad
    DBMS_OUTPUT.PUT_LINE('RESUMEN DE: ' || :b_tipo_propiedad);
    DBMS_OUTPUT.PUT_LINE('Total de propiedades: ' || total_propiedad);
    DBMS_OUTPUT.PUT_LINE('Valor total de arriendo: $' || total_valorArriendo);
    DBMS_OUTPUT.PUT_LINE('');

--2da Propiedad

SELECT TP.DESC_TIPO_PROPIEDAD,
       COUNT(DISTINCT P.NRO_PROPIEDAD) ,
       SUM(P.VALOR_ARRIENDO)
       INTO tipo_propiedad,total_propiedad, total_valorArriendo
FROM TIPO_PROPIEDAD TP 
    JOIN PROPIEDAD P
        ON TP.ID_TIPO_PROPIEDAD = P.ID_TIPO_PROPIEDAD
WHERE TP.DESC_TIPO_PROPIEDAD = :b_tipo_propiedad2
        
        
GROUP BY TP.DESC_TIPO_PROPIEDAD;


    --2da propiedad
    DBMS_OUTPUT.PUT_LINE('RESUMEN DE:' || :b_tipo_propiedad2);
    DBMS_OUTPUT.PUT_LINE('Total de propiedades: ' || total_propiedad);
    DBMS_OUTPUT.PUT_LINE('Valor total de arriendo: $' || total_valorArriendo);
    DBMS_OUTPUT.PUT_LINE('');

SELECT TP.DESC_TIPO_PROPIEDAD,
       COUNT(DISTINCT P.NRO_PROPIEDAD) ,
       SUM(P.VALOR_ARRIENDO)
       INTO tipo_propiedad,total_propiedad, total_valorArriendo
FROM TIPO_PROPIEDAD TP 
    JOIN PROPIEDAD P
        ON TP.ID_TIPO_PROPIEDAD = P.ID_TIPO_PROPIEDAD
WHERE TP.DESC_TIPO_PROPIEDAD = :b_tipo_propiedad3
        
        
GROUP BY TP.DESC_TIPO_PROPIEDAD;


    --3ra propiedad
    DBMS_OUTPUT.PUT_LINE('RESUMEN DE:  ' || :b_tipo_propiedad3);
    DBMS_OUTPUT.PUT_LINE('Total de propiedades: ' || total_propiedad);
    DBMS_OUTPUT.PUT_LINE('Valor total de arriendo: $' || total_valorArriendo);
    DBMS_OUTPUT.PUT_LINE('');



SELECT TP.DESC_TIPO_PROPIEDAD,
       COUNT(DISTINCT P.NRO_PROPIEDAD) ,
       SUM(P.VALOR_ARRIENDO)
       INTO tipo_propiedad,total_propiedad, total_valorArriendo
FROM TIPO_PROPIEDAD TP 
    JOIN PROPIEDAD P
        ON TP.ID_TIPO_PROPIEDAD = P.ID_TIPO_PROPIEDAD
WHERE TP.DESC_TIPO_PROPIEDAD = :b_tipo_propiedad4
        
        
GROUP BY TP.DESC_TIPO_PROPIEDAD;


    --4ta propiedad
    DBMS_OUTPUT.PUT_LINE('RESUMEN DE:  ' || :b_tipo_propiedad4);
    DBMS_OUTPUT.PUT_LINE('Total de propiedades: ' || total_propiedad);
    DBMS_OUTPUT.PUT_LINE('Valor total de arriendo: $' || total_valorArriendo);
    DBMS_OUTPUT.PUT_LINE('');
    
SELECT TP.DESC_TIPO_PROPIEDAD,
       COUNT(DISTINCT P.NRO_PROPIEDAD) ,
       SUM(P.VALOR_ARRIENDO)
       INTO tipo_propiedad,total_propiedad, total_valorArriendo
FROM TIPO_PROPIEDAD TP 
    JOIN PROPIEDAD P
        ON TP.ID_TIPO_PROPIEDAD = P.ID_TIPO_PROPIEDAD
WHERE TP.DESC_TIPO_PROPIEDAD = :b_tipo_propiedad5
        
        
GROUP BY TP.DESC_TIPO_PROPIEDAD;


    --3ra propiedad
    DBMS_OUTPUT.PUT_LINE('RESUMEN DE:  ' || :b_tipo_propiedad5);
    DBMS_OUTPUT.PUT_LINE('Total de propiedades: ' || total_propiedad);
    DBMS_OUTPUT.PUT_LINE('Valor total de arriendo: $' || total_valorArriendo);
    DBMS_OUTPUT.PUT_LINE('');
    

SELECT TP.DESC_TIPO_PROPIEDAD,
       COUNT(DISTINCT P.NRO_PROPIEDAD) ,
       SUM(P.VALOR_ARRIENDO)
       INTO tipo_propiedad,total_propiedad, total_valorArriendo
FROM TIPO_PROPIEDAD TP 
    JOIN PROPIEDAD P
        ON TP.ID_TIPO_PROPIEDAD = P.ID_TIPO_PROPIEDAD
WHERE TP.DESC_TIPO_PROPIEDAD = :b_tipo_propiedad6
        
        
GROUP BY TP.DESC_TIPO_PROPIEDAD;


    --3ra propiedad
    DBMS_OUTPUT.PUT_LINE('RESUMEN DE:  ' || :b_tipo_propiedad6);
    DBMS_OUTPUT.PUT_LINE('Total de propiedades: ' || total_propiedad);
    DBMS_OUTPUT.PUT_LINE('Valor total de arriendo: $' || total_valorArriendo);
    DBMS_OUTPUT.PUT_LINE('');


SELECT TP.DESC_TIPO_PROPIEDAD,
       COUNT(DISTINCT P.NRO_PROPIEDAD) ,
       SUM(P.VALOR_ARRIENDO)
       INTO tipo_propiedad,total_propiedad, total_valorArriendo
FROM TIPO_PROPIEDAD TP 
    JOIN PROPIEDAD P
        ON TP.ID_TIPO_PROPIEDAD = P.ID_TIPO_PROPIEDAD
WHERE TP.DESC_TIPO_PROPIEDAD = :b_tipo_propiedad7
        
        
GROUP BY TP.DESC_TIPO_PROPIEDAD;


    --3ra propiedad
    DBMS_OUTPUT.PUT_LINE('RESUMEN DE:' || :b_tipo_propiedad7);
    DBMS_OUTPUT.PUT_LINE('Total de propiedades: ' || total_propiedad);
    DBMS_OUTPUT.PUT_LINE('Valor total de arriendo: $' || total_valorArriendo);
    DBMS_OUTPUT.PUT_LINE('');

SELECT TP.DESC_TIPO_PROPIEDAD,
       COUNT(DISTINCT P.NRO_PROPIEDAD) ,
       SUM(P.VALOR_ARRIENDO)
       INTO tipo_propiedad,total_propiedad, total_valorArriendo
FROM TIPO_PROPIEDAD TP 
    JOIN PROPIEDAD P
        ON TP.ID_TIPO_PROPIEDAD = P.ID_TIPO_PROPIEDAD
WHERE TP.DESC_TIPO_PROPIEDAD = :b_tipo_propiedad8
        
        
GROUP BY TP.DESC_TIPO_PROPIEDAD;


    --3ra propiedad
    DBMS_OUTPUT.PUT_LINE('RESUMEN DE:' || :b_tipo_propiedad8);
    DBMS_OUTPUT.PUT_LINE('Total de propiedades: ' || total_propiedad);
    DBMS_OUTPUT.PUT_LINE('Valor total de arriendo: $' || total_valorArriendo);
    DBMS_OUTPUT.PUT_LINE('');
END;
*/ 

