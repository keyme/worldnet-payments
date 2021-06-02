# WorldnetPayments::MagStripePayloadAllOf

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **downgrade_to** | **String** | This field gives clients the ability to reprocess offline transactions that were not approved initially in a different entry mode.&lt;br /&gt;For instance, &#x60;MAG_STRIPE&#x60; transactions are allowed to be downgraded to &#x60;KEYED&#x60;. | [optional] |
| **cardholder_name** | **String** | The cardholder&#39;s name as it appears on the card. | [optional] |
| **cardholder_signature** | **String** | Cardholder&#39;s signature in the format described in the [Special Fields and Parameters](https://docs.worldnettps.com/doku.php?id&#x3D;developer:api_specification:special_fields_and_parameters#the_signature_field_format) section. | [optional] |
| **card_details** | [**MagStripeDataFormat**](MagStripeDataFormat.md) |  | [optional] |
| **pin_details** | [**DukptPinDetails**](DukptPinDetails.md) |  | [optional] |
| **ebt_details** | [**EbtDetails**](EbtDetails.md) |  | [optional] |
| **additional_tlv_data** | **String** | Additional TLV (Tag-Length-Value) data which is sometimes required for contactless transactions. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::MagStripePayloadAllOf.new(
  downgrade_to: null,
  cardholder_name: null,
  cardholder_signature: null,
  card_details: null,
  pin_details: null,
  ebt_details: null,
  additional_tlv_data: null
)
```

