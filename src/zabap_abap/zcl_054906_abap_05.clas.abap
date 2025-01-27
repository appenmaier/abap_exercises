CLASS zcl_054906_abap_05 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_abap_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA customer_id TYPE /dmo/customer_id.
    DATA customer    TYPE z054906_customer.

    customer_id = '000008'.

    TRY.
        customer = zcl_abap_helper=>get_customer( customer_id ).
      CATCH zcx_abap_no_data INTO FINAL(x).
        out->write( x->get_text( ) ).
        RETURN.
    ENDTRY.

    out->write( |Customer ID: { customer-customer_id }| ).
    out->write( |Name:        { customer-first_name } { customer-last_name }| ).
    out->write( |City:        { customer-city }| ).
    out->write( |Country:     { customer-country_code }| ).
  ENDMETHOD.
ENDCLASS.
