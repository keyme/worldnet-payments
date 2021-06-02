# WorldnetPayments::RefundsApi

All URIs are relative to *https://testpayments.worldnettps.com/merchant*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_refund**](RefundsApi.md#get_refund) | **GET** /api/v1/transaction/refunds/{uniqueReference} | Get a Refund |
| [**reverse_refund**](RefundsApi.md#reverse_refund) | **PATCH** /api/v1/transaction/refunds/{uniqueReference}/reverse | Reverse a Refund |
| [**unreferenced_refund**](RefundsApi.md#unreferenced_refund) | **POST** /api/v1/transaction/refunds | Unreferenced Refund |
| [**update_refund**](RefundsApi.md#update_refund) | **PATCH** /api/v1/transaction/refunds/{uniqueReference} | Update a Refund |


## get_refund

> <Refund> get_refund(unique_reference)

Get a Refund

Retrieves the information about an existing referenced or unreferenced refund.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::RefundsApi.new
unique_reference = 'unique_reference_example' # String | Unique reference number assigned by the gateway.

begin
  # Get a Refund
  result = api_instance.get_refund(unique_reference)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling RefundsApi->get_refund: #{e}"
end
```

#### Using the get_refund_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Refund>, Integer, Hash)> get_refund_with_http_info(unique_reference)

```ruby
begin
  # Get a Refund
  data, status_code, headers = api_instance.get_refund_with_http_info(unique_reference)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Refund>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling RefundsApi->get_refund_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unique_reference** | **String** | Unique reference number assigned by the gateway. |  |

### Return type

[**Refund**](Refund.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## reverse_refund

> <Refund> reverse_refund(unique_reference)

Reverse a Refund

Performs the reversal/cancellation of an existing refund.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::RefundsApi.new
unique_reference = 'unique_reference_example' # String | Unique reference number assigned by the gateway.

begin
  # Reverse a Refund
  result = api_instance.reverse_refund(unique_reference)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling RefundsApi->reverse_refund: #{e}"
end
```

#### Using the reverse_refund_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Refund>, Integer, Hash)> reverse_refund_with_http_info(unique_reference)

```ruby
begin
  # Reverse a Refund
  data, status_code, headers = api_instance.reverse_refund_with_http_info(unique_reference)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Refund>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling RefundsApi->reverse_refund_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unique_reference** | **String** | Unique reference number assigned by the gateway. |  |

### Return type

[**Refund**](Refund.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## unreferenced_refund

> <Refund> unreferenced_refund(refund_request)

Unreferenced Refund

Unreferenced refunds are refunds that do not require a payment transaction to be referenced.<br />They are only available on certain accounts upon request to our support team and must also be approved by your Acquiring (merchant) bank.<br />As an Unreferenced Refund does not refer to a payment transaction, merchants need to provide the card or account to which the refunded amount must be transferred.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::RefundsApi.new
refund_request = WorldnetPayments::RefundRequest.new({terminal: 'terminal_example', order_id: 'order_id_example', currency: 'AED', refund_amount: 3.56, refund_reason: 'refund_reason_example'}) # RefundRequest | 

begin
  # Unreferenced Refund
  result = api_instance.unreferenced_refund(refund_request)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling RefundsApi->unreferenced_refund: #{e}"
end
```

#### Using the unreferenced_refund_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Refund>, Integer, Hash)> unreferenced_refund_with_http_info(refund_request)

```ruby
begin
  # Unreferenced Refund
  data, status_code, headers = api_instance.unreferenced_refund_with_http_info(refund_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Refund>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling RefundsApi->unreferenced_refund_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **refund_request** | [**RefundRequest**](RefundRequest.md) |  |  |

### Return type

[**Refund**](Refund.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_refund

> <Refund> update_refund(unique_reference, update_refund_request)

Update a Refund

Performs a partial update on the information of an existing refund. This operation allows you to update the operator, customer contact details and the transaction's status.<br />The status of a transaction can be updated as long as the change respect the following constraints:  CURRENT STATUS | TO READY | TO PENDING | TO DECLINED ---------------|:--------:|:----------:|:----------: **READY**      | NO       | YES        | NO          **PENDING**    | YES      | NO         | NO          **REFERRAL**   | YES      | YES        | NO          **REVIEW**     | YES      | YES        | YES        

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::RefundsApi.new
unique_reference = 'unique_reference_example' # String | Unique reference number assigned by the gateway.
update_refund_request = WorldnetPayments::UpdateRefundRequest.new # UpdateRefundRequest | 

begin
  # Update a Refund
  result = api_instance.update_refund(unique_reference, update_refund_request)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling RefundsApi->update_refund: #{e}"
end
```

#### Using the update_refund_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Refund>, Integer, Hash)> update_refund_with_http_info(unique_reference, update_refund_request)

```ruby
begin
  # Update a Refund
  data, status_code, headers = api_instance.update_refund_with_http_info(unique_reference, update_refund_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Refund>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling RefundsApi->update_refund_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unique_reference** | **String** | Unique reference number assigned by the gateway. |  |
| **update_refund_request** | [**UpdateRefundRequest**](UpdateRefundRequest.md) |  |  |

### Return type

[**Refund**](Refund.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

