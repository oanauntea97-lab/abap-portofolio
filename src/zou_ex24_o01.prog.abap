*&---------------------------------------------------------------------*
*&  Include           ZOU_EX24_O01
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'STATUS_0100'.
  SET TITLEBAR 'TIT_0100'.

  IF gt_cust IS INITIAL.
    tc_main-lines = 1. "visible lines if there is no data
  ELSE.
    DESCRIBE TABLE gt_cust LINES tc_main-lines.
  ENDIF.
ENDMODULE.

MODULE display_0100 OUTPUT.

ENDMODULE.

MODULE status_0200 OUTPUT.
  SET PF-STATUS 'STATUS_0200'.
  SET TITLEBAR 'TIT_0200'.

  IF gt_cust IS INITIAL.
    tc_main200-lines = 1. "visible lines if there is no data
  ELSE.
    DESCRIBE TABLE gt_cust LINES tc_main200-lines.
  ENDIF.
ENDMODULE.


MODULE display_0200 OUTPUT.

ENDMODULE.
