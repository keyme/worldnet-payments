# WorldnetPayments::SecureCredentialsSettings

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **enable** | **Boolean** | Indicates whether the terminal supports secure credentials which is our tokenization mechanism for cards and accounts. |  |
| **enable_secure_card_validation** | **Boolean** | Indicates that account verifications will be performed when the secure code (CVV) is provided during Secure Card registrations. |  |
| **force_secure_card_validation** | **Boolean** | Indicates that account verifications are mandatory for all Secure Card registrations. |  |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::SecureCredentialsSettings.new(
  enable: null,
  enable_secure_card_validation: null,
  force_secure_card_validation: null
)
```

