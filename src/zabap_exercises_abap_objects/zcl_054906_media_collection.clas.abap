CLASS zcl_054906_media_collection DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES ty_media TYPE TABLE OF REF TO zcl_054906_medium WITH NON-UNIQUE DEFAULT KEY.

    METHODS constructor
      IMPORTING !name TYPE string.

    METHODS get_name  RETURNING VALUE(result) TYPE string.
    METHODS get_media RETURNING VALUE(result) TYPE ty_media.

    METHODS add_medium
      IMPORTING !medium TYPE REF TO zcl_054906_medium.

    METHODS get_best_rated_movie
      RETURNING VALUE(result) TYPE REF TO zcl_054906_movie.

  PRIVATE SECTION.
    DATA name  TYPE string.
    DATA media TYPE ty_media.
ENDCLASS.


CLASS zcl_054906_media_collection IMPLEMENTATION.
  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD get_name.
    result = name.
  ENDMETHOD.

  METHOD get_media.
    result = media.
  ENDMETHOD.

  METHOD add_medium.
    APPEND medium TO media.
  ENDMETHOD.

  METHOD get_best_rated_movie.
    DATA max_rating TYPE i.

    LOOP AT media INTO DATA(medium).
      IF medium IS INSTANCE OF zcl_054906_movie AND medium->get_rating( ) > max_rating.
        max_rating = medium->get_rating( ).
        result = CAST #( medium ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
