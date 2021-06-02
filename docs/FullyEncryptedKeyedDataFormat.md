# WorldnetPayments::FullyEncryptedKeyedDataFormat

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **device** | [**EncryptionCapableDevice**](EncryptionCapableDevice.md) |  |  |
| **encrypted_data** | **String** | The full card data encrypted by the device. |  |
| **first_digit_of_pan** | **String** | The first digit of the primary account number (PAN) / card number. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::FullyEncryptedKeyedDataFormat.new(
  device: null,
  encrypted_data: null,
  first_digit_of_pan: null
)
```

