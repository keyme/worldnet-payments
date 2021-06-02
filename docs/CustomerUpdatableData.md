# WorldnetPayments::CustomerUpdatableData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **phone** | **String** | The customer&#39;s contact phone number.&lt;br /&gt;If **SMS Cardholder Receipts** feature is enabled in the terminal, We will use this number to automatically send the receipts of eventual transactions. | [optional] |
| **email** | **String** | The customer&#39;s contact email address.&lt;br /&gt;If **Email Cardholder Receipt** feature is enabled in the terminal, We will use this address to automatically send the receipts of eventual transactions. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::CustomerUpdatableData.new(
  phone: null,
  email: null
)
```

