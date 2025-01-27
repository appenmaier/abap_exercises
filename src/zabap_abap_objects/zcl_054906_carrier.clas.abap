CLASS zcl_054906_carrier DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_054906_partner.

    DATA name      TYPE string            READ-ONLY.
    DATA airplanes TYPE z054906_airplanes READ-ONLY.

    METHODS constructor
      IMPORTING !name TYPE string.

    METHODS add_airplane
      IMPORTING airplane TYPE REF TO zcl_054906_airplane.

    METHODS get_biggest_cargo_plane
      RETURNING VALUE(biggest_cargo_plane) TYPE REF TO zcl_054906_cargo_plane.

    METHODS to_string
      RETURNING VALUE(string) TYPE string.
ENDCLASS.


CLASS zcl_054906_carrier IMPLEMENTATION.
  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD add_airplane.
    APPEND airplane TO airplanes.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.
    DATA max_cargo_in_tons TYPE i.

    LOOP AT airplanes INTO FINAL(airplane).
      IF airplane IS INSTANCE OF zcl_054906_cargo_plane.
        FINAL(cargo_plane) = CAST zcl_054906_cargo_plane( airplane ).
        IF cargo_plane->cargo_in_tons > max_cargo_in_tons.
          biggest_cargo_plane = cargo_plane.
          max_cargo_in_tons = cargo_plane->cargo_in_tons.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD to_string.
    string = |{ name } [|.
    LOOP AT airplanes INTO FINAL(airplane).
      string &&= |{ airplane->to_string( ) }, |.
    ENDLOOP.
    string = substring( val = string
                        len = strlen( string ) - 2 ).
    string &&= ']'.
  ENDMETHOD.

  METHOD zif_054906_partner~to_string.
    string = to_string( ).
  ENDMETHOD.
ENDCLASS.
