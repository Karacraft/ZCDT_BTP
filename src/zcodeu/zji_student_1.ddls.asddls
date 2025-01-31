@EndUserText.label: 'Interface Root ZJI_STUDENT_1'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZJI_STUDENT_1
  as select from zjtb_student_1 as Student
  composition [0..*] of ZJI_ACADEMIC_1 as _Academic
  

  association to ZJI_GENDER            as _Gender on $projection.Gender = _Gender.Value
{
      @EndUserText.label: 'Student ID'
  key student_id            as StudentId,
      @EndUserText.label: 'First Name'
      first_name            as FirstName,
      @EndUserText.label: 'Last Name'
      last_name             as LastName,
      @EndUserText.label: 'Age'
      age                   as Age,
      @EndUserText.label: 'Gender'
      gender                as Gender,
      @EndUserText.label: 'Date of Birth'
      dob as Dob,
      @EndUserText.label: 'Multi Course'
      multi_course_allowed  as MultiCourseAllowed,
      @EndUserText.label: 'Creator'
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @EndUserText.label: 'Dated'
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @EndUserText.label: 'Last Change By'
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @EndUserText.label: 'Last Change At'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @EndUserText.label: 'Local Last Change At'
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      /* Association */
      _Academic,

      _Gender,
      _Gender.Description   as GenderDesc
}
