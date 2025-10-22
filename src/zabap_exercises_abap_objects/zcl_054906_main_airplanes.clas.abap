CLASS zcl_054906_main_airplanes DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA travel_agency TYPE REF TO zcl_054906_travel_agency.
    DATA carrier_a     TYPE REF TO zcl_054906_carrier.
    DATA carrier_b     TYPE REF TO zcl_054906_carrier.
    DATA airplane_1    TYPE REF TO zcl_054906_airplane.
    DATA airplane_2    TYPE REF TO zcl_054906_airplane.
    DATA airplane_3    TYPE REF TO zcl_054906_airplane.
    DATA airplane_4    TYPE REF TO zcl_054906_airplane.
    DATA airplane_5    TYPE REF TO zcl_054906_airplane.
    DATA airplane_6    TYPE REF TO zcl_054906_airplane.

    " -------------
    " Instantiation
    " -------------

    " Travel Agency
    travel_agency = NEW #( 'Travel 24' ).

    " Carrier A
    carrier_a = NEW #( 'Super Airlines' ).

    " Carrier B
    carrier_b = NEW #( ' Airlines' ).

    TRY.
        " Airplane 1
        airplane_1 = NEW zcl_054906_passenger_plane( name                 = 'D-A 873'
                                                     plane_type           = 'Boeing 747'
                                                     empty_weight_in_tons = 180
                                                     number_of_seats      = 400 ).

        " Airplane 2
        airplane_2 = NEW zcl_054906_passenger_plane( name                 = 'F 555'
                                                     plane_type           = 'Airbus A380'
                                                     empty_weight_in_tons = 277
                                                     number_of_seats      = 800 ).

        " Airplane 3
        airplane_3 = NEW zcl_054906_passenger_plane( name                 = 'HB-A 620'
                                                     plane_type           = 'Airbus A320'
                                                     empty_weight_in_tons = 41
                                                     number_of_seats      = 200 ).

        " Airplane 4
        airplane_4 = NEW zcl_054906_cargo_plane( name                 = 'D-A 900'
                                                 plane_type           = 'Boeing C-17'
                                                 empty_weight_in_tons = 126
                                                 cargo_in_tons        = 80 ).

        " Airplane 5
        airplane_5 = NEW zcl_054906_cargo_plane( name                 = 'HB-A 626'
                                                 plane_type           = 'Boeing C-17'
                                                 empty_weight_in_tons = 125
                                                 cargo_in_tons        = 77 ).

        " Airplane 6
        airplane_6 = NEW zcl_054906_cargo_plane( name                 = 'OE-U 4'
                                                 plane_type           = 'Boeing C-17'
                                                 empty_weight_in_tons = 125
                                                 cargo_in_tons        = 78 ).
      CATCH zcx_abap_initial_parameter INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    " ----------
    " Assignment
    " ----------

    carrier_a->add_airplane( airplane_1 ).
    carrier_a->add_airplane( airplane_2 ).
    carrier_a->add_airplane( airplane_3 ).

    carrier_b->add_airplane( airplane_4 ).
    carrier_b->add_airplane( airplane_5 ).
    carrier_b->add_airplane( airplane_6 ).

    travel_agency->add_partner( carrier_a ).
    travel_agency->add_partner( carrier_b ).

    " ------
    " Output
    " ------

    out->write( travel_agency ).
    out->write( carrier_b->get_biggest_cargo_plane( ) ).
  ENDMETHOD.
ENDCLASS.
