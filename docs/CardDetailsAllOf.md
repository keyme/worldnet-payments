# WorldnetPayments::CardDetailsAllOf

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cardholder_name** | **String** | The cardholder&#39;s name as it appears on the card. | [optional] |
| **card_number** | **String** | The card number, as a string without any separators. | [optional] |
| **expiry_date** | **String** | The card&#39;s expiration date in the format &#x60;MMYY&#x60;. | [optional] |
| **cvv** | **String** | The card&#39;s security code. | [optional] |
| **issue_number** | **String** | The card&#39;s issue number. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::CardDetailsAllOf.new(
  cardholder_name: null,
  card_number: null,
  expiry_date: null,
  cvv: null,
  issue_number: null
)
```

