CLASS lhc_Student DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS createStudentID FOR DETERMINE ON SAVE
      IMPORTING keys FOR Student~createStudentID.

ENDCLASS.

CLASS lhc_Student IMPLEMENTATION.

  METHOD createStudentID.
    DATA: lv_number TYPE cl_numberrange_runtime=>nr_number.

    TRY.

        cl_numberrange_runtime=>number_get(
          EXPORTING
*        ignore_buffer     =
            nr_range_nr       = '01'
            object            = 'ZI_STUNR_1'
*        quantity          =
*        subobject         =
*        toyear            =
          IMPORTING
            number            = lv_number
*        returncode        =
*        returned_quantity =
        ).
      CATCH cx_nr_object_not_found.
      CATCH cx_number_ranges.
    ENDTRY.


  ENDMETHOD.

ENDCLASS.
