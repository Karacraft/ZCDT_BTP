CLASS zcl_zbranch_data_generation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_zbranch_data_generation IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA : itab TYPE TABLE OF zbranch WITH EMPTY KEY.
*    Delete existing data.
    DELETE FROM zbranch.
*    Insert Data
    INSERT VALUE #( school_id = '10001' branch_id = '10011' area = 'Gulshan'  Principal = 'Ali Jibran' strength = 239  created_at = sy-datum  created_on = sy-timlo created_by = sy-uname  ) INTO itab INDEX 1.
    INSERT VALUE #( school_id = '10001' branch_id = '10012' area = 'Jauhar'  Principal = 'Asma ALi' strength = 185  created_at = sy-datum  created_on = sy-timlo created_by = sy-uname  ) INTO itab INDEX 2.
    INSERT VALUE #( school_id = '10001' branch_id = '10013' area = 'Nazimabad'  Principal = 'Fauiq Ahmed' strength = 215  created_at = sy-datum  created_on = sy-timlo created_by = sy-uname  ) INTO itab INDEX 3.
    INSERT VALUE #( school_id = '10002' branch_id = '10014' area = 'Gulshan'  Principal = 'Waheed Khan' strength = 125  created_at = sy-datum  created_on = sy-timlo created_by = sy-uname  ) INTO itab INDEX 4.
    INSERT VALUE #( school_id = '10002' branch_id = '10015' area = 'Landhi'  Principal = 'Basit Ahmed' strength = 98  created_at = sy-datum  created_on = sy-timlo created_by = sy-uname  ) INTO itab INDEX 5.
    INSERT VALUE #( school_id = '10003' branch_id = '10016' area = 'Scheme 33'  Principal = 'Farooq Shah' strength = 219  created_at = sy-datum  created_on = sy-timlo created_by = sy-uname  ) INTO itab INDEX 6.
    INSERT VALUE #( school_id = '10004' branch_id = '10017' area = 'Scheme 33'  Principal = 'Madiha Shah' strength = 119  created_at = sy-datum  created_on = sy-timlo created_by = sy-uname  ) INTO itab INDEX 7.
    INSERT VALUE #( school_id = '10005' branch_id = '10018' area = 'Korangi'  Principal = 'Mobeen Ali' strength = 187  created_at = sy-datum  created_on = sy-timlo created_by = sy-uname  ) INTO itab INDEX 8.
    INSERT VALUE #( school_id = '10006' branch_id = '10019' area = 'Scheme 33'  Principal = 'Qasim Ameen' strength = 163  created_at = sy-datum  created_on = sy-timlo created_by = sy-uname  ) INTO itab INDEX 9.


    INSERT zbranch FROM TABLE @itab.

    COMMIT WORK.
    out->write( 'School Branch Data inserted into table ZSCHOOL' ).

  ENDMETHOD.
ENDCLASS.
