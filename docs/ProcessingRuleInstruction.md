# WorldnetPayments::ProcessingRuleInstruction

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **action** | **String** | The action to be performed when the conditions are met. |  |
| **terminal** | **String** | The number of the terminal which is the target of the action. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::ProcessingRuleInstruction.new(
  action: null,
  terminal: null
)
```

