# WorldnetPayments::EncryptionCapableDevice

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Type/Model of the point-of-sale terminal. |  |
| **data_ksn** | **String** |  |  |
| **serial_number** | **String** | Serial number of the point-of-sale terminal. | [optional] |
| **firmware_version** | **String** | Firmware version of the point-of-sale terminal. | [optional] |
| **category** | **String** |  | [optional][default to &#39;ATTENDED&#39;] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::EncryptionCapableDevice.new(
  type: null,
  data_ksn: null,
  serial_number: null,
  firmware_version: null,
  category: null
)
```

