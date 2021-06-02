# WorldnetPayments::EmvPayloadAllOf

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **downgrade_to** | **String** | This field gives clients the ability to reprocess offline transactions that were not approved initially in a different entry mode.&lt;br /&gt;For instance, &#x60;EMV&#x60; transactions are allowed to be downgraded to &#x60;MAG_STRIPE&#x60; or &#x60;KEYED&#x60;. | [optional] |
| **device** | [**EncryptionCapableDevice**](EncryptionCapableDevice.md) |  | [optional] |
| **tlv** | **String** | The EMV tags in TLV (Tag-Length-Value) format.&lt;br /&gt;For clients not familiar with this format, the API also offer the possibility of sending the list of tags in the &#x60;tags&#x60; fields. | [optional] |
| **tags** | [**Array&lt;EmvTag&gt;**](EmvTag.md) | The list of EMV tags. Not required unless the &#x60;tlv&#x60; field is absent. | [optional] |
| **first_digit_of_pan** | **String** | The first digit of the primary account number (PAN) / card number. | [optional] |
| **cardholder_signature** | **String** | Cardholder&#39;s signature in the format described in the [Special Fields and Parameters](https://docs.worldnettps.com/doku.php?id&#x3D;developer:api_specification:special_fields_and_parameters#the_signature_field_format) section. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::EmvPayloadAllOf.new(
  downgrade_to: null,
  device: null,
  tlv: null,
  tags: null,
  first_digit_of_pan: null,
  cardholder_signature: null
)
```

