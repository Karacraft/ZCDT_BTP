@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'School Base'
define root view entity Z_I_ZSCHOOL
  as select from zschool as School
  // composition is special child
  composition [0..*] of Z_I_ZBRANCH as _Branch
{
  key School.school_id  as SchoolId,
      School.name       as Name,
      School.medium     as Medium,
      School.type       as Type,
      School.created_at as CreatedAt,
      School.created_on as CreatedOn,
      School.created_by as CreatedBy,
      _Branch // Make association public
}
