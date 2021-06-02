# WorldnetPayments::ReversePaymentRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **operator** | **String** | The operator who initiated the transaction. If not sent in the request, this field will be automatically populated with the API Key alias. | [optional] |
| **reversal_amount** | **Float** | The amount to return to the customer&#39;s account.  **Note:** This field is not required for full amount cancellations. | [optional] |
| **reversal_reason** | **String** | The reason why the transaction is being cancelled. | [optional] |
| **customer_account** | [**Payload**](Payload.md) |  | [optional] |
| **ip_address** | [**IpAddress**](IpAddress.md) |  | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::ReversePaymentRequest.new(
  operator: null,
  reversal_amount: null,
  reversal_reason: null,
  customer_account: null,
  ip_address: null
)
```

