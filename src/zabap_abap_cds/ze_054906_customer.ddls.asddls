extend view entity ZI_054906_Customer with

  association [0..*] to /dmo/booking as _ZZBookings on $projection.CustomerId = _ZZBookings.customer_id

{
  _ZZBookings
}
