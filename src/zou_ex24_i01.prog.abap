*&---------------------------------------------------------------------*
*&  Include           ZOU_EX24_I01
*&---------------------------------------------------------------------*

MODULE user_command_0100 INPUT.
  save_ok = ok_code.
  CLEAR ok_code.

  CASE save_ok.
    WHEN 'EXIT'.
      LEAVE PROGRAM.
    WHEN 'LOAD'.
      PERFORM load_data.
    WHEN 'PICK'.
      PERFORM cust_details.

  ENDCASE.
ENDMODULE.

MODULE user_command_0200 INPUT.
  save_ok = ok_code.
  CLEAR ok_code.

  CASE save_ok.

    WHEN 'EXIT'.
      LEAVE TO SCREEN 100.
    WHEN 'FD03'.
      SET PARAMETER ID 'KUN' FIELD gs_cust-kunnr.
      CALL TRANSACTION 'FD03' AND SKIP FIRST SCREEN.
  ENDCASE.

ENDMODULE.

FORM load_data.

  IF gv_kunnr IS INITIAL AND gv_name1 IS INITIAL.
    MESSAGE 'Customer number or Customer name are required' TYPE 'E'.
  ENDIF.

  CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
  EXPORTING
    input  = gv_kunnr
  IMPORTING
    output = gv_kunnr.

  DATA(lv_name) = |%{ to_upper( gv_name1 ) }%|.

  CLEAR gt_cust.
  IF gv_kunnr IS NOT INITIAL AND gv_name1 IS NOT INITIAL.

    SELECT kunnr, name1, ort01, land1
       INTO CORRESPONDING FIELDS OF TABLE @gt_cust
       FROM kna1
       WHERE kunnr = @gv_kunnr OR name1 = @gv_name1.

  ELSEIF gv_name1 IS NOT INITIAL.

    SELECT kunnr, name1, ort01, land1
      INTO CORRESPONDING FIELDS OF TABLE @gt_cust
      FROM kna1
      WHERE name1 LIKE @lv_name.

  ELSE.
    SELECT kunnr, name1, ort01, land1
  INTO CORRESPONDING FIELDS OF TABLE @gt_cust
  FROM kna1
  WHERE kunnr = @gv_kunnr.


    IF sy-subrc <> 0.
      MESSAGE 'No records found' TYPE 'I'.
    ENDIF.
  ENDIF.

ENDFORM.

FORM cust_details.

  IF sy-subrc = 0.
    " Optionally set parameter for FD03 here, but we use it on 0200
    SET SCREEN 200.
    LEAVE SCREEN.
  ELSE.
    MESSAGE 'No row selected.' TYPE 'I'.
  ENDIF.
ENDFORM.
