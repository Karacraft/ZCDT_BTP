@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Branch Consumption'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_C_ZBRANCH 
as projection on Z_I_ZBRANCH
{
    @Search.defaultSearchElement: true
    key SchoolId,
    @Search.defaultSearchElement: true
    key BranchId,
    Area,
    Principal,
    Strength,
    CreatedAt,
    CreatedOn,
    CreatedBy,
    /* Associations */
    _School : redirected to parent Z_C_ZSCHOOL
}
