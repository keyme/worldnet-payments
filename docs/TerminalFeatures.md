# WorldnetPayments::TerminalFeatures

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **allow_offline_sales** | **Boolean** | Indicates whether the terminal allows offline sales. |  |
| **allow_partial_refund** | **Boolean** | Indicates whether the terminal allows partial refunds. |  |
| **allow_tax** | **Boolean** | Indicates whether the terminal is able to process taxes. |  |
| **allow_tip** | **Boolean** | Indicates whether the terminal is able to process tips. |  |
| **allow_google_pay** | **Boolean** | Indicates whether the terminal is able to handle digital wallet payloads from Google Pay. |  |
| **allow_apple_pay** | **Boolean** | Indicates whether the terminal is able to handle digital wallet payloads from Apple Pay. |  |
| **allow_emv** | **Boolean** | Indicates whether the terminal is able to handle card payloads from EMV devices. |  |
| **allow_keyed** | **Boolean** | Indicates whether the terminal is able to handle manually keyed card details. |  |
| **allow_mag_stripe** | **Boolean** | Indicates whether the terminal is able to handle card payloads from MSR devices. |  |
| **allow_mag_stripe_fallback** | **Boolean** | Indicates whether the terminal allows transactions to fallback to swipe method due to chip card reader failures. |  |
| **secure_credentials** | [**SecureCredentialsSettings**](SecureCredentialsSettings.md) |  | [optional] |
| **surcharge** | [**SurchargeSettings**](SurchargeSettings.md) |  | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::TerminalFeatures.new(
  allow_offline_sales: null,
  allow_partial_refund: null,
  allow_tax: null,
  allow_tip: null,
  allow_google_pay: null,
  allow_apple_pay: null,
  allow_emv: null,
  allow_keyed: null,
  allow_mag_stripe: null,
  allow_mag_stripe_fallback: null,
  secure_credentials: null,
  surcharge: null
)
```

