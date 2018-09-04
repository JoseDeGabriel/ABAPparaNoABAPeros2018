*&---------------------------------------------------------------------*
*& Report  ZAPNA_V
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZAPNA_V.

* +--------------------------------------------------------------------+
* + Data                                                               +
* +--------------------------------------------------------------------+
DATA: vInteger  TYPE I VALUE IS INITIAL,
      vFloat    TYPE P LENGTH 7 DECIMALS 4 VALUE IS INITIAL,
      vChar     TYPE C VALUE IS INITIAL,
      vChar3(3) TYPE C VALUE IS INITIAL,
      vString   TYPE STRING VALUE IS INITIAL,
      vDatum    TYPE DATUM VALUE IS INITIAL.
* +--------------------------------------------------------------------+

* +--------------------------------------------------------------------+
* + START-OF-SELECTION                                                 +
* +--------------------------------------------------------------------+
START-OF-SELECTION.
  PERFORM output.

*  PERFORM assign.
*
*  PERFORM output.
*  WRITE: / lvLocal.
* +--------------------------------------------------------------------+

*&---------------------------------------------------------------------*
*&      Form  OUTPUT
*&---------------------------------------------------------------------*
FORM OUTPUT .
  WRITE:/ TEXT-O01, vInteger,
        / TEXT-O02, vFloat,
        / TEXT-O03, vChar,
        / TEXT-O04, vChar3,
        / TEXT-O05, vString,
        / TEXT-O06, vDatum.
  WRITE: /.
ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  ASSIGN
*&---------------------------------------------------------------------*
FORM ASSIGN .
  DATA: lvLocal TYPE STRING VALUE 'I am a Local Variable.'.
  vInteger = 9.
  vFloat   = '3.1416'.
  vChar    = 'A'.
  vChar3   = 'MEX'.
  vString  = 'Hell Yeah!!'.
  vDatum   = SY-DATUM.
  WRITE: / lvLocal.
ENDFORM.
