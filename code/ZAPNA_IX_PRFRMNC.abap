*&---------------------------------------------------------------------*
*& Report  ZAPNA_IX_PRFRMNC
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZAPNA_IX_PRFRMNC.

DATA: i_bseg  TYPE STANDARD TABLE OF bseg,
      wa_bseg LIKE LINE OF i_bseg.

DATA: lv_flag     TYPE flag,
      lv_sta_time TYPE timestampl,
      lv_end_time TYPE timestampl,
      lv_diff_w   TYPE p DECIMALS 5,
      lv_diff_f   LIKE lv_diff_w,
      lv_save     LIKE lv_diff_w.

FIELD-SYMBOLS: <fs_bseg> LIKE LINE OF i_bseg.

* data selection = 10,000 records
SELECT * FROM bseg INTO TABLE i_bseg UP TO 10000 ROWS.


* Begin - Processing with Work area
GET TIME STAMP FIELD lv_sta_time.
LOOP AT i_bseg INTO wa_bseg.
  IF lv_flag = 'X'.
    wa_bseg-sgtxt = 'TEST'.
    MODIFY i_bseg FROM wa_bseg.
  ENDIF.
  CLEAR wa_bseg.
  IF lv_flag IS INITIAL.
    lv_flag = 'X'.
  ENDIF.
ENDLOOP.
GET TIME STAMP FIELD lv_end_time.
lv_diff_w = lv_end_time - lv_sta_time.
WRITE: /(15) 'Work area', lv_diff_w.
* End   - Processing with Work Area


CLEAR: lv_flag,
       lv_sta_time,
       lv_end_time.


* Begin - Processing with Field-Symbols
GET TIME STAMP FIELD lv_sta_time.
LOOP AT i_bseg ASSIGNING <fs_bseg>.
  IF lv_flag = 'X'.
    <fs_bseg>-sgtxt = 'TEST'.
  ENDIF.
  IF lv_flag IS INITIAL.
    lv_flag = 'X'.
  ENDIF.
ENDLOOP.
GET TIME STAMP FIELD lv_end_time.
lv_diff_f = lv_end_time - lv_sta_time.
WRITE: /(15) 'Field-Symbol', lv_diff_f.
* End   - Processing with Work Area


* Net time saving
lv_save = lv_diff_w - lv_diff_f.
WRITE: /(15) 'Total Save', lv_save.
WRITE: / 'Done'.
