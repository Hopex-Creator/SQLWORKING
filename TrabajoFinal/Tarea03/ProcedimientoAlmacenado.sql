
---**********************************************************************
---1. Obtener información del empleado de un año y departamento determinado.
---**********************************************************************

SELECT e.ape_enf, d.nombre_dep
FROM enfermos e
INNER JOIN departamentos d ON e.id_dep = d.id_dep
WHERE d.nombre_dep = 'ODONTOLOGIA' AND e.fecha_alta < TO_DATE('2018-01-01', 'YYYY-MM-DD');

SELECT *
FROM enfermos
WHERE id_dep = 1586901 AND enfermos.fecha_alta < TO_DATE('2018-01-01', 'YYYY-MM-DD');

---******************************************
--- 2. Agregar nuevos departamentos
---******************************************
CREATE OR REPLACE PROCEDURE INSERT_DEPART(P_ID IN DEPARTAMENTOS.ID_DEP%TYPE,
                                          P_NOMBRE IN DEPARTAMENTOS.NOMBRE_DEP%TYPE,
                                          P_LOCACION IN DEPARTAMENTOS.LOC_PABELLON%TYPE
                                         )
IS
BEGIN
    INSERT INTO DEPARTAMENTOS VALUES(P_ID, P_NOMBRE, P_LOCACION);
    DBMS_OUTPUT.PUT_LINE('DEPARTAMENTO INSERTADO');
EXCEPTION
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('UPS HUBO UN ERROR');
END;
/

CALL INSERT_DEPART (1586931, 'PSIQUIATRIA', 'D103');
EXECUTE INSERT_DEPART (1586932, 'PSIQUIATRIA', 'D103');

SELECT * FROM departamentos;

SET SERVEROUTPUT ON;
SET VERIFY OFF;

    INSERT INTO departamentos (id_dep, nombre_dep, loc_pabellon) VALUES (1586931, 'PSIQUIATRIA', 'D103');


SET autoprint ON;
EXECUTE NuevoDepartamento(:c_sal_promedio);
---******************************************
---3. Obtener promedio de edad de los pacientes.
---******************************************
CREATE OR REPLACE PROCEDURE pa_promedio_edad_enf( c_sal_promedio OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN c_sal_promedio FOR
    SELECT round(avg(edad_enf),2) as "Edad_promedio_pacientes", nombre_dep FROM enfermos NATURAL JOIN departamentos GROUP BY nombre_dep;
END;
/
SET autoprint ON;
VARIABLE c_sal_promedio REFCURSOR;
EXECUTE pa_promedio_edad_enf(:c_sal_promedio);


---**********************************
---4. Obtener información del empleado
---**********************************
CREATE OR REPLACE PROCEDURE pa_info_empleado(cursor_sal_emp OUT SYS_REFCURSOR, xid INTEGER)
AS    
BEGIN
    OPEN cursor_sal_emp FOR SELECT ape_emp ||'| oficio:'|| oficio_emp ||', salario: '||salario_emp as "Informacion_empleado"FROM empleados WHERE id_emp=xid;
END;
/
SET autoprint ON;

VARIABLE cursor_sal_emp REFCURSOR;
EXECUTE pa_info_empleado(:cursor_sal_emp, 50260100);

---*****-*********************************************
--- 5. Dar de baja a empleado
---*****-*********************************************
CREATE OR REPLACE PROCEDURE dar_baja_emp(xapellido in varchar2)
AS
BEGIN   
    INSERT INTO emp_baja(id_emp,id_dep, ape_emp,oficio_emp,direc_emp,salario_emp,comision_emp,fecha_alta, fecha_baja)
    SELECT id_emp, id_dep, ape_emp,oficio_emp,direc_emp,salario_emp,comision_emp,fecha_alta, CURRENT_DATE FROM empleados WHERE ape_emp=xapellido;
    DELETE FROM empleados WHERE ape_emp=xapellido;
END;
/
EXECUTE dar_baja_emp('Reyes Ramírez');
SELECT * FROM empleados;
SELECT * FROM empleados WHERE ape_emp='Reyes Ramírez';
SELECT * FROM emp_baja;

---*****-*********************************************
