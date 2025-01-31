CLASS zcl_snro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_snro IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
** Set Interval
**********************************************************************
    TRY.
        cl_numberrange_intervals=>create(
          EXPORTING
            interval  = VALUE #( ( nrrangenr = '01' fromnumber = '1000000001' tonumber = '9999999999' procind = 'I' ) )
            object    = 'ZI_STUNR_1'
          IMPORTING
            error     = DATA(ld_error)
            error_inf = DATA(ls_error)
            error_iv  = DATA(lt_error_iv)
            warning   = DATA(ld_warning) ).
      CATCH cx_nr_object_not_found INTO DATA(err1).
        out->write( err1->get_text( ) ).
      CATCH cx_number_ranges INTO DATA(err2).
        out->write( err2->get_text( ) ).
    ENDTRY.
**********************************************************************
** Update Interval
**********************************************************************
*    TRY.
*        cl_numberrange_intervals=>update(
*          EXPORTING
*            interval = VALUE #( ( nrrangenr = '01' fromnumber = '1000000001' tonumber = '9999999999' procind = 'U' ) )
*            object   = 'ZI_STUD_NR'
**           subobject =
**           option   =
**      IMPORTING
**           error    =
**           error_inf =
**           error_iv =
**           warning  =
*        ).
*      CATCH cx_root INTO DATA(cx).
*        out->write( cx->get_text( ) ).
*    ENDTRY.
**********************************************************************
**  GET NUMBER
**********************************************************************
    TRY.
        CALL METHOD cl_numberrange_runtime=>number_get "// generating number
          EXPORTING
*           ignore_buffer     =
            nr_range_nr = '01'
            object      = 'ZI_STUNR_1'
            quantity    = 0000000001
*           subobject   =
*           toyear      =
          IMPORTING
            number      = DATA(nr_number).
*     returncode        =
*     returned_quantity =
        out->write( nr_number ).
      CATCH cx_nr_object_not_found INTO DATA(err3).
        out->write( err3->get_text( ) ).
      CATCH cx_number_ranges INTO DATA(err4).
        out->write( err4->get_text( ) ).
    ENDTRY.


  ENDMETHOD.
ENDCLASS.
