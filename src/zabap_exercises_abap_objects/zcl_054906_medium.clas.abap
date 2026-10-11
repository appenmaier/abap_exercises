CLASS zcl_054906_medium DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES ty_year TYPE n LENGTH 4.

    METHODS get_title           RETURNING VALUE(result) TYPE string.
    METHODS get_genre           RETURNING VALUE(result) TYPE string.
    METHODS get_publishing_year RETURNING VALUE(result) TYPE ty_year.
    METHODS get_rating          RETURNING VALUE(result) TYPE i.
    METHODS set_rating          IMPORTING rating        TYPE i.

    METHODS constructor
      IMPORTING !title          TYPE string
                genre           TYPE string
                publishing_year TYPE ty_year
      RAISING   zcx_054906_initial_parameter.

    METHODS to_string RETURNING VALUE(result) TYPE string.

  PRIVATE SECTION.
    DATA title           TYPE string.
    DATA genre           TYPE string.
    DATA publishing_year TYPE ty_year.
    DATA rating          TYPE i.

ENDCLASS.


CLASS zcl_054906_medium IMPLEMENTATION.
  METHOD constructor.
    IF title IS INITIAL.
      RAISE EXCEPTION NEW zcx_054906_initial_parameter( parameter = 'TITLE' ).
    ENDIF.
    IF genre IS INITIAL.
      RAISE EXCEPTION NEW zcx_054906_initial_parameter( parameter = 'GENRE' ).
    ENDIF.
    IF publishing_year IS INITIAL.
      RAISE EXCEPTION NEW zcx_054906_initial_parameter( parameter = 'PUBLISHING_YEAR' ).
    ENDIF.

    me->title           = title.
    me->genre           = genre.
    me->publishing_year = publishing_year.
  ENDMETHOD.

  METHOD get_title.
    result = title.
  ENDMETHOD.

  METHOD get_genre.
    result = genre.
  ENDMETHOD.

  METHOD get_publishing_year.
    result = publishing_year.
  ENDMETHOD.

  METHOD get_rating.
    result = rating.
  ENDMETHOD.

  METHOD set_rating.
    me->rating = rating.
  ENDMETHOD.

  METHOD to_string.
    result = |{ title }, { genre }, { publishing_year }, { rating }|.
  ENDMETHOD.
ENDCLASS.
