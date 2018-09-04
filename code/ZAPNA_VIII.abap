*&---------------------------------------------------------------------*
*& Report  ZAPNA_VIII
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZAPNA_VIII.

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
*  BREAK-POINT.
  IF SY-SUBRC IS INITIAL.
    PERFORM display_all.
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
