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
    DBMS_OUTPUT.PUT_LINE('Sueldo:  $' || TO_CHAR(v_sueldo,'999G999'));
    DBMS_OUTPUT.PUT_LINE('Bono:    $' || TO_CHAR(v_bono,'999G999'));


END;