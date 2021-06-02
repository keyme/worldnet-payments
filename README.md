# worldnet_payments

WorldnetPayments - the Ruby gem for the Merchant API

# Introduction
The Merchant API enables you to connect seamlessly and securely to our [Omni-Channel Payments Platform](https://www.worldnetpayments.com/).

Our APIs are built around [REST](https://en.wikipedia.org/wiki/Representational_state_transfer) principles and [OpenAPI Specification](https://www.openapis.org/) definitions.
Complying to such industry standards means that we can offer developers a much better experience by exposing predictable resource-oriented URL's as well as a comprehensive range of HTTP response codes and verbs.
Moreover, you have the possibility to enable and take full advantage of [HATEOAS](https://en.wikipedia.org/wiki/HATEOAS) controls to provide out-of-the-box `Discoverability` and `Functional-Awareness` for your integrations.

Get started on building full-featured payment applications and join us in the Revolution of Intelligent Retail.

# Authentication
The Merchant API uses a combination of API Keys and [Java Web Tokens (JWT)](https://jwt.io/) to authenticate requests.
API Key's hold all the necessary information for issuing JWT access tokens which in turn are required to access protected resources and operations.
Therefore, before you can start making any calls, you must generate an API Key and use it to obtain access tokens.

Please, make yourself familiar with the following security schemes before proceeding:
<!-- ReDoc-Inject: <security-definitions> -->
## Generating an API Key
The API supports two levels of authentication. Our consumers can either authenticate on a merchant level and have their API Keys limited to the scope of a specific merchant or, if you are one of our ISV (Independent Software Vendor) partners, you can have only one API Key for a whole integration which may consist of more than one merchant.

Although it is handy for ISVs to have one key that can authenticate in multiple merchant accounts, they can still use merchant-level authentication if they want to have more control and keep their merchant authentication separate.
In this case, the gateway will require an extra header called `X-Integration-ID` - containing the integration's identifier - to be sent in every request.

**How to generate Merchant-Level API Keys?**

1. [Log into the SelfCare System](https://testpayments.worldnettps.com/merchant/selfcare) with the credentials you received in the welcome email.
2. Under *Settings*, navigate to *API Keys*, and then click the `NEW API KEY` button.
4. Enter an alias and set the permission modes for each Sub-API.
5. Select the terminals that you want the API Key to be allowed to operate.
6. Back on the list, choose the action `View Authentication Key` to be able to see your Key's authentication token.

**How to generate Integration-Level API Keys?**

ISV integrations are managed by our support and integration teams. Our team will be happy to create your API Key when requested.<br />
Once created, the authentication token is sent by email in an encrypted file and our team will guide you on how to access its content.

Note: Since ISV developers are not able to create their own keys, we recommend Merchant-Level authentication during integration and test phases as a way to speed up development and avoid the overhead of contacting members of the support team.

## Obtaining an Access Token
In order to obtain an access token you must use the [authenticate](#operation/authenticate) operation passing your API Key in the `HTTP Authorization` header with `Basic` authentication scheme.

In the snippet below we show how to achieve that using [cURL](https://github.com/curl/curl). However, if you are not familiar with command line tools we recommend [Postman](https://www.getpostman.com/).

```
curl https://testpayments.worldnettps.com/merchant/api/v1/account/authenticate \\
  -H \"Authorization: Basic <Merchant API Key>\"
```

For every successful request you should receive a response just like the one below containing the information associated with your credentials, such as hours to expiry and privileges.
Include the JWT Token from the `token` property in the `Authorization` header with `Bearer` authentication scheme for following requests to prove your identity and access protected resources.

```
{
    \"audience\": \"testpayments.worldnettps.com\",
    \"boundTo\": \"My API Key\",
    \"tokenType\": \"Bearer\",
    \"token\": \"<JWT Access Token>\",
    \"expiresIn\": 1,
    \"enableHypermedia\": true,
    \"roles\": [],
    \"allowedTerminals\": []
}
```

For security reasons, access tokens expire after a certain amount of time.
Therefore, your application must implement a mechanism to keep track of the `expiresIn` property which is the number of hours the token is valid for.

**Note:** The lifespan of a token must not be hard-coded on the client-side as the value of `expiresIn` property is subject to change without prior notice.

## Making Authenticated Calls
Apart from the [authenticate](#operation/authenticate) operation, the entire API requires `Bearer` authentication scheme and expects a valid JWT token as proof of identity.
The [cURL](https://github.com/curl/curl) snippet below is an example of how to use your access token, in this specific case, to request the list of available terminals in your account.

```
curl https://testpayments.worldnettps.com/merchant/api/v1/account/terminals?pageSize=10 \\
  -H \"Content-Type: application/json\" \\
  -H \"Authorization: Bearer <JWT Token>\"
```

**Note:** The API will issue a response with status `401 Unauthorized` for requests carrying an expired JWT.

# API Requests
We provide developers looking to integrate with our solutions with a full-featured **Sandbox**.

- Sandbox URL: https://testpayments.worldnettps.com/merchant/

In order to perform actions on the API's resources you must combine your requests with the proper [HTTP Request Method](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods).

The Merchant API supports the following HTTP Methods which are sometimes referred as *HTTP Verbs*:

HTTP Method  | Description
------------ | -------------
[GET](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/GET) | It requests a representation of the specified resource. Requests using `GET` are read-only.
[POST](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) | It is used to submit an entity to the specified resource, often causing a change in state on the server.
[PATCH](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PATCH) | It is used to apply partial modifications to a resource.
[DELETE](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/DELETE) | It deletes / cancels / reverts the specified resource.

## Request Identifiers
The Merchant API assigns a unique identifier for every request that comes in. You can find your requests' identifiers either in the `X-Request-Id` header or in the Error field `debugIdentifier`.

Request ID's are part of an effort to speed troubleshooting by facilitating communication between clients and our support team.
Since we keep track of all request identifiers in our log files, you just need to inform the request's identifier when asking us to assist you with problems that might come up during your integrations.

## Customer Account Payloads

Client applications need to be able to send the customers' account details when generating payments, initiating unreferenced refunds and registering secure credentials. 
This information is expected in the form of payloads which varies based on the mechanism used to capture the account/card details.

For instance, when the card details are manually inputted, a `KEYED` payload is expected. However, an `EMV` payload is always expected for contact and contactless EMV transactions.
It is worth mentioning that the proper use of payloads also depend on the channel over which your terminal is operating. In the table below we show the supported payloads for each of the three available channels:

Channel                      | Supported Payloads
---------------------------- | -------------------------
WEB (eCommerce)              | `KEYED`, `SECURE_CREDENTIALS`, `DIGITAL_WALLET`
POS (Cardholder Present)     | `KEYED`, `EMV`, `RAW`, `MAG_STRIPE`
MOTO (Mail/Telephone Order)  | `KEYED`, `SECURE_CREDENTIALS`

## Request Headers
HTTP Header  | Description
------------ | -------------
[Accept](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept) | The response format expected by your application.<br />The Merchant API only produces `application/json` response format.
[Accept-Language](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Language) | It advertises which languages the client is able to understand, and which locale variant is preferred.<br />The Merchant API fully supports English `en` and French `fr` languages.
[Content-Type](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type) | The body format of the request your application is sending to the API.<br />The Merchant API only consumes `application/json` content type.
[Authorization](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Authorization) | It must contain the credentials (API Key or JWT Access Token) to authenticate your application.<br />The API will issue a `401 Unauthorized` response with the `WWW-Authenticate` header attached if your application fails to use this header properly.
[X-Integration-ID](#) | It should be sent in every call by ISV integrations that use Merchant-Level API Keys for authentication

## Partial Updates
Partial update requests are signaled with the HTTP method `PATCH`.
To perform partial updates, clients must specify only the properties that have changed.

**Note:** To clear the content of a property, supply an empty value.

## Testing Requests
Eventually it will be necessary to perform some transactions.
For resources such as testing credit cards and simulated responses, see [Testing Resources](https://docs.worldnettps.com/doku.php?id=developer:integration_docs:testing-guide#testing_resources).

# API Responses
Client applications must be able to handle JSON body format as well as a range of [HTTP status codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) when processing responses.
Some resources might also include contextual hypermedia links. We strongly recommend that clients use these links to request more information or perform additional actions on a given resource.

## HTTP Status Codes
The Merchant API has adopted a comprehensive range of status codes where `2XX` statuses are returned for successful requests and `4XX` or `5XX` for failed requests.

The full range of status codes supported by this API:

HTTP Status Code  | Description
----------------- | -------------
[200 OK](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/200) | Indicates that the request has succeeded.
[201 Created](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/201) | Indicates that the request has succeeded and has led to the creation of a resource.
[204 No Content](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/204) | Indicates that the server successfully executed the method but returns no response body.<br />This status is sent specifically to respond to `DELETE` requests.
[400 Bad Request](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/400) | Indicates that the server cannot or will not process the request due to malformed request syntax or schema violation.
[401 Unauthorized](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/401) | Indicates that the request has not been applied because it lacks valid authentication credentials.<br />This status is sent with a `WWW-Authenticate` header that contains information on how to authorize correctly.
[403 Forbidden](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | Indicates that the server understood the request but refuses to authorize it due to the lack of permissions.<br />Re-authenticating will make no difference until the proper permissions and terminals are added to the API Key.
[404 Not Found](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/404) | Indicates that the server cannot find the requested resource.
[405 Method Not Allowed](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/405) | Indicates that the request method is known by the server but is not supported by the target resource.
[406 Not Acceptable](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/406) | Indicates that the server cannot produce a response matching the value from `Accept` header.
[415 Unsupported Media Type](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/415) | Indicates that the server refuses to accept the request because the payload format described by the `Content-Type` is unsupported.
[422 Unprocessable Entity](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/422) | Indicates that the server understands the content type of the request entity, and the syntax of the request entity is correct, but it was unable to proceed due to semantic errors or failed business validations.
[500 Internal Server Error](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/500) | Indicates that the server encountered an unexpected condition that prevented it from fulfilling the request.
[501 Not Implemented](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/501) | Indicates that the server does not yet support the functionality required to fulfill the request, but might in the future.

## Error Handling
In the event of a failure, the Merchant API returns an error response body that includes additional details in the format below:

```
{
    \"debugIdentifier\": \"ae6d75eb-381b-4a01-9f49-fdff12e3848b\",
    \"details\": [
        {
            \"errorCode\": \"X_400_002\",
            \"errorMessage\": \"Unable to deserialize value\",
            \"source\": {
                \"location\": \"BODY\",
                \"resource\": \"TipType\",
                \"property\": \"type\",
                \"value\": \"VARIABLE\",
                \"expected\": \"Acceptable values: [PERCENTAGE, FIXED_AMOUNT]\"
            }
        }
    ]
}
```

Error messages are intended to help developers to fix any problems that may come up during integration.<br />However, if you ever have a hard time troubleshooting an issue or even wish to make a suggestion, do not hesitate to [contact us](https://worldnetpayments.com/contact/).
Do not forget to send us the `debugIdentifier` along with your inquiries.

## HATEOAS (Hypermedia Links)
[HATEOAS](https://en.wikipedia.org/wiki/HATEOAS) is a powerful mechanism when it comes to enabling self-discoverability, reducing invalid state transition calls and protecting your application against unexpected changes on resources URL's.

This snippet from a sample `payments` response shows the list of hypermedia controls that represent the operations available for the newly created payment resource.

```
\"links\": [
    {
        \"rel\": \"capture\",
        \"method\": \"PATCH\"
        \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/transaction/payments/GH2AERQEJS/capture\"
    },
    {
        \"rel\": \"refund\",
        \"method\": \"POST\"
        \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/transaction/payments/GH2AERQEJS/refunds\"
    },
    {
        \"rel\": \"update\",
        \"method\": \"PATCH\"
        \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/transaction/payments/GH2AERQEJS\"
    },
    {
        \"rel\": \"self\",
        \"method\": \"GET\"
        \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/transaction/payments/GH2AERQEJS\"
    },
    {
        \"rel\": \"reverse\",
        \"method\": \"DELETE\"
        \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/transaction/payments/GH2AERQEJS\"
    }
]
```

# Pagination
The Merchant API features a cursor-based pagination which is sometimes referred as continuation token pagination.
This pagination approach works by returning a pointer to a specific item in the dataset. On subsequent requests, the server returns results after the given pointer.

Clients don't need to worry about implementing complex pagination mechanism in their applications as we return, for all paginated resources, the total count and a hypermedia link that can be used to load more results.
It is important to mention that the response containing the last elements will not contain a `next` hyperlink. We do that so you know that there are no more elements to load.
```
\"links\": [
    {
        \"rel\": \"next\",
        \"method\": \"GET\"
        \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/account/terminals?next=CWY4XRGUUY\"
    }
]
```

The default number of elements per page is `10` and the maximum is `100`, but it can be changed by adding the query parameter `pageSize` to requests as follows:
```
curl https://testpayments.worldnettps.com/merchant/api/v1/account/terminals?pageSize=5 \\
  -H \"Content-Type: application/json\" \\
  -H \"Authorization: Bearer <JWT Token>\"
```

**Note:** For performance reasons, the elements inside of a paginated list only represent a compact version of the resource listed.
To retrieve the full version of a given resource, client applications must make a subsequent request using the proper hypermedia link.

# Versioning
Versioning ensures that changes are backward compatible. The Merchant API uses a major and minor version nomenclature to manage changes.

## Major Versions
Major version numbers will reflect in the REST URL, for example `/api/v1/transaction/payments`.

Currently, **v1** is the only supported major version.

## Minor Versions
Minor and backward-compatible changes will be advertised via `X-API-Version` response header, for example `X-API-Version: 2020-01-01`.

Developers should use this header to keep track of new features and optimizations that might benefit their applications.


This SDK is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: v1
- Package version: 1.0.0
- Build package: org.openapitools.codegen.languages.RubyClientCodegen
For more information, please visit [https://worldnetpayments.com/contact/](https://worldnetpayments.com/contact/)

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build worldnet_payments.gemspec
```

Then either install the gem locally:

```shell
gem install ./worldnet_payments-1.0.0.gem
```

(for development, run `gem install --dev ./worldnet_payments-1.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'worldnet_payments', '~> 1.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'worldnet_payments', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:

```ruby
# Load the gem
require 'worldnet_payments'

# Setup authorization
WorldnetPayments.configure do |config|
  # Configure Bearer authorization (JWT): Bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = WorldnetPayments::CardsApi.new
balance_inquiry_request = WorldnetPayments::BalanceInquiryRequest.new({terminal: 'terminal_example', currency: 'AED', customer_account: WorldnetPayments::Payload.new({payload_type: 'payload_type_example'})}) # BalanceInquiryRequest | 

begin
  #Balance Inquiry
  result = api_instance.balance_inquiry(balance_inquiry_request)
  p result
rescue WorldnetPayments::ApiError => e
  puts "Exception when calling CardsApi->balance_inquiry: #{e}"
end

```

## Documentation for API Endpoints

All URIs are relative to *https://testpayments.worldnettps.com/merchant*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*WorldnetPayments::CardsApi* | [**balance_inquiry**](docs/CardsApi.md#balance_inquiry) | **POST** /api/v1/customer/cards/balance | Balance Inquiry
*WorldnetPayments::CredentialsApi* | [**delete_credentials**](docs/CredentialsApi.md#delete_credentials) | **DELETE** /api/v1/customer/credentials/{merchantReference} | Delete Credentials
*WorldnetPayments::CredentialsApi* | [**get_credentials**](docs/CredentialsApi.md#get_credentials) | **GET** /api/v1/customer/credentials/{merchantReference} | Get Credentials
*WorldnetPayments::CredentialsApi* | [**search_credential_transactions**](docs/CredentialsApi.md#search_credential_transactions) | **POST** /api/v1/customer/credentials/transactions | Search Latest Transactions
*WorldnetPayments::CredentialsApi* | [**store_credentials**](docs/CredentialsApi.md#store_credentials) | **POST** /api/v1/customer/credentials | Store Credentials
*WorldnetPayments::CredentialsApi* | [**update_credentials**](docs/CredentialsApi.md#update_credentials) | **PATCH** /api/v1/customer/credentials/{merchantReference} | Update Credentials
*WorldnetPayments::PaymentsApi* | [**capture_payment**](docs/PaymentsApi.md#capture_payment) | **PATCH** /api/v1/transaction/payments/{uniqueReference}/capture | Capture a Payment
*WorldnetPayments::PaymentsApi* | [**get_payment**](docs/PaymentsApi.md#get_payment) | **GET** /api/v1/transaction/payments/{uniqueReference} | Get a Payment
*WorldnetPayments::PaymentsApi* | [**payment**](docs/PaymentsApi.md#payment) | **POST** /api/v1/transaction/payments | Make a Payment
*WorldnetPayments::PaymentsApi* | [**refund_payment**](docs/PaymentsApi.md#refund_payment) | **POST** /api/v1/transaction/payments/{uniqueReference}/refunds | Refund a Payment
*WorldnetPayments::PaymentsApi* | [**reverse_payment**](docs/PaymentsApi.md#reverse_payment) | **PATCH** /api/v1/transaction/payments/{uniqueReference}/reverse | Reverse a Payment
*WorldnetPayments::PaymentsApi* | [**update_payment**](docs/PaymentsApi.md#update_payment) | **PATCH** /api/v1/transaction/payments/{uniqueReference} | Update a Payment
*WorldnetPayments::RefundsApi* | [**get_refund**](docs/RefundsApi.md#get_refund) | **GET** /api/v1/transaction/refunds/{uniqueReference} | Get a Refund
*WorldnetPayments::RefundsApi* | [**reverse_refund**](docs/RefundsApi.md#reverse_refund) | **PATCH** /api/v1/transaction/refunds/{uniqueReference}/reverse | Reverse a Refund
*WorldnetPayments::RefundsApi* | [**unreferenced_refund**](docs/RefundsApi.md#unreferenced_refund) | **POST** /api/v1/transaction/refunds | Unreferenced Refund
*WorldnetPayments::RefundsApi* | [**update_refund**](docs/RefundsApi.md#update_refund) | **PATCH** /api/v1/transaction/refunds/{uniqueReference} | Update a Refund
*WorldnetPayments::SettingsApi* | [**end_of_day**](docs/SettingsApi.md#end_of_day) | **PATCH** /api/v1/account/terminals/{terminalNumber}/endOfDay | End Of Day
*WorldnetPayments::SettingsApi* | [**list_device_types**](docs/SettingsApi.md#list_device_types) | **GET** /api/v1/account/terminals/{terminalNumber}/devices | List POS Device Types
*WorldnetPayments::SettingsApi* | [**list_terminals**](docs/SettingsApi.md#list_terminals) | **GET** /api/v1/account/terminals | List Terminals
*WorldnetPayments::SettingsApi* | [**load_device_type**](docs/SettingsApi.md#load_device_type) | **GET** /api/v1/account/terminals/{terminalNumber}/devices/{type} | Load POS Device Type
*WorldnetPayments::SettingsApi* | [**load_terminal**](docs/SettingsApi.md#load_terminal) | **GET** /api/v1/account/terminals/{terminalNumber} | Load Terminal
*WorldnetPayments::SettingsApi* | [**update_terminal**](docs/SettingsApi.md#update_terminal) | **PATCH** /api/v1/account/terminals/{terminalNumber} | Update Terminal
*WorldnetPayments::TokensApi* | [**authenticate**](docs/TokensApi.md#authenticate) | **GET** /api/v1/account/authenticate | Authenticate
*WorldnetPayments::TransactionsApi* | [**search_transactions**](docs/TransactionsApi.md#search_transactions) | **GET** /api/v1/transaction/transactions | Search Transactions


## Documentation for Models

 - [WorldnetPayments::AccessToken](docs/AccessToken.md)
 - [WorldnetPayments::AccountBalance](docs/AccountBalance.md)
 - [WorldnetPayments::Address](docs/Address.md)
 - [WorldnetPayments::AddressVerificationSystem](docs/AddressVerificationSystem.md)
 - [WorldnetPayments::Balance](docs/Balance.md)
 - [WorldnetPayments::BalanceInquiryRequest](docs/BalanceInquiryRequest.md)
 - [WorldnetPayments::CapturePaymentRequest](docs/CapturePaymentRequest.md)
 - [WorldnetPayments::CardDetails](docs/CardDetails.md)
 - [WorldnetPayments::CardDetailsAllOf](docs/CardDetailsAllOf.md)
 - [WorldnetPayments::CardLevelLimit](docs/CardLevelLimit.md)
 - [WorldnetPayments::CardSecurityCodeVerification](docs/CardSecurityCodeVerification.md)
 - [WorldnetPayments::CardVolumeLimit](docs/CardVolumeLimit.md)
 - [WorldnetPayments::CredentialOnFile](docs/CredentialOnFile.md)
 - [WorldnetPayments::CustomField](docs/CustomField.md)
 - [WorldnetPayments::Customer](docs/Customer.md)
 - [WorldnetPayments::CustomerAccount](docs/CustomerAccount.md)
 - [WorldnetPayments::CustomerUpdatableData](docs/CustomerUpdatableData.md)
 - [WorldnetPayments::Device](docs/Device.md)
 - [WorldnetPayments::DevicePaginatedResult](docs/DevicePaginatedResult.md)
 - [WorldnetPayments::DeviceType](docs/DeviceType.md)
 - [WorldnetPayments::DeviceTypeCompact](docs/DeviceTypeCompact.md)
 - [WorldnetPayments::DigitalWalletPayload](docs/DigitalWalletPayload.md)
 - [WorldnetPayments::DigitalWalletPayloadAllOf](docs/DigitalWalletPayloadAllOf.md)
 - [WorldnetPayments::DukptPinDetails](docs/DukptPinDetails.md)
 - [WorldnetPayments::EbtDetails](docs/EbtDetails.md)
 - [WorldnetPayments::EmvApplication](docs/EmvApplication.md)
 - [WorldnetPayments::EmvCertificate](docs/EmvCertificate.md)
 - [WorldnetPayments::EmvPayload](docs/EmvPayload.md)
 - [WorldnetPayments::EmvPayloadAllOf](docs/EmvPayloadAllOf.md)
 - [WorldnetPayments::EmvTag](docs/EmvTag.md)
 - [WorldnetPayments::EncryptedMagStripeDataFormat](docs/EncryptedMagStripeDataFormat.md)
 - [WorldnetPayments::EncryptedMagStripeDataFormatAllOf](docs/EncryptedMagStripeDataFormatAllOf.md)
 - [WorldnetPayments::EncryptionCapableDevice](docs/EncryptionCapableDevice.md)
 - [WorldnetPayments::Error](docs/Error.md)
 - [WorldnetPayments::ErrorDetail](docs/ErrorDetail.md)
 - [WorldnetPayments::ErrorSource](docs/ErrorSource.md)
 - [WorldnetPayments::FullyEncryptedKeyedDataFormat](docs/FullyEncryptedKeyedDataFormat.md)
 - [WorldnetPayments::FullyEncryptedKeyedDataFormatAllOf](docs/FullyEncryptedKeyedDataFormatAllOf.md)
 - [WorldnetPayments::HypermediaLink](docs/HypermediaLink.md)
 - [WorldnetPayments::IpAddress](docs/IpAddress.md)
 - [WorldnetPayments::KeyedDataFormat](docs/KeyedDataFormat.md)
 - [WorldnetPayments::KeyedPayload](docs/KeyedPayload.md)
 - [WorldnetPayments::KeyedPayloadAllOf](docs/KeyedPayloadAllOf.md)
 - [WorldnetPayments::MagStripeDataFormat](docs/MagStripeDataFormat.md)
 - [WorldnetPayments::MagStripePayload](docs/MagStripePayload.md)
 - [WorldnetPayments::MagStripePayloadAllOf](docs/MagStripePayloadAllOf.md)
 - [WorldnetPayments::MerchantDetails](docs/MerchantDetails.md)
 - [WorldnetPayments::MerchantLevelLimit](docs/MerchantLevelLimit.md)
 - [WorldnetPayments::MotoPaymentRequest](docs/MotoPaymentRequest.md)
 - [WorldnetPayments::MotoRefundRequest](docs/MotoRefundRequest.md)
 - [WorldnetPayments::OfflineProcessing](docs/OfflineProcessing.md)
 - [WorldnetPayments::Order](docs/Order.md)
 - [WorldnetPayments::OrderBreakdown](docs/OrderBreakdown.md)
 - [WorldnetPayments::OrderBreakdownUpdatableData](docs/OrderBreakdownUpdatableData.md)
 - [WorldnetPayments::PartiallyEncryptedKeyedDataFormat](docs/PartiallyEncryptedKeyedDataFormat.md)
 - [WorldnetPayments::PartiallyEncryptedKeyedDataFormatAllOf](docs/PartiallyEncryptedKeyedDataFormatAllOf.md)
 - [WorldnetPayments::Payload](docs/Payload.md)
 - [WorldnetPayments::Payment](docs/Payment.md)
 - [WorldnetPayments::PaymentRequest](docs/PaymentRequest.md)
 - [WorldnetPayments::PlainTextKeyedDataFormat](docs/PlainTextKeyedDataFormat.md)
 - [WorldnetPayments::PlainTextKeyedDataFormatAllOf](docs/PlainTextKeyedDataFormatAllOf.md)
 - [WorldnetPayments::PlainTextMagStripeDataFormat](docs/PlainTextMagStripeDataFormat.md)
 - [WorldnetPayments::PlainTextMagStripeDataFormatAllOf](docs/PlainTextMagStripeDataFormatAllOf.md)
 - [WorldnetPayments::PosPaymentRequest](docs/PosPaymentRequest.md)
 - [WorldnetPayments::PosRefundRequest](docs/PosRefundRequest.md)
 - [WorldnetPayments::ProcessingRule](docs/ProcessingRule.md)
 - [WorldnetPayments::ProcessingRuleInstruction](docs/ProcessingRuleInstruction.md)
 - [WorldnetPayments::ProcessingRulePredicate](docs/ProcessingRulePredicate.md)
 - [WorldnetPayments::RawDeviceOutputPayload](docs/RawDeviceOutputPayload.md)
 - [WorldnetPayments::RawDeviceOutputPayloadAllOf](docs/RawDeviceOutputPayloadAllOf.md)
 - [WorldnetPayments::ReceiptOrderedInfo](docs/ReceiptOrderedInfo.md)
 - [WorldnetPayments::Refund](docs/Refund.md)
 - [WorldnetPayments::RefundPaymentRequest](docs/RefundPaymentRequest.md)
 - [WorldnetPayments::RefundRequest](docs/RefundRequest.md)
 - [WorldnetPayments::ReversePaymentRequest](docs/ReversePaymentRequest.md)
 - [WorldnetPayments::SearchCredentialTransactionsRequest](docs/SearchCredentialTransactionsRequest.md)
 - [WorldnetPayments::SecureCredentials](docs/SecureCredentials.md)
 - [WorldnetPayments::SecureCredentialsPayload](docs/SecureCredentialsPayload.md)
 - [WorldnetPayments::SecureCredentialsPayloadAllOf](docs/SecureCredentialsPayloadAllOf.md)
 - [WorldnetPayments::SecureCredentialsSettings](docs/SecureCredentialsSettings.md)
 - [WorldnetPayments::SecurityCheck](docs/SecurityCheck.md)
 - [WorldnetPayments::StoreCredentialsRequest](docs/StoreCredentialsRequest.md)
 - [WorldnetPayments::Surcharge](docs/Surcharge.md)
 - [WorldnetPayments::SurchargeSettings](docs/SurchargeSettings.md)
 - [WorldnetPayments::Tax](docs/Tax.md)
 - [WorldnetPayments::TenderTypePredicate](docs/TenderTypePredicate.md)
 - [WorldnetPayments::TenderTypePredicateAllOf](docs/TenderTypePredicateAllOf.md)
 - [WorldnetPayments::Terminal](docs/Terminal.md)
 - [WorldnetPayments::TerminalBankSettings](docs/TerminalBankSettings.md)
 - [WorldnetPayments::TerminalCompact](docs/TerminalCompact.md)
 - [WorldnetPayments::TerminalCustomField](docs/TerminalCustomField.md)
 - [WorldnetPayments::TerminalFeatures](docs/TerminalFeatures.md)
 - [WorldnetPayments::TerminalFraudDetection](docs/TerminalFraudDetection.md)
 - [WorldnetPayments::TerminalLevelLimit](docs/TerminalLevelLimit.md)
 - [WorldnetPayments::TerminalLocationDetails](docs/TerminalLocationDetails.md)
 - [WorldnetPayments::TerminalPaginatedResult](docs/TerminalPaginatedResult.md)
 - [WorldnetPayments::TerminalTax](docs/TerminalTax.md)
 - [WorldnetPayments::TerminalTip](docs/TerminalTip.md)
 - [WorldnetPayments::TerminalVolumeLimits](docs/TerminalVolumeLimits.md)
 - [WorldnetPayments::ThreeDSecure](docs/ThreeDSecure.md)
 - [WorldnetPayments::Tip](docs/Tip.md)
 - [WorldnetPayments::TransactionCompact](docs/TransactionCompact.md)
 - [WorldnetPayments::TransactionPaginatedResult](docs/TransactionPaginatedResult.md)
 - [WorldnetPayments::TransactionReceipt](docs/TransactionReceipt.md)
 - [WorldnetPayments::TransactionResult](docs/TransactionResult.md)
 - [WorldnetPayments::UpdatablePayload](docs/UpdatablePayload.md)
 - [WorldnetPayments::UpdateCredentialsRequest](docs/UpdateCredentialsRequest.md)
 - [WorldnetPayments::UpdatePaymentRequest](docs/UpdatePaymentRequest.md)
 - [WorldnetPayments::UpdateRefundRequest](docs/UpdateRefundRequest.md)
 - [WorldnetPayments::UpdateTerminalRequest](docs/UpdateTerminalRequest.md)
 - [WorldnetPayments::Voucher](docs/Voucher.md)
 - [WorldnetPayments::WebPaymentRequest](docs/WebPaymentRequest.md)


## Documentation for Authorization


### Basic

- **Type**: HTTP basic authentication

### Bearer

- **Type**: Bearer authentication (JWT)

