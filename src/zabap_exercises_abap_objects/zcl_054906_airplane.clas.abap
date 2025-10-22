CLASS zcl_054906_airplane DEFINITION
  PUBLIC ABSTRACT
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA name                 TYPE string READ-ONLY.
    DATA plane_type           TYPE string READ-ONLY.
    DATA empty_weight_in_tons TYPE i      READ-ONLY.

    CLASS-DATA number_of_airplanes TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING !name                TYPE string
                plane_type           TYPE string
                empty_weight_in_tons TYPE i
      RAISING   zcx_abap_initial_parameter.

    METHODS get_total_weight_in_tons ABSTRACT
      RETURNING VALUE(total_weight_in_tons) TYPE i.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_054906_airplane IMPLEMENTATION.
  METHOD constructor.
    IF name IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'NAME' ).
    ENDIF.

    IF plane_type IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'PLANE_TYPE' ).
    ENDIF.

    IF empty_weight_in_tons IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'EMPTY_WEIGHT_IN_TONS' ).
    ENDIF.

    me->name                 = name.
    me->plane_type           = plane_type.
    me->empty_weight_in_tons = empty_weight_in_tons.
    number_of_airplanes += 1.
  ENDMETHOD.
ENDCLASS.
