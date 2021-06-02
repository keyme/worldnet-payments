# WorldnetPayments::StoreCredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **terminal** | **String** | The terminal number assigned by the gateway. This field indicates the terminal that owns the credentials, even though, it is possible to share credentials with other terminals.See the *Secure Card* section in [Integration Settings](https://docs.worldnettps.com/doku.php?id&#x3D;developer:important_integration_settings) for more details about secure credentials sharing feature. |  |
| **operator** | **String** | The operator who initiated the transaction. If not sent in the request, this field will be automatically populated with the API Key alias. | [optional] |
| **merchant_reference** | **String** | Unique merchant reference that identifies the stored credentials on both merchant&#39;s and gateway&#39;s sides.&lt;br /&gt;If not provided, we will assign an auto-generated value to the credentials and returns it in the response. | [optional] |
| **ip_address** | [**IpAddress**](IpAddress.md) |  | [optional] |
| **customer** | [**Customer**](Customer.md) |  | [optional] |
| **customer_account** | [**Payload**](Payload.md) |  |  |
| **additional_data_fields** | [**Array&lt;CustomField&gt;**](CustomField.md) | List of custom fields which are used to add extra information to stored credentials. Their values are going to be stored and used for the requests sent to the terminal&#39;s receipt and validation webhooks.&lt;br /&gt;To understand more visit the section regarding [Special Fields and Parameters](https://docs.worldnettps.com/doku.php?id&#x3D;developer:api_specification:special_fields_and_parameters). | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::StoreCredentialsRequest.new(
  terminal: null,
  operator: null,
  merchant_reference: null,
  ip_address: null,
  customer: null,
  customer_account: null,
  additional_data_fields: null
)
```

