# WorldnetPayments::PaymentsApi

All URIs are relative to *https://testpayments.worldnettps.com/merchant*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**capture_payment**](PaymentsApi.md#capture_payment) | **PATCH** /api/v1/transaction/payments/{uniqueReference}/capture | Capture a Payment |
| [**get_payment**](PaymentsApi.md#get_payment) | **GET** /api/v1/transaction/payments/{uniqueReference} | Get a Payment |
| [**payment**](PaymentsApi.md#payment) | **POST** /api/v1/transaction/payments | Make a Payment |
| [**refund_payment**](PaymentsApi.md#refund_payment) | **POST** /api/v1/transaction/payments/{uniqueReference}/refunds | Refund a Payment |
| [**reverse_payment**](PaymentsApi.md#reverse_payment) | **PATCH** /api/v1/transaction/payments/{uniqueReference}/reverse | Reverse a Payment |
| [**update_payment**](PaymentsApi.md#update_payment) | **PATCH** /api/v1/transaction/payments/{uniqueReference} | Update a Payment |


## capture_payment

> <Payment> capture_payment(unique_reference, capture_payment_request)

Capture a Payment

Captures the amount of an existing (pre) authorization to make it available for settlement. It is possible to capture an amount that differs from the one previously authorized as long as the payment processor safe margin is respected.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::PaymentsApi.new
unique_reference = 'unique_reference_example' # String | Unique reference number assigned by the gateway.
capture_payment_request = WorldnetPayments::CapturePaymentRequest.new # CapturePaymentRequest | 

begin
  # Capture a Payment
  result = api_instance.capture_payment(unique_reference, capture_payment_request)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling PaymentsApi->capture_payment: #{e}"
end
```

#### Using the capture_payment_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Payment>, Integer, Hash)> capture_payment_with_http_info(unique_reference, capture_payment_request)

```ruby
begin
  # Capture a Payment
  data, status_code, headers = api_instance.capture_payment_with_http_info(unique_reference, capture_payment_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Payment>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling PaymentsApi->capture_payment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unique_reference** | **String** | Unique reference number assigned by the gateway. |  |
| **capture_payment_request** | [**CapturePaymentRequest**](CapturePaymentRequest.md) |  |  |

### Return type

[**Payment**](Payment.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_payment

> <Payment> get_payment(unique_reference)

Get a Payment

Retrieves the information about an existing payment.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::PaymentsApi.new
unique_reference = 'unique_reference_example' # String | Unique reference number assigned by the gateway.

begin
  # Get a Payment
  result = api_instance.get_payment(unique_reference)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling PaymentsApi->get_payment: #{e}"
end
```

#### Using the get_payment_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Payment>, Integer, Hash)> get_payment_with_http_info(unique_reference)

```ruby
begin
  # Get a Payment
  data, status_code, headers = api_instance.get_payment_with_http_info(unique_reference)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Payment>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling PaymentsApi->get_payment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unique_reference** | **String** | Unique reference number assigned by the gateway. |  |

### Return type

[**Payment**](Payment.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## payment

> <Payment> payment(payment_request)

Make a Payment

Processes online or offline authorizations and pre-authorizations over POS, eCommerce and MoTo channels.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::PaymentsApi.new
payment_request = WorldnetPayments::PaymentRequest.new({terminal: 'terminal_example', order: WorldnetPayments::Order.new({order_id: 'order_id_example', currency: 'AED', total_amount: 3.56})}) # PaymentRequest | 

begin
  # Make a Payment
  result = api_instance.payment(payment_request)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling PaymentsApi->payment: #{e}"
end
```

#### Using the payment_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Payment>, Integer, Hash)> payment_with_http_info(payment_request)

```ruby
begin
  # Make a Payment
  data, status_code, headers = api_instance.payment_with_http_info(payment_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Payment>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling PaymentsApi->payment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_request** | [**PaymentRequest**](PaymentRequest.md) |  |  |

### Return type

[**Payment**](Payment.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## refund_payment

> <Refund> refund_payment(unique_reference, refund_payment_request)

Refund a Payment

Returns the funds of an existing payment to the customer. Refunds can be performed on any authorized transaction in our platform, either in the Open Batch or Closed Batch. By default, you are allowed to refund any amount up to 100% of the original transaction amount. In order to prevent fraud, when multiple partial refunds are performed then the sum total of them cannot exceed 100% of the total authorized amount. The refund limit is configurable at a terminal level and if you wish to alter it please contact our support team with a reason why you need it altered.  **Note 1:** Keep in mind that this operation can also lead to a full or partial reversal of the transaction.<br />When trying to perform a refund against transactions that can be voided/reversed (e.g. unsettled payments), the gateway will run a reversal.  **Note 2:** If you need to issue a refund without referencing a previous transaction, please refer to the [Unreferenced Refund](#operation/unreferencedRefund) operation.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::PaymentsApi.new
unique_reference = 'unique_reference_example' # String | Unique reference number assigned by the gateway.
refund_payment_request = WorldnetPayments::RefundPaymentRequest.new({refund_amount: 3.56, refund_reason: 'refund_reason_example'}) # RefundPaymentRequest | 

begin
  # Refund a Payment
  result = api_instance.refund_payment(unique_reference, refund_payment_request)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling PaymentsApi->refund_payment: #{e}"
end
```

#### Using the refund_payment_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Refund>, Integer, Hash)> refund_payment_with_http_info(unique_reference, refund_payment_request)

```ruby
begin
  # Refund a Payment
  data, status_code, headers = api_instance.refund_payment_with_http_info(unique_reference, refund_payment_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Refund>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling PaymentsApi->refund_payment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unique_reference** | **String** | Unique reference number assigned by the gateway. |  |
| **refund_payment_request** | [**RefundPaymentRequest**](RefundPaymentRequest.md) |  |  |

### Return type

[**Refund**](Refund.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## reverse_payment

> <Payment> reverse_payment(unique_reference, opts)

Reverse a Payment

Performs the reversal/cancellation of an existing payment.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::PaymentsApi.new
unique_reference = 'unique_reference_example' # String | Unique reference number assigned by the gateway.
opts = {
  reverse_payment_request: WorldnetPayments::ReversePaymentRequest.new # ReversePaymentRequest | 
}

begin
  # Reverse a Payment
  result = api_instance.reverse_payment(unique_reference, opts)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling PaymentsApi->reverse_payment: #{e}"
end
```

#### Using the reverse_payment_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Payment>, Integer, Hash)> reverse_payment_with_http_info(unique_reference, opts)

```ruby
begin
  # Reverse a Payment
  data, status_code, headers = api_instance.reverse_payment_with_http_info(unique_reference, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Payment>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling PaymentsApi->reverse_payment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unique_reference** | **String** | Unique reference number assigned by the gateway. |  |
| **reverse_payment_request** | [**ReversePaymentRequest**](ReversePaymentRequest.md) |  | [optional] |

### Return type

[**Payment**](Payment.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_payment

> <Payment> update_payment(unique_reference, update_payment_request)

Update a Payment

Performs a partial update on the information of an existing payment. This operation allows you to update the operator, customer contact details and the transaction's status.<br />The status of a transaction can be updated as long as the change respect the following constraints:  CURRENT STATUS | TO READY | TO PENDING | TO DECLINED ---------------|:--------:|:----------:|:----------: **READY**      | NO       | YES        | NO          **PENDING**    | YES      | NO         | NO          **REFERRAL**   | YES      | YES        | NO          **REVIEW**     | YES      | YES        | YES        

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::PaymentsApi.new
unique_reference = 'unique_reference_example' # String | Unique reference number assigned by the gateway.
update_payment_request = WorldnetPayments::UpdatePaymentRequest.new # UpdatePaymentRequest | 

begin
  # Update a Payment
  result = api_instance.update_payment(unique_reference, update_payment_request)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling PaymentsApi->update_payment: #{e}"
end
```

#### Using the update_payment_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Payment>, Integer, Hash)> update_payment_with_http_info(unique_reference, update_payment_request)

```ruby
begin
  # Update a Payment
  data, status_code, headers = api_instance.update_payment_with_http_info(unique_reference, update_payment_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Payment>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling PaymentsApi->update_payment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unique_reference** | **String** | Unique reference number assigned by the gateway. |  |
| **update_payment_request** | [**UpdatePaymentRequest**](UpdatePaymentRequest.md) |  |  |

### Return type

[**Payment**](Payment.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

