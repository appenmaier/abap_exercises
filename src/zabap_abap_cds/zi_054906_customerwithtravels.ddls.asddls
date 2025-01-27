@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Customer with Travels'

define view entity ZI_054906_CustomerWithTravels
  as select from ZI_054906_Customer

  association [0..*] to ZI_054906_Travel as _Travels on $projection.CustomerId = _Travels.CustomerId

{
  key CustomerId,

      FirstName,
      LastName,
      Title,
      Street,
      PostalCode,
      City,

      _Travels
}

where CountryCode = 'DE'
