CLASS zcl_054906_cargo_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_054906_airplane FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING !name                TYPE string
                plane_type           TYPE string
                empty_weight_in_tons TYPE i
                cargo_in_tons        TYPE i
      RAISING   zcx_abap_initial_parameter.

    METHODS get_total_weight_in_tons REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_054906_cargo_plane IMPLEMENTATION.
  METHOD constructor.
    super->constructor( name                 = name
                        plane_type           = plane_type
                        empty_weight_in_tons = empty_weight_in_tons ).

    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD get_total_weight_in_tons.
    total_weight_in_tons = empty_weight_in_tons * '1.1' + cargo_in_tons.
  ENDMETHOD.
ENDCLASS.
