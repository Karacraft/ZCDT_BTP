@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Interface to ZGP_Master Table'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZGP_I_MASTER 
as select from zgp_master as Master
composition[1..*] of ZGP_I_DETAIL as _Detail
{
    @EndUserText.label: 'GP ID'
    key gpid as GpId,
    @EndUserText.label: 'Gatepass'
    description as Description,
    @EndUserText.label: 'Done'
    completed as Completed,
    @EndUserText.label: 'Creator'
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @EndUserText.label: 'Dated'
    @Semantics.systemDateTime.createdAt: true
    created_date as CreatedDate,
    @EndUserText.label: 'L.Chng.By'
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    @EndUserText.label: 'L.Chng.At'
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    _Detail // Make association public
}
