CLASS zcl_054906_abap_07 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_abap_07 IMPLEMENTATION.
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

    out->write( travels ).
  ENDMETHOD.
ENDCLASS.
