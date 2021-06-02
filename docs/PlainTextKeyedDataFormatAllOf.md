# WorldnetPayments::PlainTextKeyedDataFormatAllOf

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **device** | [**Device**](Device.md) |  | [optional] |
| **card_number** | **String** | The card number, as a string without any separators. | [optional] |
| **expiry_date** | **String** | The card&#39;s expiration date in the format &#x60;MMYY&#x60;. This field is mandatory in most cases except when performing electronic voucher transactions. | [optional] |
| **cvv** | **String** | The card&#39;s security code. | [optional] |
| **issue_number** | **String** | The card&#39;s issue number. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::PlainTextKeyedDataFormatAllOf.new(
  device: null,
  card_number: null,
  expiry_date: null,
  cvv: null,
  issue_number: null
)
```

