# WorldnetPayments::UpdatePaymentRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **operator** | **String** | The operator who initiated the transaction. If not sent in the request, this field will be automatically populated with the API Key alias. | [optional] |
| **total_amount** | **Float** | It allows clients to update the transaction&#39;s total amount. | [optional] |
| **customer** | [**CustomerUpdatableData**](CustomerUpdatableData.md) |  | [optional] |
| **order_breakdown** | [**OrderBreakdownUpdatableData**](OrderBreakdownUpdatableData.md) |  | [optional] |
| **status** | **String** | It allows clients to update the transaction&#39;s status. | [optional] |
| **cardholder_signature** | **String** | It allows clients to perform a late signature capture for approved cardholder present transactions.  **Note:** Once a signature is stored for a specific transaction it cannot be replace or deleted. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::UpdatePaymentRequest.new(
  operator: null,
  total_amount: null,
  customer: null,
  order_breakdown: null,
  status: null,
  cardholder_signature: null
)
```

