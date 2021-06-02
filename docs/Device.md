# WorldnetPayments::Device

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Type/Model of the point-of-sale terminal. |  |
| **category** | **String** |  | [optional][default to &#39;ATTENDED&#39;] |
| **serial_number** | **String** | Serial number of the point-of-sale terminal. | [optional] |
| **firmware_version** | **String** | Firmware version of the point-of-sale terminal. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::Device.new(
  type: null,
  category: null,
  serial_number: null,
  firmware_version: null
)
```

