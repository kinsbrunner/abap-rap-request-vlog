@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Request item interface view'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_RequestItem
  as select from ZRAP_A_REQITEM
  association to parent ZI_Request as _Request on $projection.RequestUuid = _Request.RequestUuid
{
  key request_uuid    as RequestUuid,
  key item_uuid       as ItemUuid,
      product_id      as ProductId,
      @Semantics.quantity.unitOfMeasure: 'ProductUom'
      product_qty     as ProductQty,
      product_uom     as ProductUom,
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      
      //Associations
      _Request
}
