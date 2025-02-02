@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Interface to ZRAJ_TASK_01 Mas Table'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zraj_i_task_01 
as select from zraj_task_01 as Task
composition[1..*] of ZRAJ_I_TASK_ITEM_01 as _Item
{
    @EndUserText.label: 'Task ID'
    key task_id as TaskId,
    @EndUserText.label: 'Task'
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
    _Item // Make association public
}
