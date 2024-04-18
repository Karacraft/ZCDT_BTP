@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Branch Base'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_I_ZBRANCH 
as select from zbranch as Branch
association to parent z_i_zschool as _School on $projection.SchoolId = _School.SchoolId 
{
    key Branch.school_id as SchoolId,
    key Branch.branch_id as BranchId,
    Branch.area as Area,
    Branch.principal as Principal,
    Branch.strength as Strength,
    Branch.created_at as CreatedAt,
    Branch.created_on as CreatedOn,
    Branch.created_by as CreatedBy,
    _School
}
