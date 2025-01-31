@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Inteface for ZI_SEMESTER'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZJI_SEMESTER 
as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name:'ZI_SEMESTER' )
{
    key domain_name,
    key value_position,
    @Semantics.language: true
    key language,
    value_low as Value,
    @Semantics.text: true
    text as Description
}
