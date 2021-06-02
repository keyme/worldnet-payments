# WorldnetPayments::Surcharge

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **applied** | **Boolean** | Indicates whether or not a surcharge fee is applied to the total amount. | [optional] |
| **amount** | **Float** | Surcharge amount. This field is only available in the response and it&#39;ll be populated whenever a surcharge fee is applied to the transaction. | [optional][readonly] |
| **percentage** | **Float** | Surcharge percentage. This field is only available in the response and it&#39;ll be populated whenever a surcharge fee is applied to the transaction. | [optional][readonly] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::Surcharge.new(
  applied: null,
  amount: null,
  percentage: null
)
```

