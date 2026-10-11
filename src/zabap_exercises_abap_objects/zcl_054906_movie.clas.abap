CLASS zcl_054906_movie DEFINITION
  PUBLIC
  INHERITING FROM zcl_054906_medium FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_054906_stream.

    METHODS constructor
      IMPORTING !title          TYPE string
                genre           TYPE string
                publishing_year TYPE ty_year
                runtime_in_min  TYPE i
      RAISING   zcx_054906_initial_parameter.

    METHODS get_runtime_in_min RETURNING VALUE(result) TYPE i.
    METHODS to_string REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA runtime_in_min TYPE i.

ENDCLASS.


CLASS zcl_054906_movie IMPLEMENTATION.
  METHOD constructor.
    IF runtime_in_min IS INITIAL.
      RAISE EXCEPTION NEW zcx_054906_initial_parameter( parameter = 'RUNTIME_IN_MIN' ).
    ENDIF.
    super->constructor( title           = title
                        genre           = genre
                        publishing_year = publishing_year ).

    me->runtime_in_min = runtime_in_min.
  ENDMETHOD.

  METHOD get_runtime_in_min.
    result = runtime_in_min.
  ENDMETHOD.

  METHOD to_string.
    result = |{ get_title( ) } ({ get_publishing_year( ) }): { get_genre( ) }, { get_rating( ) }%, { get_runtime_in_min( ) }min|.
  ENDMETHOD.

  METHOD zif_054906_stream~get_runtime_in_min.
    result = get_runtime_in_min( ).
  ENDMETHOD.

  METHOD zif_054906_stream~to_string.
    result = to_string( ).
  ENDMETHOD.
ENDCLASS.
