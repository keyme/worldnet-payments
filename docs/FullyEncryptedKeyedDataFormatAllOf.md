# WorldnetPayments::FullyEncryptedKeyedDataFormatAllOf

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **device** | [**EncryptionCapableDevice**](EncryptionCapableDevice.md) |  | [optional] |
| **encrypted_data** | **String** | The full card data encrypted by the device. | [optional] |
| **first_digit_of_pan** | **String** | The first digit of the primary account number (PAN) / card number. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::FullyEncryptedKeyedDataFormatAllOf.new(
  device: null,
  encrypted_data: null,
  first_digit_of_pan: null
)
```

