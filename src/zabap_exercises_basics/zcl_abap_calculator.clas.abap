CLASS zcl_abap_calculator DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS calculate_power
      IMPORTING !base        TYPE zabap_decimal
                !exponent    TYPE zabap_decimal DEFAULT 2
      RETURNING VALUE(power) TYPE zabap_decimal.
ENDCLASS.


CLASS zcl_abap_calculator IMPLEMENTATION.
  METHOD calculate_power.
    power = ipow( base = base
                  exp  = exponent ).
  ENDMETHOD.
ENDCLASS.
