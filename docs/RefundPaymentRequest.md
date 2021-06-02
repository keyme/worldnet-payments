# WorldnetPayments::RefundPaymentRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **operator** | **String** | The operator who initiated the transaction. If not sent in the request, this field will be automatically populated with the API Key alias. | [optional] |
| **refund_amount** | **Float** | The amount to return to the customer&#39;s account. |  |
| **refund_reason** | **String** | The reason why the transaction is being refunded. |  |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::RefundPaymentRequest.new(
  operator: null,
  refund_amount: null,
  refund_reason: null
)
```

