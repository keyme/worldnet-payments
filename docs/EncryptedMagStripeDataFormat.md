# WorldnetPayments::EncryptedMagStripeDataFormat

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **device** | [**EncryptionCapableDevice**](EncryptionCapableDevice.md) |  |  |
| **encrypted_data** | **String** | The encrypted data captured by the magnetic stripe reader. |  |
| **first_digit_of_pan** | **String** | The first digit of the primary account number (PAN) / card number. | [optional] |
| **fallback** | **Boolean** | Indicates that the chip of the card could not be read due to a technical issue which resulted in the technology “falling back” to a magnetic stripe transaction. | [optional] |
| **fallback_reason** | **String** | The reason that caused the fallback. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::EncryptedMagStripeDataFormat.new(
  device: null,
  encrypted_data: null,
  first_digit_of_pan: null,
  fallback: null,
  fallback_reason: null
)
```

