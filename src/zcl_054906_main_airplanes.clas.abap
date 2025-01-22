CLASS zcl_054906_main_airplanes DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA travel_agency TYPE REF TO zcl_054906_travel_agency.
    DATA carrier       TYPE REF TO zcl_054906_carrier.
    DATA airplane      TYPE REF TO zcl_054906_airplane.

    travel_agency = NEW #( 'Travel 24' ).
    carrier = NEW #( 'European Airlines' ).

    TRY.
        airplane = NEW zcl_054906_passenger_plane( name            = 'D-A 873'
                                                   plane_type      = 'Boeing 747'
                                                   number_of_seats = 400 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.
    TRY.
        airplane = NEW zcl_054906_passenger_plane( name            = 'F 555'
                                                   plane_type      = 'Airbus A380'
                                                   number_of_seats = 800 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO x.
        out->write( x->get_text( ) ).
    ENDTRY.
    TRY.
        airplane = NEW zcl_054906_cargo_plane( name          = 'HB-A 620'
                                               plane_type    = 'Boeing C-17'
                                               cargo_in_tons = 77 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO x.
        out->write( x->get_text( ) ).
    ENDTRY.
    TRY.
        airplane = NEW zcl_054906_passenger_plane( name            = 'D-A 900'
                                                   plane_type      = 'Airbus A320'
                                                   number_of_seats = 200 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO x.
        out->write( x->get_text( ) ).
    ENDTRY.
    TRY.
        airplane = NEW zcl_054906_cargo_plane( name          = ''
                                               plane_type    = 'Boeing C-17'
                                               cargo_in_tons = 77 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO x.
        out->write( x->get_text( ) ).
    ENDTRY.
    TRY.
        airplane = NEW zcl_054906_cargo_plane( name          = 'OE-U 4'
                                               plane_type    = ''
                                               cargo_in_tons = 77 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO x.
        out->write( x->get_text( ) ).
    ENDTRY.

    travel_agency->add_partner( carrier ).

    out->write( travel_agency->to_string( ) ).
  ENDMETHOD.
ENDCLASS.
