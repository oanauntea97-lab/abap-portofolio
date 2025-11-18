*&---------------------------------------------------------------------*
*&  Include           ZOU_EX24_TOP
*&---------------------------------------------------------------------*

TABLES: kna1.

TYPES: BEGIN OF ty_cust,
         kunnr TYPE kna1-kunnr,
         name1 TYPE kna1-name1,
         ort01 TYPE kna1-ort01,
         land1 TYPE kna1-land1,
         stras TYPE kna1-stras,
         telf1 TYPE kna1-telf1,
       END OF ty_cust.

CONTROLS: tc_main    TYPE TABLEVIEW USING SCREEN 0100,
          tc_main200 TYPE TABLEVIEW USING SCREEN 200.

DATA: ok_code  TYPE sy-ucomm,
      save_ok  TYPE sy-ucomm,

      gv_kunnr TYPE kna1-kunnr,
      gv_name1 TYPE kna1-name1,

      gt_cust  TYPE STANDARD TABLE OF ty_cust,
      gs_cust  TYPE ty_cust.
