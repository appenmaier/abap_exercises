CLASS zcl_054906_abap_08 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_abap_08 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA customer_id TYPE /dmo/customer_id.
    DATA travels     TYPE z054906_travels.

    customer_id = '000008'.

    TRY.
        travels = zcl_054906_helper=>get_travels( customer_id ).
      CATCH zcx_abap_no_data INTO FINAL(x).
        out->write( x->get_text( ) ).
        RETURN.
    ENDTRY.

    DELETE travels WHERE begin_date < cl_abap_context_info=>get_system_date( ).

    LOOP AT travels ASSIGNING FIELD-SYMBOL(<travel>).
      <travel>-booking_fee *= '1.1'.
    ENDLOOP.

    out->write( travels ).
  ENDMETHOD.
ENDCLASS.
