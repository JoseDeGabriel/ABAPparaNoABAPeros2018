*&---------------------------------------------------------------------*
*& Report  ZAPNA_VI
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZAPNA_VI.

* +--------------------------------------------------------------------+
* + Tables                                                             +
* +--------------------------------------------------------------------+
TABLES: SFLIGHT.
* +--------------------------------------------------------------------+

* +--------------------------------------------------------------------+
* + Types                                                              +
* +--------------------------------------------------------------------+
TYPES: BEGIN OF tySFC,
         CARRID     TYPE SFLIGHT-CARRID,
         CONNID     TYPE SFLIGHT-CONNID,
         PLANETYPE  TYPE SFLIGHT-PLANETYPE,
         PAYMENTSUM TYPE SFLIGHT-PAYMENTSUM,
       END OF tySFC.
* +--------------------------------------------------------------------+

* +--------------------------------------------------------------------+
* + Data                                                               +
* +--------------------------------------------------------------------+
DATA: tSFLIGHT  TYPE STANDARD TABLE OF SFLIGHT,
      waSFLIGHT TYPE SFLIGHT,
      tSFC      TYPE STANDARD TABLE OF tySFC,
      waSFC     TYPE tySFC.
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
  ELSE.
    MESSAGE i398(00) WITH 'Epic Fail!!'.
  ENDIF.

*  SELECT CARRID CONNID PLANETYPE PAYMENTSUM FROM SFLIGHT
*    INTO TABLE tSFC
*      WHERE CARRID EQ pCARRID
*        AND FLDATE IN sFLDATE.
*  IF SY-SUBRC IS INITIAL.
*    CLEAR: waSFC.
*    LOOP AT tSFC INTO waSFC.
*      WRITE:/5(10) waSFC-CARRID,
*              (10) waSFC-CONNID,
*              (10) waSFC-PLANETYPE,
*              (10) waSFC-PAYMENTSUM.
*      CLEAR: waSFC.
*    ENDLOOP.
*  ELSE.
*    MESSAGE i398(00) WITH 'Epic Fail!!'.
*  ENDIF.

*  WRITE SY-ULINE.
*  READ TABLE tSFLIGHT INTO waSFLIGHT WITH KEY FLDATE = '20190305'.
*  IF SY-SUBRC IS INITIAL.
*    waSFLIGHT-PAYMENTSUM = 2.
*    MODIFY tSFLIGHT FROM waSFLIGHT INDEX SY-TABIX.
*  ENDIF.
*  PERFORM display_all.
* +--------------------------------------------------------------------+

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
            (10) waSFLIGHT-PAYMENTSUM.
    CLEAR: waSFLIGHT.
  ENDLOOP.
ENDFORM.
