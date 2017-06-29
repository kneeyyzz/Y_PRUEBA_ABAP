*&------------------------------------------*
*& Prueba de ingreso de registros en una BD *
*& en Y_PRUEBA_ABAP_2.                      *
*&------------------------------------------*

REPORT Y_PRUEBA_ABAP_2.

DATA: l_es_persona TYPE YUSUARIOPRUEBA.

PARAMETERS: p_id(3) TYPE i OBLIGATORY,
            p_nombre(20) TYPE c OBLIGATORY,
            p_ciudad(20) TYPE c.
 TOP-OF-PAGE.
  WRITE:/ 'Programa para ingresar datos en BD y mostrarlos'.
  ULINE.
  
  AT SELECTION-SCREEN.
     CLEAR l_es_persona.
     l_es_persona-id = p_id.
     l_es_persona-ciudad = p_ciudad.
     l_es_persona-nombre = p_nombre.

     INSERT into YUSUARIOPRUEBA VALUES l_es_persona.