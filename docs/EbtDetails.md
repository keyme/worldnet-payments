# WorldnetPayments::EbtDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **benefit_category** | **String** |  |  |
| **withdrawal** | **Boolean** | Indicates a cash withdrawal request. This option is only available for EBT cash benefit accounts. | [optional] |
| **voucher** | [**Voucher**](Voucher.md) |  | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::EbtDetails.new(
  benefit_category: null,
  withdrawal: null,
  voucher: null
)
```

