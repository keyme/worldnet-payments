# WorldnetPayments::CustomerAccount

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **card_type** | **String** | The brand of the card used in the transaction. | [optional] |
| **cardholder_name** | **String** | The cardholder&#39;s name as it appears on the card. | [optional] |
| **masked_pan** | **String** | The card number masked with the character &#x60;*&#x60;.&lt;br /&gt;According to PCI DSS, only the first six and last four digits may be displayed. For example: &#x60;548010******5929&#x60; | [optional] |
| **expiry_date** | **String** | The card&#39;s expiration date in the format &#x60;MMYY&#x60;. | [optional] |
| **entry_method** | **String** | The method used to capture the customer&#39;s account details. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::CustomerAccount.new(
  card_type: null,
  cardholder_name: null,
  masked_pan: null,
  expiry_date: null,
  entry_method: null
)
```

