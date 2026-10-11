CLASS zcx_054906_initial_parameter DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_t100_dyn_msg.
    INTERFACES if_t100_message.

    CONSTANTS:
      BEGIN OF co_initial_parameter,
        msgid TYPE symsgid      VALUE 'Z054906_MEDIUM',
        msgno TYPE symsgno      VALUE '001',
        attr1 TYPE scx_attrname VALUE 'PARAMETER',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF co_initial_parameter.

    DATA parameter TYPE string.

    METHODS constructor
      IMPORTING textid     LIKE if_t100_message=>t100key OPTIONAL
                !previous  LIKE previous                 OPTIONAL
                !parameter TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcx_054906_initial_parameter IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    " TODO: parameter TEXTID is never used (ABAP cleaner)

    super->constructor( previous = previous ).
    me->parameter = parameter.
    if_t100_message~t100key = co_initial_parameter.
  ENDMETHOD.
ENDCLASS.
