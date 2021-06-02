# WorldnetPayments::Error

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **debug_identifier** | **String** | Clients should use this field when communicating to our support team. It allows us to easily identify the request and consequently the reason behind its failure. |  |
| **details** | [**Array&lt;ErrorDetail&gt;**](ErrorDetail.md) |  |  |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::Error.new(
  debug_identifier: null,
  details: null
)
```

