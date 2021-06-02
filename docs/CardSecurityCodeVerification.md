# WorldnetPayments::CardSecurityCodeVerification

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **enable** | **Boolean** | Indicates whether CVV check is available for the terminal. | [optional] |
| **auto_decline_on_failure** | **Boolean** | Indicates that all CVV codes listed in &#x60;cvvDeclineCodes&#x60; property will lead to a transaction decline.This is sometimes desirable as not all card issuers will decline a transaction that has failed a CVV check. | [optional] |
| **decline_codes** | **Array&lt;String&gt;** | List of CVV result codes that will lead to a transaction decline when &#x60;autoDeclineTransactionsOnCvvFailures&#x60; is enabled. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::CardSecurityCodeVerification.new(
  enable: null,
  auto_decline_on_failure: null,
  decline_codes: null
)
```

