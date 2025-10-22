CLASS zcl_054906_calculator DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS calculate_percentage
      IMPORTING !percentage             TYPE z054906_decimal
                base_value              TYPE z054906_decimal
      RETURNING VALUE(percentage_value) TYPE z054906_decimal.
ENDCLASS.


CLASS zcl_054906_calculator IMPLEMENTATION.
  METHOD calculate_percentage.
    percentage_value = ( percentage / 100 ) * base_value.
  ENDMETHOD.
ENDCLASS.
