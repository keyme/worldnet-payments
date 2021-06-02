# WorldnetPayments::DeviceTypeCompact

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Type of device. |  |
| **manufacturer** | **String** | Company responsible for manufacturing the devices of this type. | [optional] |
| **links** | [**Array&lt;HypermediaLink&gt;**](HypermediaLink.md) | List of hypermedia links containing the operations available for the resource. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::DeviceTypeCompact.new(
  type: null,
  manufacturer: null,
  links: null
)
```

