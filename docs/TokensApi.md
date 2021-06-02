# WorldnetPayments::TokensApi

All URIs are relative to *https://testpayments.worldnettps.com/merchant*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**authenticate**](TokensApi.md#authenticate) | **GET** /api/v1/account/authenticate | Authenticate |


## authenticate

> <AccessToken> authenticate(authorization)

Authenticate

Use this operation to exchange your `API Key` for a `JWT Token` that will give you access to the API.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = WorldnetPayments::TokensApi.new
authorization = 'Basic <Merchant API Key>' # String | 

begin
  # Authenticate
  result = api_instance.authenticate(authorization)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling TokensApi->authenticate: #{e}"
end
```

#### Using the authenticate_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AccessToken>, Integer, Hash)> authenticate_with_http_info(authorization)

```ruby
begin
  # Authenticate
  data, status_code, headers = api_instance.authenticate_with_http_info(authorization)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AccessToken>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling TokensApi->authenticate_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |

### Return type

[**AccessToken**](AccessToken.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

