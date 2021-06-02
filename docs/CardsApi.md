# WorldnetPayments::CardsApi

All URIs are relative to *https://testpayments.worldnettps.com/merchant*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**balance_inquiry**](CardsApi.md#balance_inquiry) | **POST** /api/v1/customer/cards/balance | Balance Inquiry |


## balance_inquiry

> <Balance> balance_inquiry(balance_inquiry_request)

Balance Inquiry

This feature allows merchants to perform balance inquiries for their customers right at the point of sale.  **Note:** Currently, we only support balance checks for Electronic Benefits Transfer (EBT) Cards.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::CardsApi.new
balance_inquiry_request = WorldnetPayments::BalanceInquiryRequest.new({terminal: 'terminal_example', currency: 'AED', customer_account: WorldnetPayments::Payload.new({payload_type: 'payload_type_example'})}) # BalanceInquiryRequest | 

begin
  # Balance Inquiry
  result = api_instance.balance_inquiry(balance_inquiry_request)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling CardsApi->balance_inquiry: #{e}"
end
```

#### Using the balance_inquiry_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Balance>, Integer, Hash)> balance_inquiry_with_http_info(balance_inquiry_request)

```ruby
begin
  # Balance Inquiry
  data, status_code, headers = api_instance.balance_inquiry_with_http_info(balance_inquiry_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Balance>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling CardsApi->balance_inquiry_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **balance_inquiry_request** | [**BalanceInquiryRequest**](BalanceInquiryRequest.md) |  |  |

### Return type

[**Balance**](Balance.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

