# WorldnetPayments::PaymentRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel** | **String** |  | [optional] |
| **terminal** | **String** | The terminal number assigned by the gateway. |  |
| **operator** | **String** | The operator who initiated the transaction. If not sent in the request, this field will be automatically populated with the API Key alias. | [optional] |
| **order** | [**Order**](Order.md) |  |  |
| **customer** | [**Customer**](Customer.md) |  | [optional] |
| **customer_account** | [**Payload**](Payload.md) |  | [optional] |
| **credential_on_file** | [**CredentialOnFile**](CredentialOnFile.md) |  | [optional] |
| **ip_address** | [**IpAddress**](IpAddress.md) |  | [optional] |
| **auto_capture** | **Boolean** | It indicates whether the amount of the transaction should be automatically and fully captured.  - &#x60;true&#x60; : the gateway will automatically set the transaction to &#x60;READY&#x60; making it eligible for the next settlement run. - &#x60;false&#x60;: a pre-authorization will be performed if your account has the \&quot;Allow Pre-Auth\&quot; feature enabled. Otherwise, a regular transaction will be created with &#x60;PENDING&#x60; status. Either way, an additional call to the [Capture a Payment](#operation/capturePayment) operation is required to capture the final amount and flag the transaction as ready for the next settlement run. | [optional][default to true] |
| **process_as_sale** | **Boolean** | Indicates whether the transaction should be processed as a Sale. A Sale transaction is characterized by its &#x60;COMPLETE&#x60; status due to the fact that authorization and settlement operations are performed at the same time. This means that this kind of transaction is not subject to changes or late adjustments even while sitting in the open batch.  **Note:** The &#x60;autoCapture&#x60; indicator must be set to TRUE to process a Sale. | [optional][default to false] |
| **offline_processing** | [**OfflineProcessing**](OfflineProcessing.md) |  | [optional] |
| **additional_data_fields** | [**Array&lt;CustomField&gt;**](CustomField.md) | List of custom fields which are used to add extra information to transactions. Their values are going to be stored and used for the requests sent to the terminal&#39;s receipt and validation webhooks.&lt;br /&gt;For more information, visit the section [Special Fields and Parameters](https://docs.worldnettps.com/doku.php?id&#x3D;developer:api_specification:special_fields_and_parameters) of our knowledge base. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::PaymentRequest.new(
  channel: null,
  terminal: null,
  operator: null,
  order: null,
  customer: null,
  customer_account: null,
  credential_on_file: null,
  ip_address: null,
  auto_capture: null,
  process_as_sale: null,
  offline_processing: null,
  additional_data_fields: null
)
```

