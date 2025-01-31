CLASS zcl_zd_console DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_zd_console IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA : lv_norange  TYPE REF TO cl_numberrange_objects,
           lv_interval TYPE REF TO cl_numberrange_intervals,
           lv_runtime  TYPE REF TO cl_numberrange_runtime.

    DATA : nr_attribute  TYPE cl_numberrange_objects=>nr_attribute,
           obj_text      TYPE cl_numberrange_objects=>nr_obj_text,
           lv_returncode TYPE cl_numberrange_objects=>nr_returncode,
           lv_errors     TYPE cl_numberrange_objects=>nr_errors,
           nr_interval   TYPE cl_numberrange_intervals=>nr_interval,
           st_interval   LIKE LINE OF nr_interval,
           nr_number     TYPE cl_numberrange_runtime=>nr_number,
           nr_interval1  TYPE cl_numberrange_runtime=>nr_interval,
           error         TYPE cl_numberrange_intervals=>nr_error,
           error_inf     TYPE cl_numberrange_intervals=>nr_error_inf,
           error_iv      TYPE cl_numberrange_intervals=>nr_error_iv,
           warning       TYPE cl_numberrange_intervals=>nr_warning.

    nr_attribute-buffer = 'X'.
    nr_attribute-object = 'ZNR_STUD_1'.  " object name
    nr_attribute-domlen = 'ZI_STUDENT'.    " domain to be used eg char 10
    nr_attribute-percentage = 10.
    nr_attribute-devclass = 'ZSTUDNR'. "Class where number range actually gets created
    obj_text-langu = 'E'.
    obj_text-object = 'ZNR_STUD_1'. "object name
    obj_text-txt = 'Testing Num Range For Students'. "long description
    obj_text-txtshort = 'Test'. "short description

    st_interval-subobject = ''.
    st_interval-nrrangenr = '01'. "number range interval
* st_INTERVAL-toyear
    st_interval-fromnumber  = '10000000'. " starting number
    st_interval-tonumber    = '99999999'. " ending number
    st_interval-procind     = 'I'.
    APPEND st_interval TO nr_interval.

    TRY.
        cl_numberrange_objects=>create( " method to create object
        EXPORTING
            attributes                = nr_attribute
            obj_text                  = obj_text
        IMPORTING
            errors = lv_errors
            returncode = lv_returncode )
           .
      CATCH cx_number_ranges INTO DATA(lx_number_range).
        out->write( lx_number_range->get_text( ) ).
    ENDTRY.


    TRY.

        CALL METHOD cl_numberrange_intervals=>create " method to create interval
          EXPORTING
            interval  = nr_interval
            object    = 'ZNR_STUD_1' "object name
            subobject = ''
          IMPORTING
            error     = error
            error_inf = error_inf
            error_iv  = error_iv.
      CATCH  cx_nr_object_not_found INTO DATA(lx_no_obj_found).
        out->write( lx_no_obj_found->get_text(  ) ).
      CATCH cx_number_ranges INTO DATA(cx_number_ranges).
        out->write( cx_number_ranges->get_text( ) ).
    ENDTRY.

*    DATA: nr_number     TYPE cl_numberrange_runtime=>nr_number.
*    DATA: lv_jo TYPE zi_student .
*    DATA: lv_jo_opt TYPE zi_student.
    TRY.
        CALL METHOD cl_numberrange_runtime=>number_get "// generating number
          EXPORTING
*           ignore_buffer     =
            nr_range_nr = '01'
            object      = 'ZNR_STUD_1'
            quantity    = 0000000001
*           subobject   =
*           toyear      =
          IMPORTING
            number      = nr_number.
*     returncode        =
*     returned_quantity =

      CATCH cx_nr_object_not_found INTO DATA(err1).
        out->write( err1->get_text( ) ).
      CATCH cx_number_ranges INTO DATA(err2).
        out->write( err2->get_text( ) ).
    ENDTRY.
*    lv_jo =  |{ nr_number ALPHA = OUT }|.
*    lv_jo_opt = |{ lv_jo ALPHA = IN }|. // assigning number to local variable number
    out->write( nr_number ).



  ENDMETHOD.
ENDCLASS.
