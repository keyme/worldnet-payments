# WorldnetPayments::Order

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **order_id** | **String** | A unique identifier for the order assigned by the merchant. |  |
| **description** | **String** | A brief description of the transaction. | [optional] |
| **currency** | **String** | The currency of the transaction. A 3-letter code as per the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217#Active_codes) standard. |  |
| **total_amount** | **Float** | The total amount to be authorized. |  |
| **order_breakdown** | [**OrderBreakdown**](OrderBreakdown.md) |  | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::Order.new(
  order_id: null,
  description: null,
  currency: null,
  total_amount: null,
  order_breakdown: null
)
```

