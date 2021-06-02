# WorldnetPayments::Tip

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** |  |  |
| **amount** | **Float** | This field must used when the tip is of type &#x60;FIXED_AMOUNT&#x60;. Otherwise, refer to the &#x60;percentage&#x60; property instead. | [optional] |
| **percentage** | **Float** | This field must used when the tip is of type &#x60;PERCENTAGE&#x60;. Otherwise, refer to the &#x60;amount&#x60; property instead. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::Tip.new(
  type: null,
  amount: null,
  percentage: null
)
```

