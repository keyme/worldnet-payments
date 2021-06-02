# WorldnetPayments::UpdateRefundRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **customer** | [**CustomerUpdatableData**](CustomerUpdatableData.md) |  | [optional] |
| **operator** | **String** | The operator who initiated the transaction. If not sent in the request, this field will be automatically populated with the API Key alias. | [optional] |
| **status** | **String** | The current status of the generated transaction. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::UpdateRefundRequest.new(
  customer: null,
  operator: null,
  status: null
)
```

