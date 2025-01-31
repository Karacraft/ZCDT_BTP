@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view ZJC_STUDENT_1'
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZJC_STUDENT_1 
provider contract transactional_query
as projection on ZJI_STUDENT_1 as Student
{
    @Search.defaultSearchElement: true
    key StudentId,
    @Search.defaultSearchElement: true
    FirstName,
    @Search.defaultSearchElement: true
    LastName,
    Age,
    Gender,
    Dob,
    MultiCourseAllowed,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    GenderDesc,
    /* Associations */
    _Academic: redirected to composition child ZJC_ACADEMIC_1,
    _Gender
}
