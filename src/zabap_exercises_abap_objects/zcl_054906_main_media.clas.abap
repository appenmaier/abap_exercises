CLASS zcl_054906_main_media DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_main_media IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA streaming_platform TYPE REF TO zcl_054906_streaming_platform.
    DATA media_collection   TYPE REF TO zcl_054906_media_collection.
    DATA medium             TYPE REF TO zcl_054906_medium.

    " Streaming Platform
    streaming_platform = NEW #( 'Netflix' ).

    " Media Collection
    media_collection = NEW #( 'My Movie and Videogame Collection' ).

    " Movie 1
    TRY.
        medium = NEW zcl_054906_movie( title           = 'Fight Club'
                                   genre           = 'Thriller'
                                   publishing_year = '1999'
                                   runtime_in_min  = 139 ).
        medium->set_rating( 67 ).
        media_collection->add_medium( medium ).
        streaming_platform->add_stream( CAST #( medium ) ).
      CATCH zcx_054906_initial_parameter INTO DATA(e).
        out->write( e->get_text( ) ).
    ENDTRY.

    " Movie 2
    TRY.
        medium = NEW zcl_054906_video_game( title           = 'Metroid Dread'
                                        genre           = 'Science-Fiction'
                                        publishing_year = '2021'
                                        system          = 'NSW' ).
        medium->set_rating( 88 ).
        media_collection->add_medium( medium ).
      CATCH zcx_054906_initial_parameter INTO e.
        out->write( e->get_text( ) ).
    ENDTRY.

    " Movie 3
    TRY.
        medium = NEW zcl_054906_movie( title           = 'Der Pate 2'
                                   genre           = 'Drama'
                                   publishing_year = '1974'
                                   runtime_in_min  = 302 ).
        medium->set_rating( 90 ).
        media_collection->add_medium( medium ).
        streaming_platform->add_stream( CAST #( medium ) ).
      CATCH zcx_054906_initial_parameter INTO e.
        out->write( e->get_text( ) ).
    ENDTRY.

    " Genre Check
    LOOP AT media_collection->get_media( ) INTO medium.
      IF zcl_054906_medium_helper=>check_genre( medium->get_genre( ) ) = abap_false.
        out->write( |Invalid Genre { medium->get_genre( ) }| ).
      ENDIF.
    ENDLOOP.

    " Output
    out->write( media_collection->get_name( ) ).
    out->write( |\n| ).
    out->write( |Media: | ).
    LOOP AT media_collection->get_media( ) INTO medium.
      out->write( medium->to_string( ) ).
    ENDLOOP.
    out->write( |\n| ).
    out->write( |Best Rated Movie: { media_collection->get_best_rated_movie( )->to_string( ) }|  ).
    out->write( |------------------------------------------------------------| ).
    out->write( streaming_platform->get_name( ) ).
    out->write( |\n| ).
    out->write( |Streams: | ).
    LOOP AT streaming_platform->get_streams( ) INTO DATA(stream).
      out->write( stream->to_string( ) ).
    ENDLOOP.
    out->write( |\n| ).
    out->write( |Longest Stream: { streaming_platform->get_longest_stream( )->to_string( ) }|  ).
  ENDMETHOD.
ENDCLASS.
