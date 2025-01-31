@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Interface for ZJTB_STUDENT_2'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZJI_STUDENT_2
  as select from zjtb_student_2 as Student
  composition[0..*] of ZJI_ATTACHMENT as _Attachment
{
@EndUserText.label: 'Student ID'
  key student_id            as StudentId,
  @EndUserText.label: 'First Name'
      first_name            as FirstName,
      @EndUserText.label: 'Last Name'
      last_name             as LastName,
      @EndUserText.label: 'Created By'
      created_by            as CreatedBy,
      @EndUserText.label: 'Created At'
      created_at            as CreatedAt,
      @EndUserText.label: 'Last Changed By'
      last_changed_by       as LastChangedBy,
      @EndUserText.label: 'Last Changed At'
      last_changed_at       as LastChangedAt,
      @EndUserText.label: 'Local Last Changed At'
      local_last_changed_at as LocalLastChangedAt,
      _Attachment // Make association public
}
