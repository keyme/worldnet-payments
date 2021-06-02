# WorldnetPayments::DigitalWalletPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **service_provider** | **String** | The wallet application provider. |  |
| **cardholder_name** | **String** | The cardholder&#39;s name as it appears on the card. | [optional] |
| **encrypted_data** | **String** | The encrypted data generated by the digital wallet application. |  |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::DigitalWalletPayload.new(
  service_provider: null,
  cardholder_name: null,
  encrypted_data: null
)
```
