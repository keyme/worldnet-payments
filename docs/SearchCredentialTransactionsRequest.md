# WorldnetPayments::SearchCredentialTransactionsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **terminal** | **String** | The terminal number assigned by the gateway. This field indicates the terminal that owns the credentials, even though, it is possible to share credentials with other terminals. See the *Secure Card* section in [Integration Settings](https://docs.worldnettps.com/doku.php?id&#x3D;developer:important_integration_settings) for more details about secure credentials sharing feature. |  |
| **operator** | **String** | The operator who initiated the transaction. If not sent in the request, this field will be automatically populated with the API Key alias. | [optional] |
| **ip_address** | [**IpAddress**](IpAddress.md) |  | [optional] |
| **customer_account** | [**Payload**](Payload.md) |  |  |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::SearchCredentialTransactionsRequest.new(
  terminal: null,
  operator: null,
  ip_address: null,
  customer_account: null
)
```

