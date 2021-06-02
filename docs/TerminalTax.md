# WorldnetPayments::TerminalTax

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unique_reference** | **String** | Unique reference number assigned by the gateway. This field must be used when trying to update an existing terminal&#39;s tax. | [optional] |
| **name** | **String** | Tax Name. |  |
| **rate** | **Float** | The ratio expressed as a percentage at which a transaction is taxed. |  |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::TerminalTax.new(
  unique_reference: null,
  name: null,
  rate: null
)
```

