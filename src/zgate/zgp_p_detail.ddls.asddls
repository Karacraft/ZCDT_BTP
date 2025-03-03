@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZGP_P_DETAIL 
as projection on ZGP_I_Detail as Detail
{
    key DetailId,
    GpId,
    Detail,
    DueDate,
    CreatedBy,
    CreatedDate,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _Master : redirected to parent ZGP_P_MASTER
}
