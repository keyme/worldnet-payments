# WorldnetPayments::TenderTypePredicate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **is** | **String** | The comparison operator. |  |
| **value** | **String** | The required value for the condition to be met. |  |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::TenderTypePredicate.new(
  is: null,
  value: null
)
```

