# WorldnetPayments::TenderTypePredicateAllOf

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **is** | **String** | The comparison operator. | [optional] |
| **value** | **String** | The required value for the condition to be met. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::TenderTypePredicateAllOf.new(
  is: null,
  value: null
)
```

