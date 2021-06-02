# WorldnetPayments::ThreeDSecure

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **enable** | **Boolean** | Indicates whether 3D-Secure capability is available for the terminal. | [optional] |
| **supported_cards** | **Array&lt;String&gt;** | List of cards brands eligible for 3D-Secure processing. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::ThreeDSecure.new(
  enable: null,
  supported_cards: null
)
```

