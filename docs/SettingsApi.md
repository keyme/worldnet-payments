# WorldnetPayments::SettingsApi

All URIs are relative to *https://testpayments.worldnettps.com/merchant*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**end_of_day**](SettingsApi.md#end_of_day) | **PATCH** /api/v1/account/terminals/{terminalNumber}/endOfDay | End Of Day |
| [**list_device_types**](SettingsApi.md#list_device_types) | **GET** /api/v1/account/terminals/{terminalNumber}/devices | List POS Device Types |
| [**list_terminals**](SettingsApi.md#list_terminals) | **GET** /api/v1/account/terminals | List Terminals |
| [**load_device_type**](SettingsApi.md#load_device_type) | **GET** /api/v1/account/terminals/{terminalNumber}/devices/{type} | Load POS Device Type |
| [**load_terminal**](SettingsApi.md#load_terminal) | **GET** /api/v1/account/terminals/{terminalNumber} | Load Terminal |
| [**update_terminal**](SettingsApi.md#update_terminal) | **PATCH** /api/v1/account/terminals/{terminalNumber} | Update Terminal |


## end_of_day

> <Terminal> end_of_day(terminal_number)

End Of Day

For terminals in manual settle mode, this operation must be used to indicate the end-of-day closing so that clearing and settlement processes can take place.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::SettingsApi.new
terminal_number = 'terminal_number_example' # String | Unique number assigned by the gateway.

begin
  # End Of Day
  result = api_instance.end_of_day(terminal_number)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling SettingsApi->end_of_day: #{e}"
end
```

#### Using the end_of_day_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Terminal>, Integer, Hash)> end_of_day_with_http_info(terminal_number)

```ruby
begin
  # End Of Day
  data, status_code, headers = api_instance.end_of_day_with_http_info(terminal_number)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Terminal>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling SettingsApi->end_of_day_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **terminal_number** | **String** | Unique number assigned by the gateway. |  |

### Return type

[**Terminal**](Terminal.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_device_types

> <DevicePaginatedResult> list_device_types(terminal_number, opts)

List POS Device Types

Returns a paginated list of basic information about the POS device types supported by the terminal. Use the `load` hypermedia link to retrieve the complete information about a POS device type.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::SettingsApi.new
terminal_number = 'terminal_number_example' # String | Unique number assigned by the gateway.
opts = {
  page_size: 56, # Integer | The max number of elements per page.
  _next: '_next_example' # String | The cursor pointing to the next set of elements. You can either use the value returned in the response or the hypermedia link to retrieve the next page of your search.
}

begin
  # List POS Device Types
  result = api_instance.list_device_types(terminal_number, opts)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling SettingsApi->list_device_types: #{e}"
end
```

#### Using the list_device_types_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DevicePaginatedResult>, Integer, Hash)> list_device_types_with_http_info(terminal_number, opts)

```ruby
begin
  # List POS Device Types
  data, status_code, headers = api_instance.list_device_types_with_http_info(terminal_number, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DevicePaginatedResult>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling SettingsApi->list_device_types_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **terminal_number** | **String** | Unique number assigned by the gateway. |  |
| **page_size** | **Integer** | The max number of elements per page. | [optional][default to 10] |
| **_next** | **String** | The cursor pointing to the next set of elements. You can either use the value returned in the response or the hypermedia link to retrieve the next page of your search. | [optional] |

### Return type

[**DevicePaginatedResult**](DevicePaginatedResult.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_terminals

> <TerminalPaginatedResult> list_terminals(opts)

List Terminals

Returns a paginated list of basic information about the terminals assigned to the access token via API Key. Use the `load` hypermedia link to retrieve the full configuration of a terminal.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::SettingsApi.new
opts = {
  page_size: 56, # Integer | The max number of elements per page.
  _next: '_next_example' # String | The cursor pointing to the next set of elements. You can either use the value returned in the response or the hypermedia link to retrieve the next page of your search.
}

begin
  # List Terminals
  result = api_instance.list_terminals(opts)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling SettingsApi->list_terminals: #{e}"
end
```

#### Using the list_terminals_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TerminalPaginatedResult>, Integer, Hash)> list_terminals_with_http_info(opts)

```ruby
begin
  # List Terminals
  data, status_code, headers = api_instance.list_terminals_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TerminalPaginatedResult>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling SettingsApi->list_terminals_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **page_size** | **Integer** | The max number of elements per page. | [optional][default to 10] |
| **_next** | **String** | The cursor pointing to the next set of elements. You can either use the value returned in the response or the hypermedia link to retrieve the next page of your search. | [optional] |

### Return type

[**TerminalPaginatedResult**](TerminalPaginatedResult.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## load_device_type

> <DeviceType> load_device_type(terminal_number, type, opts)

Load POS Device Type

Loads the full details about the device's configuration. Supply the type of one of the devices returned by the list operation.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::SettingsApi.new
terminal_number = 'terminal_number_example' # String | Unique number assigned by the gateway.
type = 'type_example' # String | Type/Model of the point-of-sale terminal.
opts = {
  x_pos_device_firmware_version: 'x_pos_device_firmware_version_example' # String | Firmware version of the point-of-sale terminal.
}

begin
  # Load POS Device Type
  result = api_instance.load_device_type(terminal_number, type, opts)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling SettingsApi->load_device_type: #{e}"
end
```

#### Using the load_device_type_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DeviceType>, Integer, Hash)> load_device_type_with_http_info(terminal_number, type, opts)

```ruby
begin
  # Load POS Device Type
  data, status_code, headers = api_instance.load_device_type_with_http_info(terminal_number, type, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DeviceType>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling SettingsApi->load_device_type_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **terminal_number** | **String** | Unique number assigned by the gateway. |  |
| **type** | **String** | Type/Model of the point-of-sale terminal. |  |
| **x_pos_device_firmware_version** | **String** | Firmware version of the point-of-sale terminal. | [optional] |

### Return type

[**DeviceType**](DeviceType.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## load_terminal

> <Terminal> load_terminal(terminal_number)

Load Terminal

Loads the full details about the terminal's configuration. Supply the number of one of the terminals returned by the list operation.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::SettingsApi.new
terminal_number = 'terminal_number_example' # String | Unique number assigned by the gateway.

begin
  # Load Terminal
  result = api_instance.load_terminal(terminal_number)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling SettingsApi->load_terminal: #{e}"
end
```

#### Using the load_terminal_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Terminal>, Integer, Hash)> load_terminal_with_http_info(terminal_number)

```ruby
begin
  # Load Terminal
  data, status_code, headers = api_instance.load_terminal_with_http_info(terminal_number)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Terminal>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling SettingsApi->load_terminal_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **terminal_number** | **String** | Unique number assigned by the gateway. |  |

### Return type

[**Terminal**](Terminal.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_terminal

> <Terminal> update_terminal(terminal_number, update_terminal_request)

Update Terminal

Partially updates the configuration of a terminal. Currently, it is only possible to update tips and taxes.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::SettingsApi.new
terminal_number = 'terminal_number_example' # String | Unique number assigned by the gateway.
update_terminal_request = WorldnetPayments::UpdateTerminalRequest.new # UpdateTerminalRequest | 

begin
  # Update Terminal
  result = api_instance.update_terminal(terminal_number, update_terminal_request)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling SettingsApi->update_terminal: #{e}"
end
```

#### Using the update_terminal_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Terminal>, Integer, Hash)> update_terminal_with_http_info(terminal_number, update_terminal_request)

```ruby
begin
  # Update Terminal
  data, status_code, headers = api_instance.update_terminal_with_http_info(terminal_number, update_terminal_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Terminal>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling SettingsApi->update_terminal_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **terminal_number** | **String** | Unique number assigned by the gateway. |  |
| **update_terminal_request** | [**UpdateTerminalRequest**](UpdateTerminalRequest.md) |  |  |

### Return type

[**Terminal**](Terminal.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

