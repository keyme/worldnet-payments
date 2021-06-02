# WorldnetPayments::MerchantDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Merchant&#39;s DBA (Doing Business As). This information will appear on transaction receipts. |  |
| **mcc** | **String** | Merchant Category Code. It is a four-digit number listed in ISO 18245 for retail financial services. An MCC is used to classify a business by the types of goods or services it provides. |  |
| **phone** | **String** | Merchant&#39;s phone number. This information will appear on transaction receipts. |  |
| **email** | **String** | Merchant&#39;s email address. This information will appear on transaction receipts. |  |
| **website** | **String** | Merchant&#39;s web page. This information will appear on transaction receipts. | [optional] |
| **address** | [**Address**](Address.md) |  | [optional] |
| **merchant_volume_limits** | [**Array&lt;MerchantLevelLimit&gt;**](MerchantLevelLimit.md) | List of merchant-level volume limits. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::MerchantDetails.new(
  name: null,
  mcc: null,
  phone: null,
  email: null,
  website: null,
  address: null,
  merchant_volume_limits: null
)
```

