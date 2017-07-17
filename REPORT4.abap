*&---------------------------------------------------------------------*
*& Report  Y_ALV_TONY
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT Y_ALV_TONY.

* Cargamos los datos tipo slis
TYPE-POOLS SLIS.
DATA: G_INT_FIELDCAT TYPE SLIS_T_FIELDCAT_ALV,
      G_ST_FIELDCAT  TYPE SLIS_FIELDCAT_ALV.
TYPES TY_T_PERSONA TYPE STANDARD TABLE OF YUSUARIOPRUEBA.

DATA: L_TI_PERSONA  TYPE TY_T_PERSONA.

SELECT * FROM YUSUARIOPRUEBA INTO TABLE L_TI_PERSONA.


* Imprimimos en pantalla los valores. Fieldcat
G_ST_FIELDCAT-FIELDNAME = 'ID'. "Nombre del campo de la tabla
G_ST_FIELDCAT-SELTEXT_M = 'Identificador en sistema'. "Descripción mediana
G_ST_FIELDCAT-SELTEXT_S = 'ID.'. "Descripción corta
APPEND G_ST_FIELDCAT TO G_INT_FIELDCAT.



* Imprimimos en pantalla los valores. Fieldcat
G_ST_FIELDCAT-FIELDNAME = 'NOMBRE'. "Nombre del campo de la tabla
G_ST_FIELDCAT-SELTEXT_M = 'Nombre persona'. "Descripción mediana
G_ST_FIELDCAT-SELTEXT_S = 'Nom.'. "Descripción corta
APPEND G_ST_FIELDCAT TO G_INT_FIELDCAT.


G_ST_FIELDCAT-FIELDNAME = 'CIUDAD'.
G_ST_FIELDCAT-SELTEXT_M = 'Ciudad persona'.
G_ST_FIELDCAT-SELTEXT_S = 'Ciudad.'.
APPEND G_ST_FIELDCAT TO G_INT_FIELDCAT.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    IT_FIELDCAT   = G_INT_FIELDCAT[]
    I_GRID_TITLE  = 'Y_ALV_TONY/Tabla-vista para BD PERSONA creada por Toño'
  TABLES
    T_OUTTAB      = L_TI_PERSONA[]
  EXCEPTIONS
    PROGRAM_ERROR = 1
    OTHERS        = 2.