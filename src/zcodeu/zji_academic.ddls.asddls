@EndUserText.label: 'Interface Root ZJTB_ACADEMIC'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZJI_ACADEMIC 
as select from zjtb_academic
association to parent ZJI_STUDENT as _Student on $projection.StudentId = _Student.StudentId

association to ZJI_COURSE as _Course on $projection.Course = _Course.Value
association to ZJI_SEMESTER as _Semester on $projection.Semester = _Semester.Value
association to ZJI_RESULT as _Result on $projection.SemesterResult = _Result.Value
{
    @EndUserText.label: 'Student ID'
    key student_id as StudentId,
    @EndUserText.label: 'Course'
    key course as Course,
    @EndUserText.label: 'Semester'
    key semester as Semester,
    @EndUserText.label: 'Course.Desc'
    _Course.Description as CourseDescription,
    @EndUserText.label: 'Semester.Desc'
    _Semester.Description as SemesterDescription,
    @EndUserText.label: 'Sem.Result'
    semresult as SemesterResult,
    @EndUserText.label: 'Sem.Result.Desc'
    _Result.Description as ResultDescription,
    
    /* Association */
    _Student,
    _Course,
    _Semester,
    _Result

}
