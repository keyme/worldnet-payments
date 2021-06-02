# WorldnetPayments::Voucher

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **approval_code** | **String** | The authorization code issued by a customer service representative. This code is usually acquired via a phone call during which it is ensured that there are enough funds in the cardholder’s EBT account for the transaction. |  |
| **serial_number** | **String** | The voucher serial number. |  |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::Voucher.new(
  approval_code: null,
  serial_number: null
)
```

