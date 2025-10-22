CLASS zcl_054906_travel_agency DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA name     TYPE string           READ-ONLY.
    DATA partners TYPE z054906_partners READ-ONLY.

    METHODS constructor
      IMPORTING i_name TYPE string.

    METHODS add_partner
      IMPORTING partner TYPE REF TO zif_054906_partner.
ENDCLASS.


CLASS zcl_054906_travel_agency IMPLEMENTATION.
  METHOD constructor.
    name = i_name.
  ENDMETHOD.

  METHOD add_partner.
    APPEND partner TO partners.
  ENDMETHOD.
ENDCLASS.
