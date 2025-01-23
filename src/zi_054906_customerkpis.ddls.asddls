@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Customer KPIs'

define view entity ZI_054906_CustomerKPIs
  with parameters
    P_City : /dmo/city

  as select from ZI_054906_TravelWithCustomer

{
  key CustomerId,

      CustomerName,
      Street,
      PostalCode,
      City,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(TotalPrice + BookingFee)  as TotalRevenue,

      CurrencyCode,
      avg(Duration as abap.dec(16)) as AverageDuration,
      count(distinct AgencyId)      as NumberOfDifferentAgencys
}

where City = $parameters.P_City

group by CustomerId,
         CustomerName,
         Street,
         PostalCode,
         City,
         CurrencyCode

having sum(TotalPrice + BookingFee) >= 5000
