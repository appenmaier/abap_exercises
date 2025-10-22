CLASS zcl_054906_passenger_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_054906_airplane FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA number_of_seats TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING !name                TYPE string
                plane_type           TYPE string
                empty_weight_in_tons TYPE i
                number_of_seats      TYPE i
      RAISING   zcx_abap_initial_parameter.

    METHODS get_total_weight_in_tons REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_054906_passenger_plane IMPLEMENTATION.
  METHOD constructor.
    super->constructor( name                 = name
                        plane_type           = plane_type
                        empty_weight_in_tons = empty_weight_in_tons ).

    me->number_of_seats = number_of_seats.
  ENDMETHOD.

  METHOD get_total_weight_in_tons.
    total_weight_in_tons = empty_weight_in_tons * '1.1' + number_of_seats * '0.08'.
  ENDMETHOD.
ENDCLASS.
