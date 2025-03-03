@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZGP_P_MASTER 
provider contract transactional_query
as projection on zgp_I_master as Master
{
    key GpId,
    Description,
    Completed,
    CreatedBy,
    CreatedDate,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _Detail : redirected to composition child ZGP_P_Detail
}
