# WorldnetPayments::AccessToken

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **audience** | **String** | The intended audience for the token |  |
| **bound_to** | **String** | Alias of the Merchant API Key to which the access token is bound |  |
| **token_type** | **String** | Authentication scheme |  |
| **token** | **String** | JWT Access Token |  |
| **expires_in** | **Integer** | Number of hours after which the token will be expired |  |
| **enable_receipts** | **Boolean** | Indicates whether transaction responses should contains the cardholder and merchant receipt copies |  |
| **enable_hypermedia** | **Boolean** | Indicates whether responses should contains hypermedia links |  |
| **roles** | **Array&lt;String&gt;** | Set of roles with which the token was granted | [optional] |
| **allowed_terminals** | **Array&lt;String&gt;** | Set of terminal numbers with which the token is allowed to operate | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::AccessToken.new(
  audience: null,
  bound_to: null,
  token_type: Bearer,
  token: null,
  expires_in: null,
  enable_receipts: null,
  enable_hypermedia: null,
  roles: transaction-api:read-only,
  allowed_terminals: null
)
```

