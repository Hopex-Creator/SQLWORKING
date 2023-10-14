-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2023-10-13 18:40:03 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE carretera (
    id_carretera      INTEGER NOT NULL,
    nombre_carretera  NVARCHAR2(80) NOT NULL,
    categoria         NVARCHAR2(80) NOT NULL,
    concluye_confluye NVARCHAR2(80) NOT NULL,
    km_inicial        NUMBER(10, 2) NOT NULL,
    km_final          NUMBER(10, 2) NOT NULL,
    km_confluencia    NUMBER(10, 2) NOT NULL
);

ALTER TABLE carretera ADD CONSTRAINT carretera_pk PRIMARY KEY ( id_carretera );

CREATE TABLE tramo (
    id_tramo               INTEGER NOT NULL,
    id_carretera           INTEGER NOT NULL,
    inicio_comuna          NUMBER(10, 2) NOT NULL,
    final_comuna           NUMBER(10, 2) NOT NULL,
    carretera_id_carretera INTEGER NOT NULL
);

ALTER TABLE tramo ADD CONSTRAINT tramo_pk PRIMARY KEY ( id_tramo,
                                                        carretera_id_carretera );

ALTER TABLE tramo
    ADD CONSTRAINT tramo_carretera_fk FOREIGN KEY ( carretera_id_carretera )
        REFERENCES carretera ( id_carretera );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             2
-- CREATE INDEX                             0
-- ALTER TABLE                              3
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
