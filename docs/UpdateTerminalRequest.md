# WorldnetPayments::UpdateTerminalRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **terminal_tips** | [**Array&lt;TerminalTip&gt;**](TerminalTip.md) | The list of terminal&#39;s pre-configured tips. | [optional] |
| **terminal_taxes** | [**Array&lt;TerminalTax&gt;**](TerminalTax.md) | The list of terminal&#39;s supported taxes. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::UpdateTerminalRequest.new(
  terminal_tips: null,
  terminal_taxes: null
)
```

