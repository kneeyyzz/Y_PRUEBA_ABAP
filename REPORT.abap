*&------------------------------------------*
*& Prueba de eventos en Y_PRUEBA_ABAP_1.    *
*&                                          *
*&------------------------------------------*

REPORT Y_PRUEBA_ABAP_1.

CONSTANTS: c_diez TYPE i VALUE 10. "Variable constante (NO PUEDE SER MODIFICADA)

TYPES: BEGIN OF wa_personas, "Define una estructura de datos
  id TYPE i,
  ciudad(20) TYPE c,
  nombre(20) TYPE c,
  END OF wa_personas.

TYPES: ty_t_persona TYPE STANDARD TABLE OF wa_personas. "Define tipo tabla con la estructura de wa_personas


  DATA: l_es_persona TYPE wa_personas, "Crea una variable estructura de tipo wa_personas
        l_ti_persona TYPE ty_t_persona,"Crea una tabla de tipo l_es_persona
        v_suma       TYPE i.


  PARAMETERS: p_id     TYPE i OBLIGATORY,
              p_ciudad(20) TYPE c OBLIGATORY,
              p_nombre(20) TYPE c OBLIGATORY,
              p_val1   TYPE i,
              p_val2   TYPE i.

  TOP-OF-PAGE.
  WRITE:/ 'Machete afiladol.'.
  ULINE.

   AT SELECTION-SCREEN.
     CLEAR l_es_persona.
     l_es_persona-id = p_id.
     l_es_persona-ciudad = p_ciudad.
     l_es_persona-nombre = p_nombre.

     APPEND l_es_persona TO  l_ti_persona.

     IF  p_val1 > 100.
       MESSAGE e000(Y_BORRAR_ERROR_PRUEB).
     ENDIF.
    v_suma = p_val1 + p_val2 + c_diez.

  END-OF-SELECTION.
  WRITE 'Suma los datos indexados más la constante'.
  WRITE c_diez. "Es una constante definida anteriormente
  WRITE v_suma.
  SKIP.
  WRITE 'Hora del sistema: '.
  WRITE SY-DATUM. "Contiene la hora del sistema
  SKIP.
  WRITE 'Los datos de la tabla son:'.
  LOOP AT l_ti_persona INTO l_es_persona.
   WRITE : / l_es_persona-id, l_es_persona-ciudad, l_es_persona-nombre.
  ENDLOOP.