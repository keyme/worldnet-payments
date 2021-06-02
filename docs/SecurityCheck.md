# WorldnetPayments::SecurityCheck

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cvv_result** | **String** |  | [optional] |
| **avs_result** | **String** |  | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::SecurityCheck.new(
  cvv_result: null,
  avs_result: null
)
```

