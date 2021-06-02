# WorldnetPayments::Terminal

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_processor** | **String** | The financial entity that will process and authorize the operations performed by the terminal. |  |
| **terminal_number** | **String** | Unique number assigned by the gateway. |  |
| **merchant_details** | [**MerchantDetails**](MerchantDetails.md) |  | [optional] |
| **bank_settings** | [**TerminalBankSettings**](TerminalBankSettings.md) |  | [optional] |
| **terminal_location** | [**TerminalLocationDetails**](TerminalLocationDetails.md) |  | [optional] |
| **terminal_features** | [**TerminalFeatures**](TerminalFeatures.md) |  | [optional] |
| **fraud_detection** | [**TerminalFraudDetection**](TerminalFraudDetection.md) |  | [optional] |
| **processing_rules** | [**Array&lt;ProcessingRule&gt;**](ProcessingRule.md) | The list of rules that allows for changing the way transactions are processed by this terminal. Each rule has its own conditions which leads to a certain action when all of them are met.&lt;br /&gt;For example, processing rules can be used to route transactions to other terminals in your account. | [optional] |
| **terminal_tips** | [**Array&lt;TerminalTip&gt;**](TerminalTip.md) | The list of terminal&#39;s pre-configured tips. | [optional] |
| **terminal_taxes** | [**Array&lt;TerminalTax&gt;**](TerminalTax.md) | The list of terminal&#39;s supported taxes. | [optional] |
| **terminal_custom_fields** | [**Array&lt;TerminalCustomField&gt;**](TerminalCustomField.md) | List of additional data fields that can be used when performing transactions or storing secure credentials.&lt;br /&gt;For more information about custom fields, see [Special Fields and Parameters](https://docs.worldnettps.com/doku.php?id&#x3D;developer:api_specification:special_fields_and_parameters#the_custom_fields). | [optional] |
| **supported_cards** | **Array&lt;String&gt;** | List of card brands supported by the terminal. | [optional] |
| **supported_device_types** | **Array&lt;String&gt;** | List of POS device types supported by the terminal. | [optional] |
| **volume_limits** | [**TerminalVolumeLimits**](TerminalVolumeLimits.md) |  | [optional] |
| **links** | [**Array&lt;HypermediaLink&gt;**](HypermediaLink.md) | List of hypermedia links containing the operations available for the resource. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::Terminal.new(
  payment_processor: null,
  terminal_number: null,
  merchant_details: null,
  bank_settings: null,
  terminal_location: null,
  terminal_features: null,
  fraud_detection: null,
  processing_rules: null,
  terminal_tips: null,
  terminal_taxes: null,
  terminal_custom_fields: null,
  supported_cards: null,
  supported_device_types: null,
  volume_limits: null,
  links: null
)
```

