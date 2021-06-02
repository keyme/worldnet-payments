# WorldnetPayments::TerminalTip

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unique_reference** | **String** | Unique reference number assigned by the gateway. This field must be used when trying to update an existing terminal&#39;s tip. | [optional] |
| **type** | **String** |  |  |
| **amount** | **Float** | This field must used when the tip is of type &#x60;FIXED_AMOUNT&#x60;. Otherwise, refer to the &#x60;percentage&#x60; property instead. | [optional] |
| **currency** | **String** | Currency associated with the tip. A 3-letter code as per the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217#Active_codes) standard.&lt;br /&gt;This is specially useful for multi-currency terminals in order to provide a different set of tips for each supported currency. | [optional] |
| **percentage** | **Float** | This field must used when the tip is of type &#x60;PERCENTAGE&#x60;. Otherwise, refer to the &#x60;amount&#x60; property instead. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::TerminalTip.new(
  unique_reference: null,
  type: null,
  amount: null,
  currency: null,
  percentage: null
)
```

