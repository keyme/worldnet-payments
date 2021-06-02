# WorldnetPayments::ErrorDetail

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **error_code** | **String** | A code assigned by the gateway to each type of failure. |  |
| **error_message** | **String** | A brief description of the given error. |  |
| **about** | **String** | A link to an external documentation that fully explains the issue. | [optional] |
| **source** | [**ErrorSource**](ErrorSource.md) |  | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::ErrorDetail.new(
  error_code: null,
  error_message: null,
  about: null,
  source: null
)
```

