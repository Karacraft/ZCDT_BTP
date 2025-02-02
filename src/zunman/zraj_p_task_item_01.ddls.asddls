@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZRAJ_P_TASK_ITEM_01 
as projection on ZRAJ_I_TASK_ITEM_01 as Item
{
    key TaskIId,
    TaskId,
    Subtask,
    DueDate,
    CreatedBy,
    CreatedDate,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _Task : redirected to parent ZRAJ_P_TASK_01
}
