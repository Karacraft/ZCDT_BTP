@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view ZJI_ACADEMIC_1'
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZJC_ACADEMIC_1
  as projection on ZJI_ACADEMIC_1 as Academic
{
  key StudentId,
      @Search.defaultSearchElement: true
  key Course,
      @Search.defaultSearchElement: true
  key Semester,
      Semresult,
      CourseDescription,
      SemesterDescription,
      SemesterResult,
      ResultDescription,

      /* Associations */
      _Course,
      _Result,
      _Semester,
      _Student : redirected to parent ZJC_STUDENT_1
}
