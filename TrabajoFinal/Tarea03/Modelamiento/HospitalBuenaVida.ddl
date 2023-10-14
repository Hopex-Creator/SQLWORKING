-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2023-10-12 13:41:52 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE departamentos (
    id_dep       INTEGER NOT NULL,
    nombre_dep   VARCHAR2(80 CHAR) NOT NULL,
    loc_pabellon VARCHAR2(5 CHAR) NOT NULL
);

ALTER TABLE departamentos ADD CONSTRAINT departamentos_pk PRIMARY KEY ( id_dep );

CREATE TABLE empleados (
    id_emp       INTEGER NOT NULL,
    id_dep       INTEGER NOT NULL,
    ape_emp      VARCHAR2(80 CHAR) NOT NULL,
    oficio_emp   VARCHAR2(80 CHAR) NOT NULL,
    direc_emp    VARCHAR2(100 CHAR) NOT NULL,
    salario_emp  NUMBER NOT NULL,
    comision_emp NUMBER NOT NULL
);

ALTER TABLE empleados ADD CONSTRAINT empleados_pk PRIMARY KEY ( id_emp );

CREATE TABLE enfermos (
    id_enf      INTEGER NOT NULL,
    id_dep      INTEGER NOT NULL,
    ape_enf     VARCHAR2(80 CHAR) NOT NULL,
    direc_enf   VARCHAR2(80 CHAR) NOT NULL,
    fec_nac_enf VARCHAR2(100 CHAR) NOT NULL,
    edad_enf    INTEGER NOT NULL,
    fecha_alta  DATE NOT NULL
);

ALTER TABLE enfermos ADD CONSTRAINT enfermos_pk PRIMARY KEY ( id_enf );

ALTER TABLE empleados
    ADD CONSTRAINT empleados_departamentos_fk FOREIGN KEY ( id_dep )
        REFERENCES departamentos ( id_dep );

ALTER TABLE enfermos
    ADD CONSTRAINT enfermos_departamentos_fk FOREIGN KEY ( id_dep )
        REFERENCES departamentos ( id_dep );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              5
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
