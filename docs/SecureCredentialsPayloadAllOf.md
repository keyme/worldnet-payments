# WorldnetPayments::SecureCredentialsPayloadAllOf

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **credentials_number** | **String** | The unique number assigned by the gateway that should be used to reference the payment credentials when performing transactions. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::SecureCredentialsPayloadAllOf.new(
  credentials_number: null
)
```

