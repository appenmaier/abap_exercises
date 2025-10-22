@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Textelement for Status'

define view entity Z054906_StatusText
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                   p_domain_name : '/DMO/STATUS')

{
  key domain_name,
  key value_position,
  key language,

      value_low,
      text
}

where language = $session.system_language
