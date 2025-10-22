CLASS zcl_abap_helper DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS get_customer
      IMPORTING customer_id     TYPE /dmo/customer_id
      RETURNING VALUE(customer) TYPE zabap_customer
      RAISING   zcx_abap_no_data.

    CLASS-METHODS get_travel
      IMPORTING travel_id     TYPE /dmo/travel_id
      RETURNING VALUE(travel) TYPE zabap_travel
      RAISING   zcx_abap_no_data.

    CLASS-METHODS get_travels
      IMPORTING customer_id    TYPE /dmo/customer_id
      RETURNING VALUE(travels) TYPE zabap_travels
      RAISING   zcx_abap_no_data.

ENDCLASS.


CLASS zcl_abap_helper IMPLEMENTATION.
  METHOD get_customer.
    SELECT SINGLE FROM /dmo/customer
      FIELDS *
      WHERE customer_id = @customer_id
      INTO CORRESPONDING FIELDS OF @customer.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( table = '/DMO/CUSTOMER'
                                            field = 'CUSTOMER_ID'
                                            value = CONV #( customer_id ) ).
    ENDIF.
  ENDMETHOD.

  METHOD get_travel.
    SELECT SINGLE FROM /dmo/travel
      FIELDS *
      WHERE travel_id = @travel_id
      INTO CORRESPONDING FIELDS OF @travel.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( table = '/DMO/TRAVEL'
                                            field = 'TRAVEL_ID'
                                            value = CONV #( travel_id ) ).
    ENDIF.
  ENDMETHOD.

  METHOD get_travels.
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
