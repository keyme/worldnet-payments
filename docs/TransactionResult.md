# WorldnetPayments::TransactionResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | The type of the generated transaction. | [optional] |
| **status** | **String** | The current status of the generated transaction. | [optional] |
| **approval_code** | **String** | The authorization code assigned by the payment processor for approved transactions. | [optional] |
| **date_time** | **Time** | The processing date and time of the transaction represented as per [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) standard. | [optional] |
| **currency** | **String** | The currency of the transaction. A 3-letter code as per the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217#Active_codes) standard. | [optional] |
| **authorized_amount** | **Float** | The amount authorized by the payment processor.  **Note:** For partial authorizations, this amount will be lower than the actual amount sent in the request.&lt;br /&gt;**Note:** This amount will be negative for refund transactions to represent the return of funds back to the customer&#39;s account. | [optional] |
| **result_code** | **String** | Our platform maps result codes sent by different payment processors into a smaller set of codes as shown below. The original result code may be available in the &#x60;processorResultCode&#x60; field.  - **A**: Approved / Authorized. - **D**: Declined / Not Authorized. - **E**: Accepted for later processing, but result currently unknown. - **P**: Only a portion of the original amount requested was authorized. - **R**: Issuer has declined the transaction and indicated that the customer should contact their bank. - **C**: Issuer has declined the transaction and requested that the card be retained as it may have been reported as lost or stolen. | [optional] |
| **result_message** | **String** | A brief description sent by the processor about the transaction result.&lt;br /&gt;Clients must use this description in order to understand the cause of rejections and declines. | [optional] |
| **processor_result_code** | **String** | The original result code sent by the payment processor. | [optional] |
| **stored_payment_credentials** | [**SecureCredentials**](SecureCredentials.md) |  | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::TransactionResult.new(
  type: null,
  status: null,
  approval_code: null,
  date_time: null,
  currency: null,
  authorized_amount: null,
  result_code: null,
  result_message: null,
  processor_result_code: null,
  stored_payment_credentials: null
)
```

