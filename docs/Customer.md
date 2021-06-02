# WorldnetPayments::Customer

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The customer&#39;s name. | [optional] |
| **phone** | **String** | The customer&#39;s contact phone number.&lt;br /&gt;If **SMS Cardholder Receipts** feature is enabled in the terminal, We will use this number to automatically send the receipts of eventual transactions. | [optional] |
| **email** | **String** | The customer&#39;s contact email address.&lt;br /&gt;If **Email Cardholder Receipt** feature is enabled in the terminal, We will use this address to automatically send the receipts of eventual transactions. | [optional] |
| **notification_language** | **String** | The customer&#39;s preferred notification language.&lt;br /&gt;The two-letter language code defined by the [ISO 639-1 alpha-2](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) standard. | [optional] |
| **billing_address** | [**Address**](Address.md) |  | [optional] |
| **shipping_address** | [**Address**](Address.md) |  | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::Customer.new(
  name: null,
  phone: null,
  email: null,
  notification_language: null,
  billing_address: null,
  shipping_address: null
)
```

