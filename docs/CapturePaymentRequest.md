# WorldnetPayments::CapturePaymentRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **operator** | **String** | The operator who initiated the transaction. If not sent in the request, this field will be automatically populated with the API Key alias. | [optional] |
| **capture_amount** | **Float** | The amount to be captured. If not sent, the full amount of the transaction will be captured. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::CapturePaymentRequest.new(
  operator: null,
  capture_amount: null
)
```

