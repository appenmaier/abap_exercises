CLASS zcl_054906_abap_01 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_abap_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA title           TYPE c LENGTH 50.
    DATA genre           TYPE c LENGTH 10.
    DATA publishing_year TYPE n LENGTH 4.
    DATA runtime_in_min  TYPE i.

    " Movie Information
    title = 'Fight Club'.
    genre = 'Thriller'.
    publishing_year = '1999'.
    runtime_in_min = 139.

    " Output
    out->write( |Title: { title }| ).
    out->write( |Genre: { genre }| ).
    out->write( |Publishing Year: { publishing_year }| ).
    out->write( |Runtime in Minutes: { runtime_in_min }| ).
  ENDMETHOD.
ENDCLASS.
