@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Request projection view'
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'ExternalId' ]

define root view entity ZC_Request
  provider contract transactional_query
  as projection on ZI_Request
{
  key RequestUuid,
      @Search.defaultSearchElement: true
      ExternalId,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'RequesterName' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_BusinessPartner_VH',
                                                     element: 'BusinessPartner' } }]
      RequesterId,
      _requester.BusinessPartnerName as RequesterName,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'StatusText' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_Status_Edit_VH',
                                                     element: 'StatusCode' } }]
      Status,
      @ObjectModel.text.element: [ 'StatusText' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_Status_VH',
                                                     element: 'StatusCode' } }]
      Status                         as StatusFilter,
      _status.StatusText             as StatusText,
      StatusCriticality,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'PriorityText' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_Priority_VH',
                                                     element: 'PriorityCode' } }]
      @Consumption.filter.selectionType: #SINGLE
      Priority,
      _priority.PriorityText         as PriorityText,
      DeadlineDate,
      CancelReason,
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_RAP_REQUEST_CALC_EXIT'
      virtual CancelReasonHidden : abap_boolean,
      LastChangedAt,

      /* Associations */
      _items : redirected to composition child ZC_RequestItem,
      _requester
}
