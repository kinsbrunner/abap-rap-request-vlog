@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Priority value help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS

define view entity ZI_Priority_VH
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE( p_domain_name: 'ZRAP_PRIORITY_D' )   as values
    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZRAP_PRIORITY_D' ) as texts on  values.domain_name = texts.domain_name
                                                                                            and values.value_low   = texts.value_low
                                                                                            and texts.language     = $session.system_language
{
      @ObjectModel.text.element: [ 'PriorityText' ]
  key values.value_low as PriorityCode,
      texts.text       as PriorityText
}
