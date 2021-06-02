# WorldnetPayments::HypermediaLink

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **rel** | **String** | Keyword that represents the action that the link is supposed to perform. | [optional] |
| **method** | **String** | The HTTP method or verb. | [optional] |
| **href** | **String** | The actual request URL. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::HypermediaLink.new(
  rel: null,
  method: POST,
  href: null
)
```

