# WorldnetPayments::CredentialsApi

All URIs are relative to *https://testpayments.worldnettps.com/merchant*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_credentials**](CredentialsApi.md#delete_credentials) | **DELETE** /api/v1/customer/credentials/{merchantReference} | Delete Credentials |
| [**get_credentials**](CredentialsApi.md#get_credentials) | **GET** /api/v1/customer/credentials/{merchantReference} | Get Credentials |
| [**search_credential_transactions**](CredentialsApi.md#search_credential_transactions) | **POST** /api/v1/customer/credentials/transactions | Search Latest Transactions |
| [**store_credentials**](CredentialsApi.md#store_credentials) | **POST** /api/v1/customer/credentials | Store Credentials |
| [**update_credentials**](CredentialsApi.md#update_credentials) | **PATCH** /api/v1/customer/credentials/{merchantReference} | Update Credentials |


## delete_credentials

> delete_credentials(terminal, merchant_reference)

Delete Credentials

Performs a logical removal of existing secure credentials.<br />It is important to mention that `Merchant References` of deleted credentials cannot be reused.<br />This is because they are tied to existing transactions in our system and are retained internally for data integrity and future refund functionality.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::CredentialsApi.new
terminal = 'terminal_example' # String | Unique number assigned by the gateway.
merchant_reference = 'merchant_reference_example' # String | Unique merchant reference that identifies the stored credentials on both merchant's and gateway's sides.

begin
  # Delete Credentials
  api_instance.delete_credentials(terminal, merchant_reference)
rescue WorldnetPayments::ApiError => e
  puts "Error when calling CredentialsApi->delete_credentials: #{e}"
end
```

#### Using the delete_credentials_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_credentials_with_http_info(terminal, merchant_reference)

```ruby
begin
  # Delete Credentials
  data, status_code, headers = api_instance.delete_credentials_with_http_info(terminal, merchant_reference)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue WorldnetPayments::ApiError => e
  puts "Error when calling CredentialsApi->delete_credentials_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **terminal** | **String** | Unique number assigned by the gateway. |  |
| **merchant_reference** | **String** | Unique merchant reference that identifies the stored credentials on both merchant&#39;s and gateway&#39;s sides. |  |

### Return type

nil (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_credentials

> <SecureCredentials> get_credentials(terminal, merchant_reference)

Get Credentials

Retrieves the information about previously stored secure credentials.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::CredentialsApi.new
terminal = 'terminal_example' # String | Unique number assigned by the gateway.
merchant_reference = 'merchant_reference_example' # String | Unique merchant reference that identifies the stored credentials on both merchant's and gateway's sides.

begin
  # Get Credentials
  result = api_instance.get_credentials(terminal, merchant_reference)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling CredentialsApi->get_credentials: #{e}"
end
```

#### Using the get_credentials_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SecureCredentials>, Integer, Hash)> get_credentials_with_http_info(terminal, merchant_reference)

```ruby
begin
  # Get Credentials
  data, status_code, headers = api_instance.get_credentials_with_http_info(terminal, merchant_reference)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SecureCredentials>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling CredentialsApi->get_credentials_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **terminal** | **String** | Unique number assigned by the gateway. |  |
| **merchant_reference** | **String** | Unique merchant reference that identifies the stored credentials on both merchant&#39;s and gateway&#39;s sides. |  |

### Return type

[**SecureCredentials**](SecureCredentials.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_credential_transactions

> <TransactionPaginatedResult> search_credential_transactions(search_credential_transactions_request, opts)

Search Latest Transactions

Retrieves the history of transactions for a credential in the scope of a Merchant Portfolio.  **Note:** Only `MAG_STRIP` and `EMV` payloads are supported at the moment.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::CredentialsApi.new
search_credential_transactions_request = WorldnetPayments::SearchCredentialTransactionsRequest.new({terminal: 'terminal_example', customer_account: WorldnetPayments::Payload.new({payload_type: 'payload_type_example'})}) # SearchCredentialTransactionsRequest | 
opts = {
  page_size: 56, # Integer | The max number of elements per page.
  _next: '_next_example' # String | The cursor pointing to the next set of elements. You can either use the value returned in the response or the hypermedia link to retrieve the next page of your search.
}

begin
  # Search Latest Transactions
  result = api_instance.search_credential_transactions(search_credential_transactions_request, opts)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling CredentialsApi->search_credential_transactions: #{e}"
end
```

#### Using the search_credential_transactions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TransactionPaginatedResult>, Integer, Hash)> search_credential_transactions_with_http_info(search_credential_transactions_request, opts)

```ruby
begin
  # Search Latest Transactions
  data, status_code, headers = api_instance.search_credential_transactions_with_http_info(search_credential_transactions_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TransactionPaginatedResult>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling CredentialsApi->search_credential_transactions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **search_credential_transactions_request** | [**SearchCredentialTransactionsRequest**](SearchCredentialTransactionsRequest.md) |  |  |
| **page_size** | **Integer** | The max number of elements per page. | [optional][default to 10] |
| **_next** | **String** | The cursor pointing to the next set of elements. You can either use the value returned in the response or the hypermedia link to retrieve the next page of your search. | [optional] |

### Return type

[**TransactionPaginatedResult**](TransactionPaginatedResult.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## store_credentials

> <SecureCredentials> store_credentials(store_credentials_request)

Store Credentials

Stores payment credentials of a customer for future use.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::CredentialsApi.new
store_credentials_request = WorldnetPayments::StoreCredentialsRequest.new({terminal: 'terminal_example', customer_account: WorldnetPayments::Payload.new({payload_type: 'payload_type_example'})}) # StoreCredentialsRequest | 

begin
  # Store Credentials
  result = api_instance.store_credentials(store_credentials_request)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling CredentialsApi->store_credentials: #{e}"
end
```

#### Using the store_credentials_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SecureCredentials>, Integer, Hash)> store_credentials_with_http_info(store_credentials_request)

```ruby
begin
  # Store Credentials
  data, status_code, headers = api_instance.store_credentials_with_http_info(store_credentials_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SecureCredentials>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling CredentialsApi->store_credentials_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **store_credentials_request** | [**StoreCredentialsRequest**](StoreCredentialsRequest.md) |  |  |

### Return type

[**SecureCredentials**](SecureCredentials.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_credentials

> <SecureCredentials> update_credentials(merchant_reference, update_credentials_request)

Update Credentials

Performs a partial update on the information of existing secure credentials.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::CredentialsApi.new
merchant_reference = 'merchant_reference_example' # String | Unique merchant reference that identifies the stored credentials on both merchant's and gateway's sides.
update_credentials_request = WorldnetPayments::UpdateCredentialsRequest.new({terminal: 'terminal_example'}) # UpdateCredentialsRequest | 

begin
  # Update Credentials
  result = api_instance.update_credentials(merchant_reference, update_credentials_request)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling CredentialsApi->update_credentials: #{e}"
end
```

#### Using the update_credentials_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SecureCredentials>, Integer, Hash)> update_credentials_with_http_info(merchant_reference, update_credentials_request)

```ruby
begin
  # Update Credentials
  data, status_code, headers = api_instance.update_credentials_with_http_info(merchant_reference, update_credentials_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SecureCredentials>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling CredentialsApi->update_credentials_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_reference** | **String** | Unique merchant reference that identifies the stored credentials on both merchant&#39;s and gateway&#39;s sides. |  |
| **update_credentials_request** | [**UpdateCredentialsRequest**](UpdateCredentialsRequest.md) |  |  |

### Return type

[**SecureCredentials**](SecureCredentials.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

