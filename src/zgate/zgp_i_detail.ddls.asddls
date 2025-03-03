@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface ZGP_Detail Table'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZGP_I_DETAIL
  as select from zgp_detail as Detail
  association to parent ZGP_I_MASTER as _Master on $projection.GpId = _Master.GpId
{
      @EndUserText.label: 'Task Item ID'
  key gpd_id             as DetailId,
      @EndUserText.label: 'GP ID'
      gpid               as GpId,
      @EndUserText.label: 'Detail'
      detail               as Detail,
      @EndUserText.label: 'Due Date'
      due_date              as DueDate,
      @EndUserText.label: 'Creator'
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @EndUserText.label: 'Dated'
      @Semantics.systemDateTime.createdAt: true
      created_date          as CreatedDate,
      @EndUserText.label: 'L.Chng.By'
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @EndUserText.label: 'L.Chng.At'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      _Master // Make association public
}
