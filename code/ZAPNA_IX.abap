*&---------------------------------------------------------------------*
*& Report  ZAPNA_IX
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZAPNA_IX.

* +--------------------------------------------------------------------+
* + Tables                                                             +
* +--------------------------------------------------------------------+
TABLES: SFLIGHT.
* +--------------------------------------------------------------------+

* +--------------------------------------------------------------------+
* + Data                                                               +
* +--------------------------------------------------------------------+
DATA: tSFLIGHT  TYPE STANDARD TABLE OF SFLIGHT,
      waSFLIGHT TYPE SFLIGHT.

FIELD-SYMBOLS <fsSFLIGHT> TYPE SFLIGHT.
* +--------------------------------------------------------------------+

* +--------------------------------------------------------------------+
* + Selection Screen                                                   +
* +--------------------------------------------------------------------+
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-T01.
PARAMETERS:     pCARRID TYPE SFLIGHT-CARRID OBLIGATORY.
SELECT-OPTIONS: sFLDATE FOR SFLIGHT-FLDATE.
SELECTION-SCREEN END   OF BLOCK b1.
* +--------------------------------------------------------------------+

* +--------------------------------------------------------------------+
* + START-OF-SELECTION                                                 +
* +--------------------------------------------------------------------+
START-OF-SELECTION.

  SELECT * FROM SFLIGHT INTO TABLE tSFLIGHT
    WHERE CARRID EQ pCARRID
      AND FLDATE IN sFLDATE.
  IF SY-SUBRC IS INITIAL.
    PERFORM display_all.

*    PERFORM change_with_wa.

*    PERFORM change_with_fs.

*    <fsSFLIGHT>-seatsocc_f = 44.

  ELSE.
    MESSAGE i398(00) WITH 'Epic Fail!!'.
  ENDIF.

*&---------------------------------------------------------------------*
*&      Form  DISPLAY_ALL
*&---------------------------------------------------------------------*
FORM DISPLAY_ALL .
  CLEAR: waSFLIGHT.
  LOOP AT tSFLIGHT INTO waSFLIGHT.
    WRITE:/5(10) waSFLIGHT-CARRID,
            (10) waSFLIGHT-CONNID,
            (10) waSFLIGHT-FLDATE,
            (10) waSFLIGHT-CURRENCY,
            (10) waSFLIGHT-PLANETYPE,
            (10) waSFLIGHT-PAYMENTSUM,
            (10) waSFLIGHT-SEATSOCC_F.
    CLEAR: waSFLIGHT.
  ENDLOOP.
  WRITE SY-ULINE.
ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  CHANGE_WITH_WA
*&---------------------------------------------------------------------*
FORM CHANGE_WITH_WA .
  LOOP AT tSFLIGHT INTO waSFLIGHT.
    waSFLIGHT-SEATSOCC_F = 21.
    MODIFY tSFLIGHT FROM waSFLIGHT.
  ENDLOOP.
  PERFORM display_all.
ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  CHANGE_WITH_FS
*&---------------------------------------------------------------------*
FORM CHANGE_WITH_FS .
  LOOP AT tSFLIGHT ASSIGNING <fsSFLIGHT>.
    IF <fsSFLIGHT> IS ASSIGNED.
      <fsSFLIGHT>-seatsocc_f = 44.
    ENDIF.
  ENDLOOP.
  UNASSIGN <fsSFLIGHT>.
  PERFORM display_all.
ENDFORM.
