CLASS zcl_054906_abap_01 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_abap_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA first_name TYPE string.
    DATA last_name  TYPE string.

    first_name = 'Bruce'.
    last_name = 'Wayne'.

    out->write( |Hello { first_name } {  last_name }, how are you?| ).
  ENDMETHOD.
ENDCLASS.
