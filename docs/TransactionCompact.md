# WorldnetPayments::TransactionCompact

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unique_reference** | **String** | Unique reference number assigned by the gateway that identifies the transaction on both platforms.  **Note:** Clients must be able to store this value in order to eventually perform follow up operation on existing transactions. |  |
| **terminal** | **String** | The terminal number assigned by the gateway. |  |
| **operator** | **String** | The operator who initiated the transaction. | [optional] |
| **order_id** | **String** | A unique identifier for the order assigned by the merchant. |  |
| **date_time** | **Time** | The processing date and time of the transaction represented as per [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) standard. | [optional] |
| **description** | **String** | A brief description of the transaction. | [optional] |
| **customer_name** | **String** | The card or account holder&#39;s name. | [optional] |
| **masked_pan** | **String** | The masked primary account number. | [optional] |
| **type** | **String** | The type of the generated transaction. | [optional] |
| **result_code** | **String** | Our platform maps result codes sent by different payment processors into a smaller set of codes as shown below. The original result code may be available in the &#x60;processorResultCode&#x60; field.  - **A**: Approved / Authorized. - **D**: Declined / Not Authorized. - **E**: Accepted for later processing, but result currently unknown. - **P**: Only a portion of the original amount requested was authorized. - **R**: Issuer has declined the transaction and indicated that the customer should contact their bank. - **C**: Issuer has declined the transaction and requested that the card be retained as it may have been reported as lost or stolen. | [optional] |
| **status** | **String** | The current status of the generated transaction. | [optional] |
| **currency** | **String** | The currency of the transaction. A 3-letter code as per the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217#Active_codes) standard. |  |
| **amount** | **Float** | The amount authorized by the payment processor.  **Note:** For partial authorizations, this amount will be lower than the actual amount sent in the request.&lt;br /&gt;**Note:** This amount will be negative for refund transactions to represent the return of settled funds back to the customer&#39;s account. |  |
| **links** | [**Array&lt;HypermediaLink&gt;**](HypermediaLink.md) | List of hypermedia links containing the operations available for the resource. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::TransactionCompact.new(
  unique_reference: null,
  terminal: null,
  operator: null,
  order_id: null,
  date_time: null,
  description: null,
  customer_name: null,
  masked_pan: null,
  type: null,
  result_code: null,
  status: null,
  currency: null,
  amount: null,
  links: null
)
```

