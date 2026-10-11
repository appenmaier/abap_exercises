CLASS zcl_054906_abap_03 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_abap_03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA title           TYPE c LENGTH 50.
    DATA genre           TYPE c LENGTH 10.
    DATA publishing_year TYPE n LENGTH 4.
    DATA runtime_in_min  TYPE i.
    DATA rating_1        TYPE i.
    DATA rating_2        TYPE i.
    DATA rating_3        TYPE i.
    DATA rating_4        TYPE i.
    DATA rating_5        TYPE i.
    DATA average_rating  TYPE p LENGTH 3 DECIMALS 2.
    DATA rating_text     TYPE string.

    " Movie Information
    title = 'Fight Club'.
    genre = 'Thriller'.
    publishing_year = '1999'.
    runtime_in_min = 139.

    " Ratings
    rating_1 = 10.
    rating_2 = 9.
    rating_3 = 10.
    rating_4 = 10.
    rating_5 = 9.
    average_rating = ( rating_1 + rating_2 + rating_3 + rating_4 + rating_5 ) / 5.

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
    out->write( |Rating 1: { rating_1 }| ).
    out->write( |Rating 2: { rating_2 }| ).
    out->write( |Rating 3: { rating_3 }| ).
    out->write( |Rating 4: { rating_4 }| ).
    out->write( |Rating 5: { rating_5 }| ).
    out->write( |\n| ).
    out->write( |Average Rating: { average_rating NUMBER = USER } ({ rating_text })| ).
  ENDMETHOD.
ENDCLASS.
