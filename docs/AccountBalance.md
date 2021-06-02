# WorldnetPayments::AccountBalance

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **benefit_category** | **String** |  |  |
| **currency** | **String** | The currency of the transaction. A 3-letter code as per the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217#Active_codes) standard. |  |
| **amount** | **Float** | Current balance amount. |  |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::AccountBalance.new(
  benefit_category: null,
  currency: null,
  amount: null
)
```

