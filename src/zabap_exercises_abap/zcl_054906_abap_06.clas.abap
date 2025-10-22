CLASS zcl_054906_abap_06 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_abap_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA travel_id            TYPE /dmo/travel_id.
    DATA travel_with_customer TYPE zabap_travel_with_customer.

    travel_id = '00001223'.

    TRY.
        travel_with_customer = zcl_054906_helper=>get_travel_with_customer( travel_id ).
      CATCH zcx_abap_no_data INTO FINAL(x).
        out->write( x->get_text( ) ).
        RETURN.
    ENDTRY.

    out->write( |Travel ID:   { travel_with_customer-travel_id }| ).
    out->write( |Start:       { travel_with_customer-begin_date DATE = USER }| ).
    out->write( |End:         { travel_with_customer-end_date DATE = USER }| ).
    out->write( |Description: { travel_with_customer-description }| ).
    out->write( |Customer ID: { travel_with_customer-customer_id }| ).
    out->write( |Name:        { travel_with_customer-first_name } { travel_with_customer-last_name }| ).
    out->write( |City:        { travel_with_customer-city }| ).
    out->write( |Country:     { travel_with_customer-country_code }| ).
  ENDMETHOD.
ENDCLASS.
