CLASS lhc_Task DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Task RESULT result.
    METHODS setcompletedtonot FOR DETERMINE ON SAVE
      IMPORTING keys FOR task~setcompletedtonot.
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
       RESULT DATA(tsk).
    LOOP AT tsk INTO DATA(wa).

      MODIFY ENTITIES OF zraj_i_task_01 IN LOCAL MODE
      ENTITY Task
      UPDATE
      FIELDS (  Completed ) WITH VALUE #( ( %tky = wa-%tky Completed = 'N' ) ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
