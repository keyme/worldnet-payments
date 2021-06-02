# WorldnetPayments::TerminalPaginatedResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;TerminalCompact&gt;**](TerminalCompact.md) | List of elements. |  |
| **_next** | **String** | The cursor pointing to the next set of elements. | [optional] |
| **links** | [**Array&lt;HypermediaLink&gt;**](HypermediaLink.md) | List of hypermedia links containing the operations available for the resource. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::TerminalPaginatedResult.new(
  data: null,
  _next: null,
  links: null
)
```

