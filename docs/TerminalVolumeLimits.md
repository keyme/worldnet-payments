# WorldnetPayments::TerminalVolumeLimits

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **enable_terminal_level_limits** | **Boolean** | Indicates whether the terminal has any terminal-level limits enabled. |  |
| **terminal_level_limits** | [**Array&lt;TerminalLevelLimit&gt;**](TerminalLevelLimit.md) | List of terminal-level volume limits. | [optional] |
| **enable_card_level_limits** | **Boolean** | Indicates whether the terminal has any card-level limits enabled. |  |
| **card_level_limits** | [**Array&lt;CardLevelLimit&gt;**](CardLevelLimit.md) | List of card-level volume limits. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::TerminalVolumeLimits.new(
  enable_terminal_level_limits: null,
  terminal_level_limits: null,
  enable_card_level_limits: null,
  card_level_limits: null
)
```

