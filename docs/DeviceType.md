# WorldnetPayments::DeviceType

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Type of device. |  |
| **manufacturer** | **String** | Company responsible for manufacturing the devices of this type. | [optional] |
| **supports_mag_stripe** | **Boolean** | Indicates whether this type of device is capable of performing card swipes. | [optional] |
| **supports_icc** | **Boolean** | Indicates whether this type of device is capable of reading card chips. | [optional] |
| **supports_keyed** | **Boolean** | Indicates whether this type of device is capable of accepting keyed inputs. | [optional] |
| **supports_contactless** | **Boolean** | Indicates whether this type of device is capable of performing contactless transactions. | [optional] |
| **supports_pin_entry** | **Boolean** | Indicates whether this type of device is capable of accepting PIN entry. | [optional] |
| **supports_output_printing** | **Boolean** | Indicates whether this type of device is capable of printing. | [optional] |
| **supports_output_displaying** | **Boolean** | Indicates whether this type of device is capable of displaying information. | [optional] |
| **applications** | [**Array&lt;EmvApplication&gt;**](EmvApplication.md) |  | [optional] |
| **certificates** | [**Array&lt;EmvCertificate&gt;**](EmvCertificate.md) |  | [optional] |
| **revoked_certificates** | [**Array&lt;EmvCertificate&gt;**](EmvCertificate.md) |  | [optional] |
| **default_emv_tags** | [**Array&lt;EmvTag&gt;**](EmvTag.md) |  | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::DeviceType.new(
  type: null,
  manufacturer: null,
  supports_mag_stripe: null,
  supports_icc: null,
  supports_keyed: null,
  supports_contactless: null,
  supports_pin_entry: null,
  supports_output_printing: null,
  supports_output_displaying: null,
  applications: null,
  certificates: null,
  revoked_certificates: null,
  default_emv_tags: null
)
```

