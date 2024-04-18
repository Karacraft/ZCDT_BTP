CLASS zcl_zschool_data_generation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_zschool_data_generation IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA : itab TYPE TABLE OF zschool WITH EMPTY KEY.
*    Delete existing data.
    DELETE FROM zschool.
*    Insert Data
    INSERT VALUE #( school_id = '10001' name = 'Fair Child' medium = 'URDU'  type = 'BOYS ONLY' created_at = sy-datum  created_on = sy-timlo created_by = sy-uname  ) INTO itab INDEX 1.
    INSERT VALUE #( school_id = '10002' name = 'DEBS' medium = 'ENGLISH'  type = 'CO-ED' created_at = sy-datum  created_on = sy-timlo created_by = sy-uname  ) INTO itab INDEX 2.
    INSERT VALUE #( school_id = '10003' name = 'Pioneer Systems' medium = 'ENGLISH'  type = 'GIRLS ONLY' created_at = sy-datum  created_on = sy-timlo created_by = sy-uname  ) INTO itab INDEX 3.
    INSERT VALUE #( school_id = '10004' name = 'Pak Students' medium = 'URDU'  type = 'BOYS ONLY' created_at = sy-datum  created_on = sy-timlo created_by = sy-uname  ) INTO itab INDEX 4.
    INSERT VALUE #( school_id = '10005' name = 'Oxford High' medium = 'ENGLISH'  type = 'CO-ED' created_at = sy-datum  created_on = sy-timlo created_by = sy-uname  ) INTO itab INDEX 5.
    INSERT VALUE #( school_id = '10006' name = 'Beaconhouse' medium = 'ENGLISH'  type = 'CO-ED' created_at = sy-datum  created_on = sy-timlo created_by = sy-uname  ) INTO itab INDEX 6.

    INSERT zschool FROM TABLE @itab.

    COMMIT WORK.
    out->write( 'School Data inserted into table ZSCHOOL' ).
  ENDMETHOD.
ENDCLASS.
