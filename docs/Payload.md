# WorldnetPayments::Payload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payload_type** | **String** |  |  |
| **account_type** | **String** |  | [optional][default to &#39;CHECKING&#39;] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::Payload.new(
  payload_type: null,
  account_type: null
)
```

