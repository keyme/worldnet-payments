# WorldnetPayments::TerminalCustomField

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | The type of the data the custom field is configured to carry. |  |
| **name** | **String** | Custom field name assigned by the merchant. |  |
| **display_name** | **String** | Friendly name that should be used for receipts and pages. |  |
| **display_order** | **Integer** | Position of the field in relation to other custom fields. |  |
| **payment_page** | **Boolean** | Indicates whether the custom field should be shown on hosted pages. |  |
| **subscription** | **Boolean** | Indicates whether the custom field should be considered for Subscriptions which is our payment plan / standing order mechanism. |  |
| **secure_credentials_only** | **Boolean** | Indicates whether the custom field will **only** serve the purpose of adding additional information to secure cards or accounts. |  |
| **mandatory** | **Boolean** | If enabled, it ensures that a transaction will never be processed without the custom field properly populated. |  |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::TerminalCustomField.new(
  type: null,
  name: null,
  display_name: null,
  display_order: null,
  payment_page: null,
  subscription: null,
  secure_credentials_only: null,
  mandatory: null
)
```

