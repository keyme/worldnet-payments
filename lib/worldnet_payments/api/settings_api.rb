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
  class SettingsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # End Of Day
    # For terminals in manual settle mode, this operation must be used to indicate the end-of-day closing so that clearing and settlement processes can take place.
    # @param terminal_number [String] Unique number assigned by the gateway.
    # @param [Hash] opts the optional parameters
    # @return [Terminal]
    def end_of_day(terminal_number, opts = {})
      data, _status_code, _headers = end_of_day_with_http_info(terminal_number, opts)
      data
    end

    # End Of Day
    # For terminals in manual settle mode, this operation must be used to indicate the end-of-day closing so that clearing and settlement processes can take place.
    # @param terminal_number [String] Unique number assigned by the gateway.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Terminal, Integer, Hash)>] Terminal data, response status code and response headers
    def end_of_day_with_http_info(terminal_number, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SettingsApi.end_of_day ...'
      end
      # verify the required parameter 'terminal_number' is set
      if @api_client.config.client_side_validation && terminal_number.nil?
        fail ArgumentError, "Missing the required parameter 'terminal_number' when calling SettingsApi.end_of_day"
      end
      if @api_client.config.client_side_validation && terminal_number.to_s.length > 50
        fail ArgumentError, 'invalid value for "terminal_number" when calling SettingsApi.end_of_day, the character length must be smaller than or equal to 50.'
      end

      if @api_client.config.client_side_validation && terminal_number.to_s.length < 1
        fail ArgumentError, 'invalid value for "terminal_number" when calling SettingsApi.end_of_day, the character length must be great than or equal to 1.'
      end

      # resource path
      local_var_path = '/api/v1/account/terminals/{terminalNumber}/endOfDay'.sub('{' + 'terminalNumber' + '}', CGI.escape(terminal_number.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Terminal'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Bearer']

      new_options = opts.merge(
        :operation => :"SettingsApi.end_of_day",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SettingsApi#end_of_day\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List POS Device Types
    # Returns a paginated list of basic information about the POS device types supported by the terminal. Use the `load` hypermedia link to retrieve the complete information about a POS device type.
    # @param terminal_number [String] Unique number assigned by the gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page_size The max number of elements per page. (default to 10)
    # @option opts [String] :_next The cursor pointing to the next set of elements. You can either use the value returned in the response or the hypermedia link to retrieve the next page of your search.
    # @return [DevicePaginatedResult]
    def list_device_types(terminal_number, opts = {})
      data, _status_code, _headers = list_device_types_with_http_info(terminal_number, opts)
      data
    end

    # List POS Device Types
    # Returns a paginated list of basic information about the POS device types supported by the terminal. Use the &#x60;load&#x60; hypermedia link to retrieve the complete information about a POS device type.
    # @param terminal_number [String] Unique number assigned by the gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page_size The max number of elements per page.
    # @option opts [String] :_next The cursor pointing to the next set of elements. You can either use the value returned in the response or the hypermedia link to retrieve the next page of your search.
    # @return [Array<(DevicePaginatedResult, Integer, Hash)>] DevicePaginatedResult data, response status code and response headers
    def list_device_types_with_http_info(terminal_number, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SettingsApi.list_device_types ...'
      end
      # verify the required parameter 'terminal_number' is set
      if @api_client.config.client_side_validation && terminal_number.nil?
        fail ArgumentError, "Missing the required parameter 'terminal_number' when calling SettingsApi.list_device_types"
      end
      if @api_client.config.client_side_validation && terminal_number.to_s.length > 50
        fail ArgumentError, 'invalid value for "terminal_number" when calling SettingsApi.list_device_types, the character length must be smaller than or equal to 50.'
      end

      if @api_client.config.client_side_validation && terminal_number.to_s.length < 1
        fail ArgumentError, 'invalid value for "terminal_number" when calling SettingsApi.list_device_types, the character length must be great than or equal to 1.'
      end

      # resource path
      local_var_path = '/api/v1/account/terminals/{terminalNumber}/devices'.sub('{' + 'terminalNumber' + '}', CGI.escape(terminal_number.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
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
      return_type = opts[:debug_return_type] || 'DevicePaginatedResult'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Bearer']

      new_options = opts.merge(
        :operation => :"SettingsApi.list_device_types",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SettingsApi#list_device_types\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Terminals
    # Returns a paginated list of basic information about the terminals assigned to the access token via API Key. Use the `load` hypermedia link to retrieve the full configuration of a terminal.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page_size The max number of elements per page. (default to 10)
    # @option opts [String] :_next The cursor pointing to the next set of elements. You can either use the value returned in the response or the hypermedia link to retrieve the next page of your search.
    # @return [TerminalPaginatedResult]
    def list_terminals(opts = {})
      data, _status_code, _headers = list_terminals_with_http_info(opts)
      data
    end

    # List Terminals
    # Returns a paginated list of basic information about the terminals assigned to the access token via API Key. Use the &#x60;load&#x60; hypermedia link to retrieve the full configuration of a terminal.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page_size The max number of elements per page.
    # @option opts [String] :_next The cursor pointing to the next set of elements. You can either use the value returned in the response or the hypermedia link to retrieve the next page of your search.
    # @return [Array<(TerminalPaginatedResult, Integer, Hash)>] TerminalPaginatedResult data, response status code and response headers
    def list_terminals_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SettingsApi.list_terminals ...'
      end
      # resource path
      local_var_path = '/api/v1/account/terminals'

      # query parameters
      query_params = opts[:query_params] || {}
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
      return_type = opts[:debug_return_type] || 'TerminalPaginatedResult'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Bearer']

      new_options = opts.merge(
        :operation => :"SettingsApi.list_terminals",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SettingsApi#list_terminals\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Load POS Device Type
    # Loads the full details about the device's configuration. Supply the type of one of the devices returned by the list operation.
    # @param terminal_number [String] Unique number assigned by the gateway.
    # @param type [String] Type/Model of the point-of-sale terminal.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :x_pos_device_firmware_version Firmware version of the point-of-sale terminal.
    # @return [DeviceType]
    def load_device_type(terminal_number, type, opts = {})
      data, _status_code, _headers = load_device_type_with_http_info(terminal_number, type, opts)
      data
    end

    # Load POS Device Type
    # Loads the full details about the device&#39;s configuration. Supply the type of one of the devices returned by the list operation.
    # @param terminal_number [String] Unique number assigned by the gateway.
    # @param type [String] Type/Model of the point-of-sale terminal.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :x_pos_device_firmware_version Firmware version of the point-of-sale terminal.
    # @return [Array<(DeviceType, Integer, Hash)>] DeviceType data, response status code and response headers
    def load_device_type_with_http_info(terminal_number, type, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SettingsApi.load_device_type ...'
      end
      # verify the required parameter 'terminal_number' is set
      if @api_client.config.client_side_validation && terminal_number.nil?
        fail ArgumentError, "Missing the required parameter 'terminal_number' when calling SettingsApi.load_device_type"
      end
      if @api_client.config.client_side_validation && terminal_number.to_s.length > 50
        fail ArgumentError, 'invalid value for "terminal_number" when calling SettingsApi.load_device_type, the character length must be smaller than or equal to 50.'
      end

      if @api_client.config.client_side_validation && terminal_number.to_s.length < 1
        fail ArgumentError, 'invalid value for "terminal_number" when calling SettingsApi.load_device_type, the character length must be great than or equal to 1.'
      end

      # verify the required parameter 'type' is set
      if @api_client.config.client_side_validation && type.nil?
        fail ArgumentError, "Missing the required parameter 'type' when calling SettingsApi.load_device_type"
      end
      if @api_client.config.client_side_validation && type.to_s.length > 30
        fail ArgumentError, 'invalid value for "type" when calling SettingsApi.load_device_type, the character length must be smaller than or equal to 30.'
      end

      if @api_client.config.client_side_validation && type.to_s.length < 1
        fail ArgumentError, 'invalid value for "type" when calling SettingsApi.load_device_type, the character length must be great than or equal to 1.'
      end

      # resource path
      local_var_path = '/api/v1/account/terminals/{terminalNumber}/devices/{type}'.sub('{' + 'terminalNumber' + '}', CGI.escape(terminal_number.to_s)).sub('{' + 'type' + '}', CGI.escape(type.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'X-POS-Device-Firmware-Version'] = opts[:'x_pos_device_firmware_version'] if !opts[:'x_pos_device_firmware_version'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'DeviceType'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Bearer']

      new_options = opts.merge(
        :operation => :"SettingsApi.load_device_type",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SettingsApi#load_device_type\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Load Terminal
    # Loads the full details about the terminal's configuration. Supply the number of one of the terminals returned by the list operation.
    # @param terminal_number [String] Unique number assigned by the gateway.
    # @param [Hash] opts the optional parameters
    # @return [Terminal]
    def load_terminal(terminal_number, opts = {})
      data, _status_code, _headers = load_terminal_with_http_info(terminal_number, opts)
      data
    end

    # Load Terminal
    # Loads the full details about the terminal&#39;s configuration. Supply the number of one of the terminals returned by the list operation.
    # @param terminal_number [String] Unique number assigned by the gateway.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Terminal, Integer, Hash)>] Terminal data, response status code and response headers
    def load_terminal_with_http_info(terminal_number, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SettingsApi.load_terminal ...'
      end
      # verify the required parameter 'terminal_number' is set
      if @api_client.config.client_side_validation && terminal_number.nil?
        fail ArgumentError, "Missing the required parameter 'terminal_number' when calling SettingsApi.load_terminal"
      end
      if @api_client.config.client_side_validation && terminal_number.to_s.length > 50
        fail ArgumentError, 'invalid value for "terminal_number" when calling SettingsApi.load_terminal, the character length must be smaller than or equal to 50.'
      end

      if @api_client.config.client_side_validation && terminal_number.to_s.length < 1
        fail ArgumentError, 'invalid value for "terminal_number" when calling SettingsApi.load_terminal, the character length must be great than or equal to 1.'
      end

      # resource path
      local_var_path = '/api/v1/account/terminals/{terminalNumber}'.sub('{' + 'terminalNumber' + '}', CGI.escape(terminal_number.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Terminal'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Bearer']

      new_options = opts.merge(
        :operation => :"SettingsApi.load_terminal",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SettingsApi#load_terminal\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Terminal
    # Partially updates the configuration of a terminal. Currently, it is only possible to update tips and taxes.
    # @param terminal_number [String] Unique number assigned by the gateway.
    # @param update_terminal_request [UpdateTerminalRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Terminal]
    def update_terminal(terminal_number, update_terminal_request, opts = {})
      data, _status_code, _headers = update_terminal_with_http_info(terminal_number, update_terminal_request, opts)
      data
    end

    # Update Terminal
    # Partially updates the configuration of a terminal. Currently, it is only possible to update tips and taxes.
    # @param terminal_number [String] Unique number assigned by the gateway.
    # @param update_terminal_request [UpdateTerminalRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Terminal, Integer, Hash)>] Terminal data, response status code and response headers
    def update_terminal_with_http_info(terminal_number, update_terminal_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SettingsApi.update_terminal ...'
      end
      # verify the required parameter 'terminal_number' is set
      if @api_client.config.client_side_validation && terminal_number.nil?
        fail ArgumentError, "Missing the required parameter 'terminal_number' when calling SettingsApi.update_terminal"
      end
      if @api_client.config.client_side_validation && terminal_number.to_s.length > 50
        fail ArgumentError, 'invalid value for "terminal_number" when calling SettingsApi.update_terminal, the character length must be smaller than or equal to 50.'
      end

      if @api_client.config.client_side_validation && terminal_number.to_s.length < 1
        fail ArgumentError, 'invalid value for "terminal_number" when calling SettingsApi.update_terminal, the character length must be great than or equal to 1.'
      end

      # verify the required parameter 'update_terminal_request' is set
      if @api_client.config.client_side_validation && update_terminal_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_terminal_request' when calling SettingsApi.update_terminal"
      end
      # resource path
      local_var_path = '/api/v1/account/terminals/{terminalNumber}'.sub('{' + 'terminalNumber' + '}', CGI.escape(terminal_number.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_terminal_request)

      # return_type
      return_type = opts[:debug_return_type] || 'Terminal'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Bearer']

      new_options = opts.merge(
        :operation => :"SettingsApi.update_terminal",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SettingsApi#update_terminal\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
