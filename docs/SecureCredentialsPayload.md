# WorldnetPayments::SecureCredentialsPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **credentials_number** | **String** | The unique number assigned by the gateway that should be used to reference the payment credentials when performing transactions. |  |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::SecureCredentialsPayload.new(
  credentials_number: null
)
```

