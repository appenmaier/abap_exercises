CLASS zcl_054906_medium_helper DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS class_constructor.

    CLASS-METHODS check_genre
      IMPORTING genre         TYPE string
      RETURNING VALUE(result) TYPE abap_bool.

  PRIVATE SECTION.
    CLASS-DATA genres TYPE TABLE OF string.
ENDCLASS.


CLASS zcl_054906_medium_helper IMPLEMENTATION.
  METHOD class_constructor.
    APPEND 'Thriller' TO genres.
    APPEND 'Science-Fiction' TO genres.
    APPEND 'Drama' TO genres.
  ENDMETHOD.

  METHOD check_genre.
    IF line_exists( genres[ table_line = genre ] ).
      result = abap_true.
    ELSE.
      result = abap_false.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
