CLASS zcl_054906_streaming_platform DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES ty_streams TYPE TABLE OF REF TO zif_054906_stream WITH NON-UNIQUE DEFAULT KEY.

    METHODS constructor
      IMPORTING !name TYPE string.

    METHODS get_name    RETURNING VALUE(result) TYPE string.
    METHODS get_streams RETURNING VALUE(result) TYPE ty_streams.

    METHODS add_stream
      IMPORTING stream TYPE REF TO zif_054906_stream.

    METHODS get_longest_stream
      RETURNING VALUE(result) TYPE REF TO zif_054906_stream.

  PRIVATE SECTION.
    DATA name    TYPE string.
    DATA streams TYPE ty_streams.
ENDCLASS.


CLASS zcl_054906_streaming_platform IMPLEMENTATION.
  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD get_name.
    result = name.
  ENDMETHOD.

  METHOD get_streams.
    result = streams.
  ENDMETHOD.

  METHOD add_stream.
    APPEND stream TO streams.
  ENDMETHOD.

  METHOD get_longest_stream.
    DATA max_runtime_in_min TYPE i.

    LOOP AT streams INTO DATA(stream).
      IF stream->get_runtime_in_min( ) > max_runtime_in_min.
        max_runtime_in_min = stream->get_runtime_in_min( ).
        result = CAST #( stream ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
