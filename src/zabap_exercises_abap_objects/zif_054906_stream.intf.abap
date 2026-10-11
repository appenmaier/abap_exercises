INTERFACE zif_054906_stream
  PUBLIC.

  METHODS get_runtime_in_min
    RETURNING VALUE(result) TYPE i.

  METHODS to_string
    RETURNING VALUE(result) TYPE string.
ENDINTERFACE.
