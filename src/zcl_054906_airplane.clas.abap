CLASS zcl_054906_airplane DEFINITION
  PUBLIC ABSTRACT
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA name       TYPE string READ-ONLY.
    DATA plane_type TYPE string READ-ONLY.

    CLASS-DATA number_of_airplanes TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING !name      TYPE string
                plane_type TYPE string
      RAISING   zcx_abap_initial_parameter.

    METHODS to_string ABSTRACT
      RETURNING VALUE(string) TYPE string.

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

    me->name       = name.
    me->plane_type = plane_type.
    number_of_airplanes += 1.
  ENDMETHOD.
ENDCLASS.
