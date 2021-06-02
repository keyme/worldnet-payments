# WorldnetPayments::SecureCredentials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **terminal** | **String** | The terminal which is the credentials&#39; owner. It means that even though the credentials can be shared to perform transactions, update and delete operations can only be requested by owners. |  |
| **merchant_reference** | **String** | Unique merchant reference that identifies the stored credentials on both merchant&#39;s and gateway&#39;s sides.  **Note:** Clients must be able to store this value in order to eventually retrieve, update and delete the stored credentials. |  |
| **credentials_number** | **String** | The unique number that should be used to identify the credentials when performing transactions.&lt;br /&gt;This token is assigned by the gateway and follows the same format of regular card numbers:  - A six-digit identification number which is &#x60;296753&#x60;. - A variable length (up to 12 digits) individual identifier. - A single check digit calculated using the Luhn algorithm. |  |
| **masked_pan** | **String** | The number of the tokenized card/account masked as per PCI requirements. |  |
| **security_check** | **String** | The result of the security checks performed via account verification to determine if the account is valid and in good standing. Depending on the Payment Processor used by the Terminal, the account verification can be performed in two distinct ways:  - A 0.00 (zero) amount transaction or, - A 1.00 (one) currency unit amount transaction followed, when successful, by its voiding (both transactions will appear in your batch).  **Note:** If the account verification fails, the payment credentials are not stored. | [optional] |
| **additional_data_fields** | [**Array&lt;CustomField&gt;**](CustomField.md) | List of custom fields representing the additional information sent by the merchant and stored along with the credentials. | [optional] |
| **links** | [**Array&lt;HypermediaLink&gt;**](HypermediaLink.md) | List of hypermedia links containing the operations available for the resource. | [optional] |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::SecureCredentials.new(
  terminal: null,
  merchant_reference: null,
  credentials_number: null,
  masked_pan: null,
  security_check: null,
  additional_data_fields: null,
  links: null
)
```

