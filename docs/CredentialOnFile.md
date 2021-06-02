# WorldnetPayments::CredentialOnFile

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tokenize** | **Boolean** | Set this flag if you want to store the customer&#39;s payment details using our _Secure Credentials_ tokenization mechanism. |  |
| **merchant_reference** | **String** | Unique merchant reference that identifies the stored credentials on both merchant&#39;s and gateway&#39;s sides.&lt;br /&gt;If not provided when tokenizing the payment details, we will assign an auto-generated value to the credentials and returns it in the response. | [optional] |
| **usage_agreement** | **String** | It has been a Card Scheme requirement since 14th October 2017 that you must establish an agreement with a new customer before storing their card details for future standing Merchant Initiated Transactions (MITs).  - **UNSCHEDULED**: Transactions that are for a fixed or variable amount that don’t occur on a scheduled or regularly occurring transaction date, but when a pre-defined event happens. - **RECURRING**: Transactions that are processed on a regular fixed interval for a pre agreed or advised amount, where applicable. Recurring transactions don’t have a fixed duration and will continue to be processed until the cardholder cancels the agreement. - **INSTALLMENT**: Transactions that are processed on a regular fixed interval for a pre agreed amount for a single purchase of good or services. Unlike recurring transactions, they do have a fixed duration and must not continue to be processed after the end of the agreed instalment period  | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::CredentialOnFile.new(
  tokenize: null,
  merchant_reference: null,
  usage_agreement: null
)
```

