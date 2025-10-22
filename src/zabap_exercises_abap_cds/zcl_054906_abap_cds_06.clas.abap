CLASS zcl_054906_abap_cds_06 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_abap_cds_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT
      FROM Z054906_CustomerKPIs( p_city = 'Berlin' )
      FIELDS *
      ORDER BY TotalRevenue DESCENDING
      INTO TABLE @FINAL(customers).
    IF sy-subrc <> 0.
      out->write( |no data found| ).
      RETURN.
    ENDIF.

    out->write( customers ).
  ENDMETHOD.
ENDCLASS.
