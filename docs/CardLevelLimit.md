# WorldnetPayments::CardLevelLimit

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **card** | **String** | The card brand to which the list of volume limits below will be applied. |  |
| **limits** | [**Array&lt;CardVolumeLimit&gt;**](CardVolumeLimit.md) | List of limits to be applied to transactions using the brand specified in the property &#x60;card&#x60;. |  |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::CardLevelLimit.new(
  card: null,
  limits: null
)
```

