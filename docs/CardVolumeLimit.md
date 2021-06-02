# WorldnetPayments::CardVolumeLimit

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit_scope** | **String** |  |  |
| **limit_threshold** | **Integer** | The maximum amount allowed within the period described in the &#x60;limitScope&#x60; attribute. |  |
| **without_cvv_only** | **Boolean** | If enabled, the limit will only take transactions without CVV into account. This is specially useful for merchants who are looking for a way to add thresholds for transactions that may lead to chargebacks.&lt;br /&gt;This filter only applies to limits within &#x60;SINGLE_TRANSACTION&#x60; scope. | [optional] |
| **without_avs_only** | **Boolean** | If enabled, the limit will only take transactions without AVS into account. This is specially useful for merchants who are looking for a way to add thresholds for transactions that may lead to chargebacks.&lt;br /&gt;This filter only applies to limits within &#x60;SINGLE_TRANSACTION&#x60; scope. | [optional] |
| **current_value** | **Float** | The sum of all transactions performed with the &#x60;card&#x60; within the period described in the &#x60;limitScope&#x60; attribute.&lt;br /&gt;At the end of each period, this value is reset. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::CardVolumeLimit.new(
  limit_scope: null,
  limit_threshold: null,
  without_cvv_only: null,
  without_avs_only: null,
  current_value: null
)
```

