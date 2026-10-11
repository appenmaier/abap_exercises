CLASS zcl_054906_video_game DEFINITION
  PUBLIC
  INHERITING FROM zcl_054906_medium FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING !title          TYPE string
                genre           TYPE string
                publishing_year TYPE ty_year
                !system         TYPE string
      RAISING   zcx_054906_initial_parameter.

    METHODS get_system RETURNING VALUE(result) TYPE string.
    METHODS to_string REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA system TYPE string.

ENDCLASS.


CLASS zcl_054906_video_game IMPLEMENTATION.
  METHOD constructor.
    IF system IS INITIAL.
      RAISE EXCEPTION NEW zcx_054906_initial_parameter( parameter = 'SYSTEM' ).
    ENDIF.
    super->constructor( title           = title
                        genre           = genre
                        publishing_year = publishing_year ).

    me->system = system.
  ENDMETHOD.

  METHOD get_system.
    result = system.
  ENDMETHOD.

  METHOD to_string.
    result = |{ get_title( ) } ({ get_system( ) }): { get_genre( ) }, { get_publishing_year( ) }, { get_rating( ) }%|.
  ENDMETHOD.
ENDCLASS.
