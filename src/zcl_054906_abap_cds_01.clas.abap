CLASS zcl_054906_abap_cds_01 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_abap_cds_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT FROM /DMO/C_Booking_Approver_M
      FIELDS *
      WHERE CarrierID = 'LH' AND ConnectionID = '0400'
      INTO TABLE @FINAL(bookings).
    IF sy-subrc <> 0.
      out->write( |no data found| ).
      RETURN.
    ENDIF.

    out->write( bookings ).
  ENDMETHOD.
ENDCLASS.
