# WorldnetPayments::OrderBreakdown

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **subtotal_amount** | **Float** | The amount excluding taxes, tip and cashback amounts. |  |
| **cashback_amount** | **Float** | Cashback amount. | [optional] |
| **taxes** | [**Array&lt;Tax&gt;**](Tax.md) | List of taxes to be applied to the order. | [optional] |
| **tip** | [**Tip**](Tip.md) |  | [optional] |
| **surcharge** | [**Surcharge**](Surcharge.md) |  | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::OrderBreakdown.new(
  subtotal_amount: null,
  cashback_amount: null,
  taxes: null,
  tip: null,
  surcharge: null
)
```

