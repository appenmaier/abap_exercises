CLASS zcl_054906_abap_04 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_abap_04 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA operand1 TYPE z054906_decimal.
    DATA operand2 TYPE z054906_decimal.
    DATA operator TYPE c LENGTH 1.
    DATA result   TYPE z054906_decimal.

    operand1 = 5.
    operand2 = 3.
    operator = '^'.

    CASE operator.
      WHEN '+'.
        result = operand1 + operand2.
      WHEN '-'.
        result = operand1 - operand2.
      WHEN '*'.
        result = operand1 * operand2.
      WHEN '/'.
        result = operand1 / operand2.
      WHEN '%'.
        result = zcl_054906_calculator=>calculate_percentage( percentage = operand1
                                                              base_value = operand2 ).
      WHEN '^'.
        result = zcl_abap_calculator=>calculate_power( base     = operand1
                                                       exponent = operand2 ).
      WHEN '2'.
        result = zcl_abap_calculator=>calculate_power( base = operand1 ).
      WHEN OTHERS.
    ENDCASE.

    out->write( |{ operand1 NUMBER = USER } { operator } {  operand2 NUMBER = USER } = { result NUMBER = USER }| ).
  ENDMETHOD.
ENDCLASS.
