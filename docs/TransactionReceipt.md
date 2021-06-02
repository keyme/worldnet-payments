# WorldnetPayments::TransactionReceipt

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **copy** | **String** |  |  |
| **header** | **String** |  |  |
| **merchant_details** | [**Array&lt;ReceiptOrderedInfo&gt;**](ReceiptOrderedInfo.md) |  |  |
| **transaction_data** | [**Array&lt;ReceiptOrderedInfo&gt;**](ReceiptOrderedInfo.md) |  |  |
| **custom_fields** | [**Array&lt;CustomField&gt;**](CustomField.md) |  |  |
| **icc_data** | [**Array&lt;ReceiptOrderedInfo&gt;**](ReceiptOrderedInfo.md) |  |  |
| **footer** | **String** |  |  |
| **terms_and_conditions** | **String** |  | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::TransactionReceipt.new(
  copy: null,
  header: null,
  merchant_details: null,
  transaction_data: null,
  custom_fields: null,
  icc_data: null,
  footer: null,
  terms_and_conditions: null
)
```

