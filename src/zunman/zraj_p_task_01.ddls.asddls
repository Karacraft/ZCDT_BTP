@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZRAJ_P_TASK_01 
provider contract transactional_query
as projection on zraj_i_task_01 as Task
{
    key TaskId,
    Description,
    Completed,
    CreatedBy,
    CreatedDate,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _Item : redirected to composition child ZRAJ_P_TASK_ITEM_01
}
