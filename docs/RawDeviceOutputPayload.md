# WorldnetPayments::RawDeviceOutputPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **device** | [**Device**](Device.md) |  |  |
| **raw_data** | **String** | The raw POS device&#39;s output data. |  |
| **cardholder_signature** | **String** | Cardholder&#39;s signature in the format described in the [Special Fields and Parameters](https://docs.worldnettps.com/doku.php?id&#x3D;developer:api_specification:special_fields_and_parameters#the_signature_field_format) section. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::RawDeviceOutputPayload.new(
  device: null,
  raw_data: null,
  cardholder_signature: null
)
```

