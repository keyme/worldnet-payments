# WorldnetPayments::DukptPinDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **pin** | **String** | The PIN encrypted using [DUKPT](https://en.wikipedia.org/wiki/Derived_unique_key_per_transaction) Scheme. |  |
| **pin_ksn** | **String** | The key serial number. |  |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::DukptPinDetails.new(
  pin: null,
  pin_ksn: null
)
```

