@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'School Cosumption'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity Z_C_ZSCHOOL
  as projection on Z_I_ZSCHOOL
{
      @UI.lineItem: [{ label: 'School ID' , position: 10 }]
      @UI.selectionField: [{ position: 10 }]
  key SchoolId,
      @Search.defaultSearchElement: true
      @UI.lineItem: [{ label : 'School Name', position: 20 }]
      Name,
      @UI.lineItem: [{ label : 'School Name', position : 30 }]
      Medium,
      @UI.lineItem: [{ label : 'Type', position : 40 }]
      Type,
      @UI.lineItem: [{ label: 'Dated' }]
      CreatedAt,
      @UI.lineItem: [{ label: 'Time' }]
      CreatedOn,
      @UI.lineItem: [{ label: 'Creator' }]
      CreatedBy,
      /* Associations */
      _Branch : redirected to composition child Z_C_ZBRANCH
}
