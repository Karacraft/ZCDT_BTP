@EndUserText.label: 'Travel BO Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_RAP_TRAVEL_9991
  as projection on ZI_RAP_TRAVEL_9991
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      TravelID,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency', element: 'AgencyID'} }]
      @ObjectModel.text.element: ['AgencyName']
      @Search.defaultSearchElement: true
      AgencyID,
      _Agency.Name       as AgencyName,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID'} }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerID,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency'} }]
      CurrencyCode,
      Description,
      TravelStatus,
      LastChangedAt,
      LocalLastChangedAt,

      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZC_RAP_Booking_9991,
      _Currency,
      _Customer
}
