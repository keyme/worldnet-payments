# WorldnetPayments::TransactionsApi

All URIs are relative to *https://testpayments.worldnettps.com/merchant*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**search_transactions**](TransactionsApi.md#search_transactions) | **GET** /api/v1/transaction/transactions | Search Transactions |


## search_transactions

> <TransactionPaginatedResult> search_transactions(terminal, opts)

Search Transactions

Search for payments and refunds within a certain period. You can narrow down the results by using any combination of the available filters.

### Examples

```ruby
require 'time'
require 'worldnet_payments'
# setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::TransactionsApi.new
terminal = 'terminal_example' # String | Search for transactions performed by a specific terminal.
opts = {
  after_date: Time.parse('2013-10-20T19:20:30+01:00'), # Time | The start date of the search period represented as per [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) standard.
  before_date: Time.parse('2013-10-20T19:20:30+01:00'), # Time | The end date of the search period represented as per [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) standard.
  batch_type: 'OPEN', # String | Indicates where the search should take place:  - **OPEN:** Search for transactions sitting in the open batch, i.e. transactions waiting to be settled. - **CLOSED:** Search for transactions in one of the terminal's closed batches, i.e. settled transactions.  Do not use this filter if you want to search both batches in one go.
  settlement_date: Date.parse('2013-10-20'), # Date | Search transactions by the date on which they were settled.<br />This filter is not compatible with the value **OPEN** of the `batchType` filter as only the terminal's closed batches will get searched.
  resource_type: 'PAYMENT', # String | This field is optional and should only be used when consumers want to search either payments or refunds, but not both.
  order_id: 'order_id_example', # String | Search transactions by specific order identifiers.
  unique_reference: 'unique_reference_example', # String | Search transactions by their unique reference.
  operator: 'operator_example', # String | Search by the operator that initiated the transactions.
  customer_name: 'customer_name_example', # String | Search transactions by their cardholder name.
  pan_first_six: 'pan_first_six_example', # String | Search by the first six digits of the primary account number (PAN).
  pan_last_four: 'pan_last_four_example', # String | Search by the last four digits of the primary account number (PAN).
  status_group: 'APPROVAL', # String | Search transactions by their status by using the status groups below:  - **APPROVAL:** Encompasses `PENDING`, `READY` and `COMPLETE` statuses. - **REVERSAL:** Encompasses `VOID` and `REVERSAL` statuses. - **ACCEPTED:** Refers to `IN_PROGRESS` status only. - **DECLINED:** Refers to `DECLINED` status only. - **REFERRAL:** Refers to `REFERRAL` status only. 
  page_size: 56, # Integer | The max number of elements per page.
  _next: '_next_example' # String | The cursor pointing to the next set of elements. You can either use the value returned in the response or the hypermedia link to retrieve the next page of your search.
}

begin
  # Search Transactions
  result = api_instance.search_transactions(terminal, opts)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Error when calling TransactionsApi->search_transactions: #{e}"
end
```

#### Using the search_transactions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TransactionPaginatedResult>, Integer, Hash)> search_transactions_with_http_info(terminal, opts)

```ruby
begin
  # Search Transactions
  data, status_code, headers = api_instance.search_transactions_with_http_info(terminal, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TransactionPaginatedResult>
rescue WorldnetPayments::ApiError => e
  puts "Error when calling TransactionsApi->search_transactions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **terminal** | **String** | Search for transactions performed by a specific terminal. |  |
| **after_date** | **Time** | The start date of the search period represented as per [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) standard. | [optional] |
| **before_date** | **Time** | The end date of the search period represented as per [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) standard. | [optional] |
| **batch_type** | **String** | Indicates where the search should take place:  - **OPEN:** Search for transactions sitting in the open batch, i.e. transactions waiting to be settled. - **CLOSED:** Search for transactions in one of the terminal&#39;s closed batches, i.e. settled transactions.  Do not use this filter if you want to search both batches in one go. | [optional] |
| **settlement_date** | **Date** | Search transactions by the date on which they were settled.&lt;br /&gt;This filter is not compatible with the value **OPEN** of the &#x60;batchType&#x60; filter as only the terminal&#39;s closed batches will get searched. | [optional] |
| **resource_type** | **String** | This field is optional and should only be used when consumers want to search either payments or refunds, but not both. | [optional] |
| **order_id** | **String** | Search transactions by specific order identifiers. | [optional] |
| **unique_reference** | **String** | Search transactions by their unique reference. | [optional] |
| **operator** | **String** | Search by the operator that initiated the transactions. | [optional] |
| **customer_name** | **String** | Search transactions by their cardholder name. | [optional] |
| **pan_first_six** | **String** | Search by the first six digits of the primary account number (PAN). | [optional] |
| **pan_last_four** | **String** | Search by the last four digits of the primary account number (PAN). | [optional] |
| **status_group** | **String** | Search transactions by their status by using the status groups below:  - **APPROVAL:** Encompasses &#x60;PENDING&#x60;, &#x60;READY&#x60; and &#x60;COMPLETE&#x60; statuses. - **REVERSAL:** Encompasses &#x60;VOID&#x60; and &#x60;REVERSAL&#x60; statuses. - **ACCEPTED:** Refers to &#x60;IN_PROGRESS&#x60; status only. - **DECLINED:** Refers to &#x60;DECLINED&#x60; status only. - **REFERRAL:** Refers to &#x60;REFERRAL&#x60; status only.  | [optional] |
| **page_size** | **Integer** | The max number of elements per page. | [optional][default to 10] |
| **_next** | **String** | The cursor pointing to the next set of elements. You can either use the value returned in the response or the hypermedia link to retrieve the next page of your search. | [optional] |

### Return type

[**TransactionPaginatedResult**](TransactionPaginatedResult.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

