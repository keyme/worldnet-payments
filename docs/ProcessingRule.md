# WorldnetPayments::ProcessingRule

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **enable** | **Boolean** | Indicates whether the rule should be evaluated. |  |
| **conditions** | [**Array&lt;ProcessingRulePredicate&gt;**](ProcessingRulePredicate.md) | The conditions that trigger the action, if met. |  |
| **_then** | [**ProcessingRuleInstruction**](ProcessingRuleInstruction.md) |  |  |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::ProcessingRule.new(
  enable: null,
  conditions: null,
  _then: null
)
```

