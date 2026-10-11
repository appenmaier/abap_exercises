CLASS zcl_054906_abap_04 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_abap_04 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    CONSTANTS co_ratings TYPE i VALUE 100.

    DATA title            TYPE c LENGTH 50.
    DATA genre            TYPE c LENGTH 10.
    DATA publishing_year  TYPE n LENGTH 4.
    DATA runtime_in_min   TYPE i.
    DATA rating_generator TYPE REF TO cl_abap_random_int.
    DATA rating           TYPE i.
    DATA total_rating     TYPE i.
    DATA average_rating   TYPE p LENGTH 3 DECIMALS 2.
    DATA rating_text      TYPE string.

    " Movie Information
    title = 'Fight Club'.
    genre = 'Thriller'.
    publishing_year = '1999'.
    runtime_in_min = 139.

    " Ratings
    rating_generator = cl_abap_random_int=>create( seed = CONV i( cl_abap_context_info=>get_system_time( ) )
                                                   min  = 8
                                                   max  = 10 ).
    DO co_ratings TIMES.
      rating = rating_generator->get_next( ).
      total_rating += rating.
    ENDDO.
    average_rating = total_rating / co_ratings.

    " Average Rating Text
    IF average_rating BETWEEN '0.00' AND '1.99'.
      rating_text = 'Very Bad'.
    ELSEIF average_rating BETWEEN '2.00' AND '3.99'.
      rating_text = 'Bad'.
    ELSEIF average_rating BETWEEN '4.00' AND '5.99'.
      rating_text = 'Ok'.
    ELSEIF average_rating BETWEEN '6.00' AND '7.99'.
      rating_text = 'Good'.
    ELSE.
      rating_text = 'Very Good'.
    ENDIF.

    " Output
    out->write( |Title: { title }| ).
    out->write( |Genre: { genre }| ).
    out->write( |Publishing Year: { publishing_year }| ).
    out->write( |Runtime in Minutes: { runtime_in_min }| ).
    out->write( |\n| ).
    out->write( |Average Rating: { average_rating NUMBER = USER } ({ rating_text })| ).
  ENDMETHOD.
ENDCLASS.
