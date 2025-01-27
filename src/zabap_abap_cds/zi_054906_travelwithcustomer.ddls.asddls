@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel with Customer'

define view entity ZI_054906_TravelWithCustomer
  as select from ZI_054906_Travel     as Travel

    inner join   ZI_054906_Customer   as Customer   on Customer.CustomerId = Travel.CustomerId
    inner join   ZI_054906_StatusText as StatusText on Travel.Status = StatusText.value_low

{
  key Travel.TravelId,

      Travel.AgencyId,
      Travel.BeginDate,
      Travel.EndDate,
      dats_days_between(Travel.BeginDate, Travel.EndDate) + 1       as Duration,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => Travel.BookingFee,
                          source_currency    => Travel.CurrencyCode,
                          target_currency    => $projection.CurrencyCode,
                          exchange_rate_date => Travel.BeginDate,
                          error_handling     => 'KEEP_UNCONVERTED') as BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => Travel.TotalPrice,
                          source_currency    => Travel.CurrencyCode,
                          target_currency    => $projection.CurrencyCode,
                          exchange_rate_date => Travel.BeginDate,
                          error_handling     => 'KEEP_UNCONVERTED') as TotalPrice,

      cast('EUR' as abap.cuky)                                      as CurrencyCode,
      Travel.Description,
      Travel.Status,
      StatusText.text                                               as StatusText,
      Customer.CustomerId,

      case when Customer.Title is initial then concat_with_space(Customer.FirstName, Customer.LastName, 1)
       else concat_with_space(concat_with_space(Customer.Title, Customer.FirstName, 1), Customer.LastName, 1)
      end                                                           as CustomerName,

      Customer.Street,
      Customer.PostalCode,
      Customer.City
}

where Customer.CountryCode = 'DE'
