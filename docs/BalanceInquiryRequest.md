# WorldnetPayments::BalanceInquiryRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **terminal** | **String** | The terminal number assigned by the gateway. This field indicates the terminal responsible for processing the transaction. |  |
| **operator** | **String** | The operator who initiated the transaction. If not sent in the request, this field will be automatically populated with the API Key alias. | [optional] |
| **currency** | **String** | The currency of the transaction. A 3-letter code as per the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217#Active_codes) standard. |  |
| **customer** | [**Customer**](Customer.md) |  | [optional] |
| **customer_account** | [**Payload**](Payload.md) |  |  |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::BalanceInquiryRequest.new(
  terminal: null,
  operator: null,
  currency: null,
  customer: null,
  customer_account: null
)
```

