# WorldnetPayments::Payment

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unique_reference** | **String** | Unique reference number assigned by the gateway that identifies the transaction on both platforms.  **Note:** Clients must be able to store this value in order to eventually perform follow up operation on existing transactions. |  |
| **terminal** | **String** | The terminal number assigned by the gateway. |  |
| **operator** | **String** | The operator who initiated the transaction. | [optional] |
| **order** | [**Order**](Order.md) |  | [optional] |
| **customer_account** | [**CustomerAccount**](CustomerAccount.md) |  |  |
| **security_check** | [**SecurityCheck**](SecurityCheck.md) |  | [optional] |
| **transaction_result** | [**TransactionResult**](TransactionResult.md) |  | [optional] |
| **additional_data_fields** | [**Array&lt;CustomField&gt;**](CustomField.md) | List of custom fields representing the additional information sent by the merchant and stored along with the transaction. | [optional] |
| **emv_tags** | [**Array&lt;EmvTag&gt;**](EmvTag.md) | List of tags returned for EMV transactions. | [optional] |
| **receipts** | [**Array&lt;TransactionReceipt&gt;**](TransactionReceipt.md) | The customer and merchant receipt copies. | [optional] |
| **links** | [**Array&lt;HypermediaLink&gt;**](HypermediaLink.md) | List of hypermedia links containing the operations available for the resource. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::Payment.new(
  unique_reference: null,
  terminal: null,
  operator: null,
  order: null,
  customer_account: null,
  security_check: null,
  transaction_result: null,
  additional_data_fields: null,
  emv_tags: null,
  receipts: null,
  links: null
)
```

