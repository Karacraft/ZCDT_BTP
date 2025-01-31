CLASS lhc_Student DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Student RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR student RESULT result.

    METHODS setadmitted FOR MODIFY
      IMPORTING keys FOR ACTION student~setadmitted RESULT result.
    METHODS validateage FOR VALIDATE ON SAVE
      IMPORTING keys FOR student~validateage.
    METHODS updatecourseduration FOR DETERMINE ON SAVE
      IMPORTING keys FOR student~updatecourseduration.
    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE student.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR student RESULT result.


    METHODS is_update_allowed
      RETURNING VALUE(update_allowed) TYPE abap_bool.

ENDCLASS.

CLASS lhc_Student IMPLEMENTATION.

  METHOD get_instance_authorizations.

    DATA: update_requested TYPE abap_bool,
          update_granted type abap_bool.

    READ ENTITIES OF zji_student IN LOCAL MODE
    ENTITY Student
    FIELDS ( Status )
    WITH CORRESPONDING #( keys )
    RESULT DATA(stud)
    FAILED failed.

    CHECK stud IS NOT INITIAL.
    update_requested = COND #(
        WHEN requested_authorizations-%update = if_abap_behv=>mk-on OR
            requested_authorizations-%action-Edit = if_abap_behv=>mk-on
            THEN abap_true ELSE abap_false ).

    loop at stud ASSIGNING field-SYMBOL(<lfs_stud>).
        if <lfs_stud>-Status = abap_false.
            if update_requested = abap_true.
                update_granted = is_update_allowed(  ).
                if update_granted = abap_false.
                    APPEND VALUE #(  %tky = <lfs_stud>-%tky ) to failed-student.
                    APPEND VALUE #( %tky = Keys[ 1 ]-%tky %msg = new_message_with_text(
                         severity = if_abap_behv_message=>severity-error
                         text = 'No Authorization to update status'
                     ) ) to reported-student.
                endif.
            endif.
        endif.
    ENDLOOP.

  ENDMETHOD.

  METHOD get_instance_features.
    READ ENTITIES OF zji_student IN LOCAL MODE
    ENTITY Student
    FIELDS ( Status )
    WITH CORRESPONDING #( keys )
    RESULT DATA(studentadmitted)
    FAILED failed.

    result =
    VALUE #(
    FOR stud IN studentadmitted
    LET statusVal = COND #( WHEN stud-Status = abap_true
                            THEN if_abap_behv=>fc-o-disabled
                            ELSE if_abap_behv=>fc-o-enabled )

                            IN ( %tky = stud-%tky %action-setAdmitted = statusVal )
                            ).
  ENDMETHOD.

  METHOD setAdmitted.

    MODIFY ENTITIES OF ZJI_student IN LOCAL MODE
    ENTITY Student
    UPDATE
    FIELDS (  Status )
    WITH VALUE #( FOR key IN keys ( %tky = key-%tky Status = abap_true ) )

    FAILED failed
    REPORTED reported.

    "Get the response of updated record
    READ ENTITIES OF zji_student IN LOCAL MODE
    ENTITY Student
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(studentdata).
    result = VALUE #( FOR studentrec IN studentdata (
        %tky = studentrec-%tky %param = studentrec
     ) ).

  ENDMETHOD.

  METHOD validateAge.
    READ ENTITIES OF zji_student IN LOCAL MODE
      ENTITY Student
      FIELDS ( Age )
      WITH CORRESPONDING #( keys )
      RESULT DATA(stud).

    LOOP AT stud INTO DATA(wa).
      IF wa-Age < 21.
        APPEND VALUE #( %tky = wa-%tky ) TO failed-student.
        APPEND VALUE #( %tky =   keys[ 1 ]-%tky
                        %msg = new_message_with_text(
                        severity = if_abap_behv_message=>severity-error
                        text = |Age cannot be less then 21|
                         ) )
                         TO reported-student.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD updateCourseDuration.

    DATA: res TYPE zji_student-CourseDuration.

    READ ENTITIES OF zji_student IN LOCAL MODE
     ENTITY Student
     FIELDS ( Course )
     WITH CORRESPONDING #( keys )
     RESULT DATA(stud).
    LOOP AT stud INTO DATA(wa).

      IF wa-Course EQ 'APS'. res = 5. ENDIF.
      IF wa-Course EQ 'BIO'. res = 8. ENDIF.
      IF wa-Course EQ 'CHM'. res = 7. ENDIF.
      IF wa-Course EQ 'DAM'. res = 3. ENDIF.
      IF wa-Course EQ 'ELC'. res = 4. ENDIF.
      IF wa-Course EQ 'COM'. res = 2. ENDIF.


      MODIFY ENTITIES OF ZJI_student IN LOCAL MODE
      ENTITY Student
      UPDATE
      FIELDS (  CourseDuration ) WITH VALUE #( ( %tky = wa-%tky CourseDuration = res ) ).
    ENDLOOP.

  ENDMETHOD.

  METHOD precheck_update.
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lfs_entity>).
*    01 = vale update/changed , 00 = nothing changed
      CHECK <lfs_entity>-%control-Course EQ '01' OR  <lfs_entity>-%control-CourseDuration EQ '01'.
      READ ENTITIES OF zji_student IN LOCAL MODE
      ENTITY Student
      FIELDS ( Course CourseDuration )
      WITH VALUE #( ( %key = <lfs_entity>-%key ) )
      RESULT DATA(stud).

      IF sy-subrc IS INITIAL.
        READ TABLE stud ASSIGNING FIELD-SYMBOL(<lfs_db>) INDEX 1.
        IF sy-subrc IS INITIAL.
*            Capture front end values & act accordingly
          <lfs_db>-Course =  COND #( WHEN <lfs_entity>-%control-Course EQ '01' THEN <lfs_entity>-Course ELSE <lfs_db>-Course ).
          <lfs_db>-CourseDuration =  COND #( WHEN <lfs_entity>-%control-CourseDuration EQ '01' THEN <lfs_entity>-CourseDuration ELSE <lfs_db>-CourseDuration ).

*        Add validations if required

        ENDIF.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

  METHOD get_global_authorizations.
*   this method will be activated as soon as app is loaded
    IF requested_authorizations-%update = if_abap_behv=>mk-on OR
        requested_authorizations-%action-Edit = if_abap_behv=>mk-on.

      IF me->is_update_allowed(  ) = abap_true.
        result-%update = if_abap_behv=>auth-allowed.
        result-%action-Edit = if_abap_behv=>auth-allowed.
      ELSE.
        result-%update = if_abap_behv=>auth-unauthorized.
        result-%action-Edit = if_abap_behv=>auth-unauthorized.
      ENDIF.

    ENDIF.
  ENDMETHOD.

  METHOD is_update_allowed.
*    simulation, auth object not created
    update_allowed = abap_false.
  ENDMETHOD.

ENDCLASS.
