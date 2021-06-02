# WorldnetPayments::TerminalCompact

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_processor** | **String** | The financial entity that will process and authorize the operations performed by the terminal. | [optional] |
| **terminal_number** | **String** | Unique number assigned by the gateway. | [optional] |
| **display_name** | **String** | Friendly name assigned by the merchant. | [optional] |
| **base_currency** | **String** | The terminal&#39;s base currency used for single currency transactions as well as MCP and DCC processing.  **Note:** Terminals where &#x60;allowMulticurrency&#x60; is enabled will not have a base currency. | [optional] |
| **time_zone** | **String** | Terminal&#39;s preferred time-zone. | [optional] |
| **links** | [**Array&lt;HypermediaLink&gt;**](HypermediaLink.md) | List of hypermedia links containing the operations available for the resource. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::TerminalCompact.new(
  payment_processor: null,
  terminal_number: null,
  display_name: null,
  base_currency: null,
  time_zone: null,
  links: null
)
```

