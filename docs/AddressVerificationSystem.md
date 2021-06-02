# WorldnetPayments::AddressVerificationSystem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **enable** | **Boolean** | Indicates whether AVS check is available for the terminal and merchants may send cardholder’s billing address for verification. | [optional] |
| **compulsory** | **Boolean** | If enabled, it ensures that a transaction will never be processed without billing address information. | [optional] |
| **auto_decline_on_failure** | **Boolean** | Indicates that all AVS non-match will lead to a transaction decline. This is sometimes desirable as not all card issuers will decline a transaction that has failed an AVS check. | [optional] |
| **preferred_address_mode** | **String** | This field defines a configuration for the execution and validation of AVS transactions.  - Exact: At least the first line of the address as well as city and postal code are mandatory. - Postal: Only postal code is mandatory when filling up customer&#39;s billing address. | [optional] |
| **approval_codes** | **Array&lt;String&gt;** | List of AVS result codes that are considered to be a match. The codes left out of this list will lead to a transaction decline when &#x60;autoDeclineTransactionsOnAvsFailures&#x60; is enabled. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::AddressVerificationSystem.new(
  enable: null,
  compulsory: null,
  auto_decline_on_failure: null,
  preferred_address_mode: null,
  approval_codes: null
)
```

