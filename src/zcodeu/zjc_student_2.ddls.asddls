@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view ZJC_STUDENT_2'
@Metadata.allowExtensions: true
define root view entity ZJC_STUDENT_2 
provider contract transactional_query
as projection on ZJI_STUDENT_2
{
    key StudentId,
    FirstName,
    LastName,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _Attachment : redirected to composition child ZJC_ATTACHMENT
}
