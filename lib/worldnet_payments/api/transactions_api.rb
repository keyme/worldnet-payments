=begin
#Merchant API

## Introduction The Merchant API enables you to connect seamlessly and securely to our [Omni-Channel Payments Platform](https://www.worldnetpayments.com/).  Our APIs are built around [REST](https://en.wikipedia.org/wiki/Representational_state_transfer) principles and [OpenAPI Specification](https://www.openapis.org/) definitions. Complying to such industry standards means that we can offer developers a much better experience by exposing predictable resource-oriented URL's as well as a comprehensive range of HTTP response codes and verbs. Moreover, you have the possibility to enable and take full advantage of [HATEOAS](https://en.wikipedia.org/wiki/HATEOAS) controls to provide out-of-the-box `Discoverability` and `Functional-Awareness` for your integrations.  Get started on building full-featured payment applications and join us in the Revolution of Intelligent Retail.  # Authentication The Merchant API uses a combination of API Keys and [Java Web Tokens (JWT)](https://jwt.io/) to authenticate requests. API Key's hold all the necessary information for issuing JWT access tokens which in turn are required to access protected resources and operations. Therefore, before you can start making any calls, you must generate an API Key and use it to obtain access tokens.  Please, make yourself familiar with the following security schemes before proceeding: <!-- ReDoc-Inject: <security-definitions> --> ## Generating an API Key The API supports two levels of authentication. Our consumers can either authenticate on a merchant level and have their API Keys limited to the scope of a specific merchant or, if you are one of our ISV (Independent Software Vendor) partners, you can have only one API Key for a whole integration which may consist of more than one merchant.  Although it is handy for ISVs to have one key that can authenticate in multiple merchant accounts, they can still use merchant-level authentication if they want to have more control and keep their merchant authentication separate. In this case, the gateway will require an extra header called `X-Integration-ID` - containing the integration's identifier - to be sent in every request.  **How to generate Merchant-Level API Keys?**  1. [Log into the SelfCare System](https://testpayments.worldnettps.com/merchant/selfcare) with the credentials you received in the welcome email. 2. Under *Settings*, navigate to *API Keys*, and then click the `NEW API KEY` button. 4. Enter an alias and set the permission modes for each Sub-API. 5. Select the terminals that you want the API Key to be allowed to operate. 6. Back on the list, choose the action `View Authentication Key` to be able to see your Key's authentication token.  **How to generate Integration-Level API Keys?**  ISV integrations are managed by our support and integration teams. Our team will be happy to create your API Key when requested.<br /> Once created, the authentication token is sent by email in an encrypted file and our team will guide you on how to access its content.  Note: Since ISV developers are not able to create their own keys, we recommend Merchant-Level authentication during integration and test phases as a way to speed up development and avoid the overhead of contacting members of the support team.  ## Obtaining an Access Token In order to obtain an access token you must use the [authenticate](#operation/authenticate) operation passing your API Key in the `HTTP Authorization` header with `Basic` authentication scheme.  In the snippet below we show how to achieve that using [cURL](https://github.com/curl/curl). However, if you are not familiar with command line tools we recommend [Postman](https://www.getpostman.com/).  ``` curl https://testpayments.worldnettps.com/merchant/api/v1/account/authenticate \\   -H \"Authorization: Basic <Merchant API Key>\" ```  For every successful request you should receive a response just like the one below containing the information associated with your credentials, such as hours to expiry and privileges. Include the JWT Token from the `token` property in the `Authorization` header with `Bearer` authentication scheme for following requests to prove your identity and access protected resources.  ``` {     \"audience\": \"testpayments.worldnettps.com\",     \"boundTo\": \"My API Key\",     \"tokenType\": \"Bearer\",     \"token\": \"<JWT Access Token>\",     \"expiresIn\": 1,     \"enableHypermedia\": true,     \"roles\": [],     \"allowedTerminals\": [] } ```  For security reasons, access tokens expire after a certain amount of time. Therefore, your application must implement a mechanism to keep track of the `expiresIn` property which is the number of hours the token is valid for.  **Note:** The lifespan of a token must not be hard-coded on the client-side as the value of `expiresIn` property is subject to change without prior notice.  ## Making Authenticated Calls Apart from the [authenticate](#operation/authenticate) operation, the entire API requires `Bearer` authentication scheme and expects a valid JWT token as proof of identity. The [cURL](https://github.com/curl/curl) snippet below is an example of how to use your access token, in this specific case, to request the list of available terminals in your account.  ``` curl https://testpayments.worldnettps.com/merchant/api/v1/account/terminals?pageSize=10 \\   -H \"Content-Type: application/json\" \\   -H \"Authorization: Bearer <JWT Token>\" ```  **Note:** The API will issue a response with status `401 Unauthorized` for requests carrying an expired JWT.  # API Requests We provide developers looking to integrate with our solutions with a full-featured **Sandbox**.  - Sandbox URL: https://testpayments.worldnettps.com/merchant/  In order to perform actions on the API's resources you must combine your requests with the proper [HTTP Request Method](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods).  The Merchant API supports the following HTTP Methods which are sometimes referred as *HTTP Verbs*:  HTTP Method  | Description ------------ | ------------- [GET](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/GET) | It requests a representation of the specified resource. Requests using `GET` are read-only. [POST](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) | It is used to submit an entity to the specified resource, often causing a change in state on the server. [PATCH](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PATCH) | It is used to apply partial modifications to a resource. [DELETE](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/DELETE) | It deletes / cancels / reverts the specified resource.  ## Request Identifiers The Merchant API assigns a unique identifier for every request that comes in. You can find your requests' identifiers either in the `X-Request-Id` header or in the Error field `debugIdentifier`.  Request ID's are part of an effort to speed troubleshooting by facilitating communication between clients and our support team. Since we keep track of all request identifiers in our log files, you just need to inform the request's identifier when asking us to assist you with problems that might come up during your integrations.  ## Customer Account Payloads  Client applications need to be able to send the customers' account details when generating payments, initiating unreferenced refunds and registering secure credentials.  This information is expected in the form of payloads which varies based on the mechanism used to capture the account/card details.  For instance, when the card details are manually inputted, a `KEYED` payload is expected. However, an `EMV` payload is always expected for contact and contactless EMV transactions. It is worth mentioning that the proper use of payloads also depend on the channel over which your terminal is operating. In the table below we show the supported payloads for each of the three available channels:  Channel                      | Supported Payloads ---------------------------- | ------------------------- WEB (eCommerce)              | `KEYED`, `SECURE_CREDENTIALS`, `DIGITAL_WALLET` POS (Cardholder Present)     | `KEYED`, `EMV`, `RAW`, `MAG_STRIPE` MOTO (Mail/Telephone Order)  | `KEYED`, `SECURE_CREDENTIALS`  ## Request Headers HTTP Header  | Description ------------ | ------------- [Accept](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept) | The response format expected by your application.<br />The Merchant API only produces `application/json` response format. [Accept-Language](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Language) | It advertises which languages the client is able to understand, and which locale variant is preferred.<br />The Merchant API fully supports English `en` and French `fr` languages. [Content-Type](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type) | The body format of the request your application is sending to the API.<br />The Merchant API only consumes `application/json` content type. [Authorization](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Authorization) | It must contain the credentials (API Key or JWT Access Token) to authenticate your application.<br />The API will issue a `401 Unauthorized` response with the `WWW-Authenticate` header attached if your application fails to use this header properly. [X-Integration-ID](#) | It should be sent in every call by ISV integrations that use Merchant-Level API Keys for authentication  ## Partial Updates Partial update requests are signaled with the HTTP method `PATCH`. To perform partial updates, clients must specify only the properties that have changed.  **Note:** To clear the content of a property, supply an empty value.  ## Testing Requests Eventually it will be necessary to perform some transactions. For resources such as testing credit cards and simulated responses, see [Testing Resources](https://docs.worldnettps.com/doku.php?id=developer:integration_docs:testing-guide#testing_resources).  # API Responses Client applications must be able to handle JSON body format as well as a range of [HTTP status codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) when processing responses. Some resources might also include contextual hypermedia links. We strongly recommend that clients use these links to request more information or perform additional actions on a given resource.  ## HTTP Status Codes The Merchant API has adopted a comprehensive range of status codes where `2XX` statuses are returned for successful requests and `4XX` or `5XX` for failed requests.  The full range of status codes supported by this API:  HTTP Status Code  | Description ----------------- | ------------- [200 OK](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/200) | Indicates that the request has succeeded. [201 Created](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/201) | Indicates that the request has succeeded and has led to the creation of a resource. [204 No Content](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/204) | Indicates that the server successfully executed the method but returns no response body.<br />This status is sent specifically to respond to `DELETE` requests. [400 Bad Request](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/400) | Indicates that the server cannot or will not process the request due to malformed request syntax or schema violation. [401 Unauthorized](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/401) | Indicates that the request has not been applied because it lacks valid authentication credentials.<br />This status is sent with a `WWW-Authenticate` header that contains information on how to authorize correctly. [403 Forbidden](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | Indicates that the server understood the request but refuses to authorize it due to the lack of permissions.<br />Re-authenticating will make no difference until the proper permissions and terminals are added to the API Key. [404 Not Found](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/404) | Indicates that the server cannot find the requested resource. [405 Method Not Allowed](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/405) | Indicates that the request method is known by the server but is not supported by the target resource. [406 Not Acceptable](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/406) | Indicates that the server cannot produce a response matching the value from `Accept` header. [415 Unsupported Media Type](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/415) | Indicates that the server refuses to accept the request because the payload format described by the `Content-Type` is unsupported. [422 Unprocessable Entity](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/422) | Indicates that the server understands the content type of the request entity, and the syntax of the request entity is correct, but it was unable to proceed due to semantic errors or failed business validations. [500 Internal Server Error](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/500) | Indicates that the server encountered an unexpected condition that prevented it from fulfilling the request. [501 Not Implemented](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/501) | Indicates that the server does not yet support the functionality required to fulfill the request, but might in the future.  ## Error Handling In the event of a failure, the Merchant API returns an error response body that includes additional details in the format below:  ``` {     \"debugIdentifier\": \"ae6d75eb-381b-4a01-9f49-fdff12e3848b\",     \"details\": [         {             \"errorCode\": \"X_400_002\",             \"errorMessage\": \"Unable to deserialize value\",             \"source\": {                 \"location\": \"BODY\",                 \"resource\": \"TipType\",                 \"property\": \"type\",                 \"value\": \"VARIABLE\",                 \"expected\": \"Acceptable values: [PERCENTAGE, FIXED_AMOUNT]\"             }         }     ] } ```  Error messages are intended to help developers to fix any problems that may come up during integration.<br />However, if you ever have a hard time troubleshooting an issue or even wish to make a suggestion, do not hesitate to [contact us](https://worldnetpayments.com/contact/). Do not forget to send us the `debugIdentifier` along with your inquiries.  ## HATEOAS (Hypermedia Links) [HATEOAS](https://en.wikipedia.org/wiki/HATEOAS) is a powerful mechanism when it comes to enabling self-discoverability, reducing invalid state transition calls and protecting your application against unexpected changes on resources URL's.  This snippet from a sample `payments` response shows the list of hypermedia controls that represent the operations available for the newly created payment resource.  ``` \"links\": [     {         \"rel\": \"capture\",         \"method\": \"PATCH\"         \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/transaction/payments/GH2AERQEJS/capture\"     },     {         \"rel\": \"refund\",         \"method\": \"POST\"         \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/transaction/payments/GH2AERQEJS/refunds\"     },     {         \"rel\": \"update\",         \"method\": \"PATCH\"         \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/transaction/payments/GH2AERQEJS\"     },     {         \"rel\": \"self\",         \"method\": \"GET\"         \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/transaction/payments/GH2AERQEJS\"     },     {         \"rel\": \"reverse\",         \"method\": \"DELETE\"         \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/transaction/payments/GH2AERQEJS\"     } ] ```  # Pagination The Merchant API features a cursor-based pagination which is sometimes referred as continuation token pagination. This pagination approach works by returning a pointer to a specific item in the dataset. On subsequent requests, the server returns results after the given pointer.  Clients don't need to worry about implementing complex pagination mechanism in their applications as we return, for all paginated resources, the total count and a hypermedia link that can be used to load more results. It is important to mention that the response containing the last elements will not contain a `next` hyperlink. We do that so you know that there are no more elements to load. ``` \"links\": [     {         \"rel\": \"next\",         \"method\": \"GET\"         \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/account/terminals?next=CWY4XRGUUY\"     } ] ```  The default number of elements per page is `10` and the maximum is `100`, but it can be changed by adding the query parameter `pageSize` to requests as follows: ``` curl https://testpayments.worldnettps.com/merchant/api/v1/account/terminals?pageSize=5 \\   -H \"Content-Type: application/json\" \\   -H \"Authorization: Bearer <JWT Token>\" ```  **Note:** For performance reasons, the elements inside of a paginated list only represent a compact version of the resource listed. To retrieve the full version of a given resource, client applications must make a subsequent request using the proper hypermedia link.  # Versioning Versioning ensures that changes are backward compatible. The Merchant API uses a major and minor version nomenclature to manage changes.  ## Major Versions Major version numbers will reflect in the REST URL, for example `/api/v1/transaction/payments`.  Currently, **v1** is the only supported major version.  ## Minor Versions Minor and backward-compatible changes will be advertised via `X-API-Version` response header, for example `X-API-Version: 2020-01-01`.  Developers should use this header to keep track of new features and optimizations that might benefit their applications. 

