@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view ZJC_ATTACHMENT'
@Metadata.allowExtensions: true
define view entity ZJC_ATTACHMENT 
as projection on ZJI_ATTACHMENT
{
    key AttaId,
    Student_Id,
    Comments,
    Attachment,
    Mimetype,
    Filename,
    LastChangedAt,
    /* Associations */
    _Student : redirected to parent ZJC_STUDENT_2
}
