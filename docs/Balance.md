# WorldnetPayments::Balance

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **terminal** | **String** | The terminal number assigned by the gateway. This field indicates the terminal responsible for processing the transaction. |  |
| **operator** | **String** | The operator who initiated the transaction. | [optional] |
| **transaction_result** | [**TransactionResult**](TransactionResult.md) |  | [optional] |
| **account_balances** | [**Array&lt;AccountBalance&gt;**](AccountBalance.md) | List of balance results per benefit category. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::Balance.new(
  terminal: null,
  operator: null,
  transaction_result: null,
  account_balances: null
)
```

