# WorldnetPayments::ErrorSource

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **location** | **String** | The HTTP message element that contains the invalid value. |  |
| **resource** | **String** | For errors in the request body, this field points to the object that contains the invalid property. | [optional] |
| **property** | **String** | The field or parameter that carries the invalid value. | [optional] |
| **value** | **String** | Invalid value sent by the client. | [optional] |
| **expected** | **String** | Here the server gives a hint of how the client should fix the issue. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::ErrorSource.new(
  location: null,
  resource: null,
  property: null,
  value: null,
  expected: null
)
```

