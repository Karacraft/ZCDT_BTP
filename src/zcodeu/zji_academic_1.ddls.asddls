@EndUserText.label: 'Interface  ZJTB_ACADEMIC_1'
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZJI_ACADEMIC_1
  as select from zjtb_academic_1 as Academic
  association to parent ZJI_STUDENT_1 as _Student  on $projection.StudentId = _Student.StudentId

  association to ZJI_COURSE           as _Course   on $projection.Course = _Course.Value
  association to ZJI_SEMESTER         as _Semester on $projection.Semester = _Semester.Value
  association to ZJI_RESULT           as _Result   on $projection.Semresult = _Result.Value

{

      @EndUserText.label: 'Student ID'
  key student_id            as StudentId,
      @EndUserText.label: 'Course'
  key course                as Course,
      @EndUserText.label: 'Semester'
  key semester              as Semester,
      @EndUserText.label: 'Semester Result'
      semresult             as Semresult,
      @EndUserText.label: 'Course.Desc'
      _Course.Description   as CourseDescription,
      @EndUserText.label: 'Semester.Desc'
      _Semester.Description as SemesterDescription,
      @EndUserText.label: 'Sem.Result'
      semresult             as SemesterResult,
      @EndUserText.label: 'Sem.Result.Desc'
      _Result.Description   as ResultDescription,

      /* Association */
      _Student,
      _Course,
      _Semester,
      _Result
}
