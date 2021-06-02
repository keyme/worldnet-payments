# WorldnetPayments::Address

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **line1** | **String** | The first line of the address.&lt;br /&gt;This field is used for AVS checks along with &#x60;city&#x60; and &#x60;postalCode&#x60;. | [optional] |
| **line2** | **String** | The second line of the address, if any. | [optional] |
| **postal_code** | **String** | The address&#39;s ZIP or postal code. | [optional] |
| **city** | **String** | The city or town of the address. | [optional] |
| **state** | **String** | The state, county, province, or region. | [optional] |
| **country** | **String** | The two-letter country code defined by [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) standard. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::Address.new(
  line1: null,
  line2: null,
  postal_code: null,
  city: null,
  state: null,
  country: null
)
```