The version of the OpenAPI document: v1
Contact: support@worldnettps.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.1.1

=end

require 'cgi'

module WorldnetPayments
  class TransactionsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Search Transactions
    # Search for payments and refunds within a certain period. You can narrow down the results by using any combination of the available filters.
    # @param terminal [String] Search for transactions performed by a specific terminal.
    # @param [Hash] opts the optional parameters
    # @option opts [Time] :after_date The start date of the search period represented as per [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) standard.
    # @option opts [Time] :before_date The end date of the search period represented as per [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) standard.
    # @option opts [String] :batch_type Indicates where the search should take place:  - **OPEN:** Search for transactions sitting in the open batch, i.e. transactions waiting to be settled. - **CLOSED:** Search for transactions in one of the terminal&#39;s closed batches, i.e. settled transactions.  Do not use this filter if you want to search both batches in one go.
    # @option opts [Date] :settlement_date Search transactions by the date on which they were settled.&lt;br /&gt;This filter is not compatible with the value **OPEN** of the &#x60;batchType&#x60; filter as only the terminal&#39;s closed batches will get searched.
    # @option opts [String] :resource_type This field is optional and should only be used when consumers want to search either payments or refunds, but not both.
    # @option opts [String] :order_id Search transactions by specific order identifiers.
    # @option opts [String] :unique_reference Search transactions by their unique reference.
    # @option opts [String] :operator Search by the operator that initiated the transactions.
    # @option opts [String] :customer_name Search transactions by their cardholder name.
    # @option opts [String] :pan_first_six Search by the first six digits of the primary account number (PAN).
    # @option opts [String] :pan_last_four Search by the last four digits of the primary account number (PAN).
    # @option opts [String] :status_group Search transactions by their status by using the status groups below:  - **APPROVAL:** Encompasses &#x60;PENDING&#x60;, &#x60;READY&#x60; and &#x60;COMPLETE&#x60; statuses. - **REVERSAL:** Encompasses &#x60;VOID&#x60; and &#x60;REVERSAL&#x60; statuses. - **ACCEPTED:** Refers to &#x60;IN_PROGRESS&#x60; status only. - **DECLINED:** Refers to &#x60;DECLINED&#x60; status only. - **REFERRAL:** Refers to &#x60;REFERRAL&#x60; status only. 
    # @option opts [Integer] :page_size The max number of elements per page. (default to 10)
    # @option opts [String] :_next The cursor pointing to the next set of elements. You can either use the value returned in the response or the hypermedia link to retrieve the next page of your search.
    # @return [TransactionPaginatedResult]
    def search_transactions(terminal, opts = {})
      data, _status_code, _headers = search_transactions_with_http_info(terminal, opts)
      data
    end

    # Search Transactions
    # Search for payments and refunds within a certain period. You can narrow down the results by using any combination of the available filters.
    # @param terminal [String] Search for transactions performed by a specific terminal.
    # @param [Hash] opts the optional parameters
    # @option opts [Time] :after_date The start date of the search period represented as per [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) standard.
    # @option opts [Time] :before_date The end date of the search period represented as per [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) standard.
    # @option opts [String] :batch_type Indicates where the search should take place:  - **OPEN:** Search for transactions sitting in the open batch, i.e. transactions waiting to be settled. - **CLOSED:** Search for transactions in one of the terminal&#39;s closed batches, i.e. settled transactions.  Do not use this filter if you want to search both batches in one go.
    # @option opts [Date] :settlement_date Search transactions by the date on which they were settled.&lt;br /&gt;This filter is not compatible with the value **OPEN** of the &#x60;batchType&#x60; filter as only the terminal&#39;s closed batches will get searched.
    # @option opts [String] :resource_type This field is optional and should only be used when consumers want to search either payments or refunds, but not both.
    # @option opts [String] :order_id Search transactions by specific order identifiers.
    # @option opts [String] :unique_reference Search transactions by their unique reference.
    # @option opts [String] :operator Search by the operator that initiated the transactions.
    # @option opts [String] :customer_name Search transactions by their cardholder name.
    # @option opts [String] :pan_first_six Search by the first six digits of the primary account number (PAN).
    # @option opts [String] :pan_last_four Search by the last four digits of the primary account number (PAN).
    # @option opts [String] :status_group Search transactions by their status by using the status groups below:  - **APPROVAL:** Encompasses &#x60;PENDING&#x60;, &#x60;READY&#x60; and &#x60;COMPLETE&#x60; statuses. - **REVERSAL:** Encompasses &#x60;VOID&#x60; and &#x60;REVERSAL&#x60; statuses. - **ACCEPTED:** Refers to &#x60;IN_PROGRESS&#x60; status only. - **DECLINED:** Refers to &#x60;DECLINED&#x60; status only. - **REFERRAL:** Refers to &#x60;REFERRAL&#x60; status only. 
    # @option opts [Integer] :page_size The max number of elements per page.
    # @option opts [String] :_next The cursor pointing to the next set of elements. You can either use the value returned in the response or the hypermedia link to retrieve the next page of your search.
    # @return [Array<(TransactionPaginatedResult, Integer, Hash)>] TransactionPaginatedResult data, response status code and response headers
    def search_transactions_with_http_info(terminal, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransactionsApi.search_transactions ...'
      end
      # verify the required parameter 'terminal' is set
      if @api_client.config.client_side_validation && terminal.nil?
        fail ArgumentError, "Missing the required parameter 'terminal' when calling TransactionsApi.search_transactions"
      end
      if @api_client.config.client_side_validation && terminal.to_s.length > 50
        fail ArgumentError, 'invalid value for "terminal" when calling TransactionsApi.search_transactions, the character length must be smaller than or equal to 50.'
      end

      if @api_client.config.client_side_validation && terminal.to_s.length < 1
        fail ArgumentError, 'invalid value for "terminal" when calling TransactionsApi.search_transactions, the character length must be great than or equal to 1.'
      end

      allowable_values = ["OPEN", "CLOSED"]
      if @api_client.config.client_side_validation && opts[:'batch_type'] && !allowable_values.include?(opts[:'batch_type'])
        fail ArgumentError, "invalid value for \"batch_type\", must be one of #{allowable_values}"
      end
      allowable_values = ["PAYMENT", "REFUND"]
      if @api_client.config.client_side_validation && opts[:'resource_type'] && !allowable_values.include?(opts[:'resource_type'])
        fail ArgumentError, "invalid value for \"resource_type\", must be one of #{allowable_values}"
      end
      if @api_client.config.client_side_validation && !opts[:'order_id'].nil? && opts[:'order_id'].to_s.length > 24
        fail ArgumentError, 'invalid value for "opts[:"order_id"]" when calling TransactionsApi.search_transactions, the character length must be smaller than or equal to 24.'
      end

      if @api_client.config.client_side_validation && !opts[:'order_id'].nil? && opts[:'order_id'].to_s.length < 1
        fail ArgumentError, 'invalid value for "opts[:"order_id"]" when calling TransactionsApi.search_transactions, the character length must be great than or equal to 1.'
      end

      if @api_client.config.client_side_validation && !opts[:'unique_reference'].nil? && opts[:'unique_reference'].to_s.length > 10
        fail ArgumentError, 'invalid value for "opts[:"unique_reference"]" when calling TransactionsApi.search_transactions, the character length must be smaller than or equal to 10.'
      end

      if @api_client.config.client_side_validation && !opts[:'unique_reference'].nil? && opts[:'unique_reference'].to_s.length < 10
        fail ArgumentError, 'invalid value for "opts[:"unique_reference"]" when calling TransactionsApi.search_transactions, the character length must be great than or equal to 10.'
      end

      if @api_client.config.client_side_validation && !opts[:'operator'].nil? && opts[:'operator'].to_s.length > 50
        fail ArgumentError, 'invalid value for "opts[:"operator"]" when calling TransactionsApi.search_transactions, the character length must be smaller than or equal to 50.'
      end

      if @api_client.config.client_side_validation && !opts[:'operator'].nil? && opts[:'operator'].to_s.length < 1
        fail ArgumentError, 'invalid value for "opts[:"operator"]" when calling TransactionsApi.search_transactions, the character length must be great than or equal to 1.'
      end

      if @api_client.config.client_side_validation && !opts[:'customer_name'].nil? && opts[:'customer_name'].to_s.length > 50
        fail ArgumentError, 'invalid value for "opts[:"customer_name"]" when calling TransactionsApi.search_transactions, the character length must be smaller than or equal to 50.'
      end

      if @api_client.config.client_side_validation && !opts[:'customer_name'].nil? && opts[:'customer_name'].to_s.length < 1
        fail ArgumentError, 'invalid value for "opts[:"customer_name"]" when calling TransactionsApi.search_transactions, the character length must be great than or equal to 1.'
      end

      pattern = Regexp.new(/[0-9]{6}/)
      if @api_client.config.client_side_validation && !opts[:'pan_first_six'].nil? && opts[:'pan_first_six'] !~ pattern
        fail ArgumentError, "invalid value for 'opts[:\"pan_first_six\"]' when calling TransactionsApi.search_transactions, must conform to the pattern #{pattern}."
      end

      pattern = Regexp.new(/[0-9]{4}/)
      if @api_client.config.client_side_validation && !opts[:'pan_last_four'].nil? && opts[:'pan_last_four'] !~ pattern
        fail ArgumentError, "invalid value for 'opts[:\"pan_last_four\"]' when calling TransactionsApi.search_transactions, must conform to the pattern #{pattern}."
      end

      allowable_values = ["APPROVAL", "DECLINED", "REVERSAL", "REFERRAL", "ACCEPTED"]
      if @api_client.config.client_side_validation && opts[:'status_group'] && !allowable_values.include?(opts[:'status_group'])
        fail ArgumentError, "invalid value for \"status_group\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/v1/transaction/transactions'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'terminal'] = terminal
      query_params[:'afterDate'] = opts[:'after_date'] if !opts[:'after_date'].nil?
      query_params[:'beforeDate'] = opts[:'before_date'] if !opts[:'before_date'].nil?
      query_params[:'batchType'] = opts[:'batch_type'] if !opts[:'batch_type'].nil?
      query_params[:'settlementDate'] = opts[:'settlement_date'] if !opts[:'settlement_date'].nil?
      query_params[:'resourceType'] = opts[:'resource_type'] if !opts[:'resource_type'].nil?
      query_params[:'orderId'] = opts[:'order_id'] if !opts[:'order_id'].nil?
      query_params[:'uniqueReference'] = opts[:'unique_reference'] if !opts[:'unique_reference'].nil?
      query_params[:'operator'] = opts[:'operator'] if !opts[:'operator'].nil?
      query_params[:'customerName'] = opts[:'customer_name'] if !opts[:'customer_name'].nil?
      query_params[:'panFirstSix'] = opts[:'pan_first_six'] if !opts[:'pan_first_six'].nil?
      query_params[:'panLastFour'] = opts[:'pan_last_four'] if !opts[:'pan_last_four'].nil?
      query_params[:'statusGroup'] = opts[:'status_group'] if !opts[:'status_group'].nil?
      query_params[:'pageSize'] = opts[:'page_size'] if !opts[:'page_size'].nil?
      query_params[:'next'] = opts[:'_next'] if !opts[:'_next'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'TransactionPaginatedResult'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Bearer']

      new_options = opts.merge(
        :operation => :"TransactionsApi.search_transactions",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TransactionsApi#search_transactions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
