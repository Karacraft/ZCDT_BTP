@EndUserText.label: 'Interface Root ZJI_STUDENT'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZJI_STUDENT
  as select from zjtb_student as Student
  composition [0..*] of ZJI_ACADEMIC as _Academic

  association to ZJI_GENDER          as _Gender on $projection.Gender = _Gender.Value
  association to ZJI_COURSE          as _Course on $projection.Course = _Course.Value
{
      @EndUserText.label: 'Student'
  key student_id            as StudentId,
      @EndUserText.label: 'First Name'
      first_name            as FirstName,
      @EndUserText.label: 'Last Name'
      last_name             as LastName,
      @EndUserText.label: 'Age'
      age                   as Age,
      @EndUserText.label: 'Course'
      course                as Course,

      @EndUserText.label: 'Course Duration'
      course_duration       as CourseDuration,
      @EndUserText.label: 'Status'
      status                as Status,
      @EndUserText.label: 'Gender'
      gender                as Gender,
      @EndUserText.label: 'D.O.B'
      dob                   as Dob,
      @EndUserText.label: 'Creator'
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @EndUserText.label: 'Dated'
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @EndUserText.label: 'Last.Chg.By'
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @EndUserText.label: 'Last.Dated'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @EndUserText.label: 'Last.Local.Dated'
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      /* Association */
      _Academic,
      _Gender,
      _Gender.Description   as GenderDesc,
      _Course
}
