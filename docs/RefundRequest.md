# WorldnetPayments::RefundRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel** | **String** |  | [optional] |
| **terminal** | **String** | The terminal number assigned by the gateway. |  |
| **operator** | **String** | The operator who initiated the transaction. If not sent in the request, this field will be automatically populated with the API Key alias. | [optional] |
| **order_id** | **String** | A unique identifier for the order assigned by the merchant. |  |
| **currency** | **String** | The currency of the transaction. A 3-letter code as per the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217#Active_codes) standard. |  |
| **refund_amount** | **Float** | The total amount to be refunded. |  |
| **refund_reason** | **String** | The reason why the refund is being performed. |  |
| **customer** | [**Customer**](Customer.md) |  | [optional] |
| **customer_account** | [**Payload**](Payload.md) |  | [optional] |
| **ip_address** | [**IpAddress**](IpAddress.md) |  | [optional] |
| **additional_data_fields** | [**Array&lt;CustomField&gt;**](CustomField.md) | List of custom fields which are used to add extra information to transactions. Their values are going to be stored and used for the requests sent to the terminal&#39;s receipt and validation webhooks.&lt;br /&gt;To understand more visit the section regarding [Special Fields and Parameters](https://docs.worldnettps.com/doku.php?id&#x3D;developer:api_specification:special_fields_and_parameters). | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::RefundRequest.new(
  channel: null,
  terminal: null,
  operator: null,
  order_id: null,
  currency: null,
  refund_amount: null,
  refund_reason: null,
  customer: null,
  customer_account: null,
  ip_address: null,
  additional_data_fields: null
)
```

