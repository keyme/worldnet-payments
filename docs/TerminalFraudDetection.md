# WorldnetPayments::TerminalFraudDetection

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **allow_cardholder_signature_bypass** | **Boolean** | Indicates whether cardholder signature requirement should be relaxed. |  |
| **allow_unreferenced_refunds** | **Boolean** | Indicates whether the terminal allows unreferenced refunds.&lt;br /&gt;This type of refunds do not require a prior payment transaction to be referenced. |  |
| **unreferenced_refund_amount_limit** | **Integer** | Amount threshold for unreferenced refunds. |  |
| **refund_percentage_limit** | **Float** | The percentage limit for referenced refunds. This is usually configured at 100% of the original transaction&#39;s amount. |  |
| **address_verification** | [**AddressVerificationSystem**](AddressVerificationSystem.md) |  | [optional] |
| **cvv_verification** | [**CardSecurityCodeVerification**](CardSecurityCodeVerification.md) |  | [optional] |
| **three_d_secure** | [**ThreeDSecure**](ThreeDSecure.md) |  | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::TerminalFraudDetection.new(
  allow_cardholder_signature_bypass: null,
  allow_unreferenced_refunds: null,
  unreferenced_refund_amount_limit: null,
  refund_percentage_limit: null,
  address_verification: null,
  cvv_verification: null,
  three_d_secure: null
)
```

