CLASS zcl_054906_abap_03 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_abap_03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TYPES t_decimal TYPE p LENGTH 15 DECIMALS 2.

    DATA operand1 TYPE t_decimal.
    DATA operand2 TYPE t_decimal.
    DATA operator TYPE c LENGTH 1.
    DATA result   TYPE t_decimal.

    operand1 = 5.
    operand2 = 3.
    operator = '/'.

    CASE operator.
      WHEN '+'.
        result = operand1 + operand2.
      WHEN '-'.
        result = operand1 - operand2.
      WHEN '*'.
        result = operand1 * operand2.
      WHEN '/'.
        result = operand1 / operand2.
      WHEN OTHERS.
    ENDCASE.

    out->write( |{ operand1 NUMBER = USER } { operator } {  operand2 NUMBER = USER } = { result NUMBER = USER }| ).
  ENDMETHOD.
ENDCLASS.
