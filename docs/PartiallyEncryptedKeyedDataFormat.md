# WorldnetPayments::PartiallyEncryptedKeyedDataFormat

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **device** | [**EncryptionCapableDevice**](EncryptionCapableDevice.md) |  |  |
| **encrypted_pan** | **String** | The primary account number (PAN) / card number encrypted by the device. |  |
| **masked_pan** | **String** | The card number masked with the character &#x60;*&#x60;.&lt;br /&gt;According to PCI DSS, only the first six and last four digits may be displayed. For example: &#x60;548010******5929&#x60; |  |
| **expiry_date** | **String** | The card&#39;s expiration date in the format &#x60;MMYY&#x60;. |  |
| **cvv** | **String** | The card&#39;s security code. | [optional] |
| **cvv_encrypted** | **String** | The CVV data encrypted by the device. | [optional] |
| **issue_number** | **String** | The card&#39;s issue number. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::PartiallyEncryptedKeyedDataFormat.new(
  device: null,
  encrypted_pan: null,
  masked_pan: null,
  expiry_date: null,
  cvv: null,
  cvv_encrypted: null,
  issue_number: null
)
```

