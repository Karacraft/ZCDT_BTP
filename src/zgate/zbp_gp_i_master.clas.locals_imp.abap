CLASS lsc_zgp_i_master DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

ENDCLASS.

CLASS lsc_zgp_i_master IMPLEMENTATION.

  METHOD adjust_numbers.
*********************************************************************
*  GET NUMBER FROM NUMBER RANGE
*********************************************************************
    TRY.
        CALL METHOD cl_numberrange_runtime=>number_get "// generating number
          EXPORTING
            nr_range_nr = '01'
            object      = 'ZGATE_1'
            quantity    = 0000000001
          IMPORTING
            number      = DATA(nr_number)
            returncode  = DATA(retcod).
        IF retcod EQ 0.
*
          LOOP AT mapped-master REFERENCE INTO DATA(map).
            map->%key = nr_number.
          ENDLOOP.

        ENDIF.
      CATCH cx_nr_object_not_found INTO DATA(err3).
      CATCH cx_number_ranges INTO DATA(err4).
    ENDTRY.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_Master DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Master RESULT result.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR master RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR master RESULT result.
    METHODS get_global_features FOR GLOBAL FEATURES
      IMPORTING REQUEST requested_features FOR master RESULT result.

ENDCLASS.

CLASS lhc_Master IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
*    This code works. When you create and save data, it raises erro ( create: global  )
    result-%create = if_abap_behv=>auth-allowed.
  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_global_features.
  ENDMETHOD.

ENDCLASS.
