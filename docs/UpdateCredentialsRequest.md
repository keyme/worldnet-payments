# WorldnetPayments::UpdateCredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **terminal** | **String** | The number of the terminal which is the credentials&#39; holder. |  |
| **operator** | **String** | The operator who initiated the transaction. If not sent in the request, this field will be automatically populated with the API Key alias. | [optional] |
| **customer** | [**Customer**](Customer.md) |  | [optional] |
| **customer_account** | [**UpdatablePayload**](UpdatablePayload.md) |  | [optional] |
| **additional_data_fields** | [**Array&lt;CustomField&gt;**](CustomField.md) | List of custom fields to add or update. An empty list will lead to the removal of any existing additional data associated with the credentials. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::UpdateCredentialsRequest.new(
  terminal: null,
  operator: null,
  customer: null,
  customer_account: null,
  additional_data_fields: null
)
```

