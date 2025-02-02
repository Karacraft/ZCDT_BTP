@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Task Item Interface'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZRAJ_I_TASK_ITEM_01
  as select from zaj_task_item_01 as Item
  association to parent zraj_i_task_01 as _Task on $projection.TaskId = _Task.TaskId
{
      @EndUserText.label: 'Task Item ID'
  key task_i_id             as TaskIId,
      @EndUserText.label: 'Task ID'
      task_id               as TaskId,
      @EndUserText.label: 'Sub Task'
      subtask               as Subtask,
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
      _Task // Make association public
}
