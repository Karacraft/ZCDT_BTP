CLASS zcl_rap_eml_9991 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_eml_9991 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
**    Step:1  - READ
*    READ ENTITIES OF zi_rap_travel_9991
*        ENTITY Travel
*            FROM VALUE #( (  TravelUUID = '7EF1C704337BD83619000F8E9E14C86C' ) )
*        RESULT DATA(travels).
*
*    out->write( travels ).

**    Step:2  - READ with Fields
*    READ ENTITIES OF zi_rap_travel_9991
*        ENTITY Travel
*            fields ( AgencyID CustomerID )
*            WITH VALUE #( (  TravelUUID = '7EF1C704337BD83619000F8E9E14C86C' ) )
*        RESULT DATA(travels).
*
*    out->write( travels ).

**    Step:3  - READ All Fields
*    READ ENTITIES OF zi_rap_travel_9991
*        ENTITY Travel
*           ALL fields WITH VALUE #( (  TravelUUID = '7FF1C704337BD83619000F8E9E14C86C' ) )
*        RESULT DATA(travels).
*
*    out->write( travels ).

**    Step:4  - READ All Fields & Associations
*    READ ENTITIES OF zi_rap_travel_9991
*        ENTITY Travel BY \_Booking
*           ALL fields WITH VALUE #( (  TravelUUID = '7EF1C704337BD83619000F8E9E14C86C' ) )
*        RESULT DATA(bookings).
*
*    out->write( bookings ).

**    Step:5  - READ non UUID
*    READ ENTITIES OF zi_rap_travel_9991
*        ENTITY Travel
*           ALL FIELDS WITH VALUE #( (  TravelUUID = '11111704337BD83619000F8E9E14C86C' ) )
*        RESULT DATA(travels)
*        FAILED DATA(failed)
*        REPORTED DATA(reported).
*
*    out->write( travels ).
*    out->write( failed ).
*    out->write( reported ).

**    Step:6  - MODIFY Update
*    MODIFY ENTITIES OF zi_rap_travel_9991
*        ENTITY Travel
*        UPDATE
*            SET FIELDS WITH VALUE
*            #( ( TravelUUID = '7FF1C704337BD83619000F8E9E14C86C'
*                Description = 'I added this line'
*             ) )
*             FAILED DATA(failed)
*             REPORTED DATA(reported).
*
*    out->write( 'Update done' ).
*    COMMIT ENTITIES
*    RESPONSE OF ZI_RAP_TRAVEL_9991
*    FAILED DATA(failed_commit)
*    REPORTED DATA(reported_commit).
*
*    out->write( failed_commit ).

*    " step 7 - MODIFY Create
*    MODIFY ENTITIES OF ZI_RAP_Travel_9991
*      ENTITY travel
*        CREATE
*          SET FIELDS WITH VALUE
*            #( ( %cid        = 'MyContentID_1'
*                 AgencyID    = '70012'
*                 CustomerID  = '14'
*                 BeginDate   = cl_abap_context_info=>get_system_date( )
*                 EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*                 Description = 'I like RAP@openSAP' ) )
*
*     MAPPED DATA(mapped)
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*      RESPONSE OF ZI_RAP_Travel_9991
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Create done' ).

   " step 8 - MODIFY Delete
    MODIFY ENTITIES OF ZI_RAP_Travel_9991
      ENTITY travel
        DELETE FROM
          VALUE
            #( ( TravelUUID  = '9AF63D997C811EDFB4E6666E462B5FAF' ) )

     FAILED DATA(failed)
     REPORTED DATA(reported).

    COMMIT ENTITIES
      RESPONSE OF ZI_RAP_Travel_9991
      FAILED     DATA(failed_commit)
      REPORTED   DATA(reported_commit).

    out->write( 'Delete done' ).

  ENDMETHOD.

ENDCLASS.
