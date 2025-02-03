CLASS lhc_Task DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Task RESULT result.
    METHODS setcompletedtonot FOR DETERMINE ON modify
      IMPORTING keys FOR task~setcompletedtonot.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR task RESULT result.

    METHODS setcompleted FOR MODIFY
      IMPORTING keys FOR ACTION task~setcompleted RESULT result.
    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE task.

ENDCLASS.

CLASS lhc_Task IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.
    SELECT MAX( task_id ) FROM zraj_task_01 INTO @DATA(lv_max_task_id).
    lv_max_task_id = lv_max_task_id + 1.
    mapped-task = VALUE #( ( %cid = entities[ 1 ]-%cid TaskId = lv_max_task_id ) ).
  ENDMETHOD.

  METHOD setcompletedtonot.

    READ ENTITIES OF zraj_i_task_01 IN LOCAL MODE
         ENTITY Task
         FIELDS ( Completed )
         WITH CORRESPONDING #( keys )
         RESULT DATA(stud).
    LOOP AT stud INTO DATA(wa).

*      IF wa-Course EQ 'APS'. res = 5. ENDIF.
*      IF wa-Course EQ 'BIO'. res = 8. ENDIF.
*      IF wa-Course EQ 'CHM'. res = 7. ENDIF.
*      IF wa-Course EQ 'DAM'. res = 3. ENDIF.
*      IF wa-Course EQ 'ELC'. res = 4. ENDIF.
*      IF wa-Course EQ 'COM'. res = 2. ENDIF.


      MODIFY ENTITIES OF zraj_i_task_01 IN LOCAL MODE
      ENTITY Task
      UPDATE
      FIELDS (  Completed ) WITH VALUE #( ( %tky = wa-%tky Completed = 'N' ) ).
    ENDLOOP.



  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD setCompleted.
  ENDMETHOD.

ENDCLASS.
