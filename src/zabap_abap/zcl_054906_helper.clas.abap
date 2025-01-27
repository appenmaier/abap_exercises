CLASS zcl_054906_helper DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS get_travel_with_customer
      IMPORTING travel_id                   TYPE /dmo/travel_id
      RETURNING VALUE(travel_with_customer) TYPE zabap_travel_with_customer
      RAISING   zcx_abap_no_data.

    CLASS-METHODS get_travels
      IMPORTING customer_id    TYPE /dmo/customer_id
      RETURNING VALUE(travels) TYPE z054906_travels
      RAISING   zcx_abap_no_data.
ENDCLASS.


CLASS zcl_054906_helper IMPLEMENTATION.
  METHOD get_travel_with_customer.
    " Solution Exercise 6
    " FINAL(travel) = zcl_abap_helper=>get_travel( travel_id ).
    " FINAL(customer) = zcl_abap_helper=>get_customer( travel-customer_id ).
    " travel_with_customer = CORRESPONDING #( travel ).
    " travel_with_customer = CORRESPONDING #( BASE ( travel_with_customer ) customer ).

    " Solution Exercise 9
    SELECT SINGLE
      FROM /dmo/travel
             INNER JOIN
               /dmo/customer ON /dmo/travel~customer_id = /dmo/customer~customer_id
      FIELDS *
      WHERE /dmo/travel~travel_id = @travel_id
      INTO CORRESPONDING FIELDS OF @travel_with_customer.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( table = '/DMO/TRAVEL'
                                            field = 'TRAVEL_ID'
                                            value = CONV #( travel_id ) ).
    ENDIF.
  ENDMETHOD.

  METHOD get_travels.
    " Solution Exercise 7
    " travels = zcl_abap_helper=>get_travels( customer_id ).

    " Solution Exercise 9
    SELECT FROM /dmo/travel
      FIELDS *
      WHERE customer_id = @customer_id
      INTO TABLE @travels.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( table = '/DMO/TRAVEL'
                                            field = 'CUSTOMER_ID'
                                            value = CONV #( customer_id ) ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
