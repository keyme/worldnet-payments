# WorldnetPayments::OfflineProcessing

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **operation** | **String** |  | [optional] |
| **approval_code** | **String** | Approval code provided by the payment processor for the specific transaction.&lt;br /&gt;Use this field combined with &#x60;OFFLINE_APPROVAL&#x60; operation. | [optional] |
| **date_time** | **Time** | Local date/time of operation as per [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) standard.&lt;br /&gt;Use this field combined with &#x60;DEFERRED_AUTHORIZATION&#x60; operation. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::OfflineProcessing.new(
  operation: null,
  approval_code: null,
  date_time: null
)
```

