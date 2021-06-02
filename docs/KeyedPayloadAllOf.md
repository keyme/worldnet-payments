# WorldnetPayments::KeyedPayloadAllOf

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cardholder_name** | **String** | The cardholder&#39;s name as it appears on the card. | [optional] |
| **card_details** | [**KeyedDataFormat**](KeyedDataFormat.md) |  | [optional] |
| **pin_details** | [**DukptPinDetails**](DukptPinDetails.md) |  | [optional] |
| **ebt_details** | [**EbtDetails**](EbtDetails.md) |  | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::KeyedPayloadAllOf.new(
  cardholder_name: null,
  card_details: null,
  pin_details: null,
  ebt_details: null
)
```

