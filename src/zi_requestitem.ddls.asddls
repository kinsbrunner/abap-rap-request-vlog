@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Request item interface view'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_RequestItem
  as select from zrap_a_reqitem as item
     inner join zrap_c_products as prod on prod.product = item.product_id
     
  association to parent ZI_Request as _Request on $projection.RequestUuid = _Request.RequestUuid
{
  key item.request_uuid    as RequestUuid,
  key item.item_uuid       as ItemUuid,
      item.product_id      as ProductId,
      prod.description     as Description,
      @Semantics.quantity.unitOfMeasure: 'ProductUom'
      item.product_qty     as ProductQty,
      item.product_uom     as ProductUom,
      @Semantics.user.createdBy: true
      item.created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      item.created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      item.last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      item.last_changed_at as LastChangedAt,
      
      //Associations
      _Request
}
