@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Request Item projection view'
@Metadata.allowExtensions: true

define view entity ZC_RequestItem
  as projection on ZI_RequestItem
{
  key RequestUuid,
  key ItemUuid,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_Product_VH',
                                                     element: 'ProductId' } }]
      ProductId,
      ProductQty,
      
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_UnitOfMeasureStdVH',
                                                     element: 'UnitOfMeasure' } }]
      ProductUom,
      LastChangedAt,

      /* Associations */
      _Request : redirected to parent ZC_Request
}
