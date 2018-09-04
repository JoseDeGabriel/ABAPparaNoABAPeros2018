*&---------------------------------------------------------------------*
*& Report  ZAPNA_X
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZAPNA_X.

* +--------------------------------------------------------------------+
* + Data                                                               +
* +--------------------------------------------------------------------+
DATA: vString1     TYPE STRING VALUE 'This is the String Number 1',
      vString2     TYPE STRING VALUE '... We are almost done :)',
      vStringC(50) TYPE C VALUE IS INITIAL,
      vStringR     TYPE STRING VALUE IS INITIAL,
      vCounter     TYPE C VALUE IS INITIAL,
      vLength      TYPE N LENGTH 2 VALUE IS INITIAL.
* +--------------------------------------------------------------------+

* +--------------------------------------------------------------------+
* + START-OF-SELECTION                                                 +
* +--------------------------------------------------------------------+
START-OF-SELECTION.

  PERFORM write_text USING 'This is a CONCATENATE example:'.
  CLEAR: vStringR.
  CONCATENATE vString1 'SEPARATOR' vString2
    INTO vStringR SEPARATED BY SPACE.
  PERFORM write_text USING vStringR.


*  PERFORM write_text USING 'This is a FIND example:'.
*  CLEAR: vStringR.
*  FIND ALL OCCURRENCES OF '.' IN vString2 MATCH COUNT vCounter.
*  CONCATENATE 'Pattern find'  vCounter 'times'
*    INTO vStringR SEPARATED BY SPACE.
*  PERFORM write_text USING vStringR.


*  PERFORM write_text USING 'This is a REPLACE example:'.
*  CLEAR: vStringR.
*  vStringR = vString1.
*  REPLACE ALL OCCURRENCES OF 's' IN vStringR WITH '#'.
*  PERFORM write_text USING vStringR.


*  PERFORM write_text USING 'This is SHIFT a example:'.
*  CLEAR: vStringC.
*  vStringC = vString2.
*  SHIFT vStringC RIGHT DELETING TRAILING SPACE.
*  PERFORM write_text USING vStringC.


*  PERFORM write_text USING 'This is a SPLIT example:'.
*  CLEAR: vStringC,
*         vStringR.
*  SPLIT vString2 AT 'are' INTO vStringC vStringR.
*  PERFORM write_text USING vStringC.
*  PERFORM write_text USING vStringR.


*  PERFORM write_text USING 'This is a CONDENSE example:'.
*  CLEAR: vStringC.
*  vStringC = vString1.
*  SHIFT vStringC RIGHT DELETING TRAILING SPACE.
*  PERFORM write_text USING vStringC.
*  CONDENSE vStringC NO-GAPS.
*  PERFORM write_text USING vStringC.


*  PERFORM write_text USING 'This is an OVERLAY example:'.
*  CLEAR: vStringR.
*  vStringR = vString1.
*  OVERLAY vStringR WITH vString2.
*  PERFORM write_text USING vStringR.


*  PERFORM write_text USING 'This is a TRANSLATE example:'.
*  CLEAR: vStringR.
*  vStringR = vString2.
*  TRANSLATE vStringR TO UPPER CASE.
*  PERFORM write_text USING vStringR.


*  PERFORM write_text USING 'This is a STRLEN example:'.
*  CLEAR: vLength,
*         vStringR.
*  vLength = STRLEN( vString2 ).
*  CONCATENATE 'String 2 is' vLength 'characters Length'
*    INTO vStringR SEPARATED BY SPACE.
*  PERFORM write_text USING vStringR.


*  PERFORM write_text USING 'This is an Offset example:'.
*  CLEAR: vStringR.
*  vStringR = vString1.
*  PERFORM write_text USING vStringR.
*  vStringR = vString1+4.
*  PERFORM write_text USING vStringR.
*  vStringR = vString1+4(7).
*  PERFORM write_text USING vStringR.
*  vStringR = vString1+7.
*  PERFORM write_text USING vStringR.

* +--------------------------------------------------------------------+

*&---------------------------------------------------------------------*
*&      Form  WRITE_TEXT
*&---------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
*      -->pText
*----------------------------------------------------------------------*
FORM WRITE_TEXT  USING    VALUE(pText).
  WRITE:/ pText.
ENDFORM.
