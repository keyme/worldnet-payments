=begin
#Merchant API

## Introduction The Merchant API enables you to connect seamlessly and securely to our [Omni-Channel Payments Platform](https://www.worldnetpayments.com/).  Our APIs are built around [REST](https://en.wikipedia.org/wiki/Representational_state_transfer) principles and [OpenAPI Specification](https://www.openapis.org/) definitions. Complying to such industry standards means that we can offer developers a much better experience by exposing predictable resource-oriented URL's as well as a comprehensive range of HTTP response codes and verbs. Moreover, you have the possibility to enable and take full advantage of [HATEOAS](https://en.wikipedia.org/wiki/HATEOAS) controls to provide out-of-the-box `Discoverability` and `Functional-Awareness` for your integrations.  Get started on building full-featured payment applications and join us in the Revolution of Intelligent Retail.  # Authentication The Merchant API uses a combination of API Keys and [Java Web Tokens (JWT)](https://jwt.io/) to authenticate requests. API Key's hold all the necessary information for issuing JWT access tokens which in turn are required to access protected resources and operations. Therefore, before you can start making any calls, you must generate an API Key and use it to obtain access tokens.  Please, make yourself familiar with the following security schemes before proceeding: <!-- ReDoc-Inject: <security-definitions> --> ## Generating an API Key The API supports two levels of authentication. Our consumers can either authenticate on a merchant level and have their API Keys limited to the scope of a specific merchant or, if you are one of our ISV (Independent Software Vendor) partners, you can have only one API Key for a whole integration which may consist of more than one merchant.  Although it is handy for ISVs to have one key that can authenticate in multiple merchant accounts, they can still use merchant-level authentication if they want to have more control and keep their merchant authentication separate. In this case, the gateway will require an extra header called `X-Integration-ID` - containing the integration's identifier - to be sent in every request.  **How to generate Merchant-Level API Keys?**  1. [Log into the SelfCare System](https://testpayments.worldnettps.com/merchant/selfcare) with the credentials you received in the welcome email. 2. Under *Settings*, navigate to *API Keys*, and then click the `NEW API KEY` button. 4. Enter an alias and set the permission modes for each Sub-API. 5. Select the terminals that you want the API Key to be allowed to operate. 6. Back on the list, choose the action `View Authentication Key` to be able to see your Key's authentication token.  **How to generate Integration-Level API Keys?**  ISV integrations are managed by our support and integration teams. Our team will be happy to create your API Key when requested.<br /> Once created, the authentication token is sent by email in an encrypted file and our team will guide you on how to access its content.  Note: Since ISV developers are not able to create their own keys, we recommend Merchant-Level authentication during integration and test phases as a way to speed up development and avoid the overhead of contacting members of the support team.  ## Obtaining an Access Token In order to obtain an access token you must use the [authenticate](#operation/authenticate) operation passing your API Key in the `HTTP Authorization` header with `Basic` authentication scheme.  In the snippet below we show how to achieve that using [cURL](https://github.com/curl/curl). However, if you are not familiar with command line tools we recommend [Postman](https://www.getpostman.com/).  ``` curl https://testpayments.worldnettps.com/merchant/api/v1/account/authenticate \\   -H \"Authorization: Basic <Merchant API Key>\" ```  For every successful request you should receive a response just like the one below containing the information associated with your credentials, such as hours to expiry and privileges. Include the JWT Token from the `token` property in the `Authorization` header with `Bearer` authentication scheme for following requests to prove your identity and access protected resources.  ``` {     \"audience\": \"testpayments.worldnettps.com\",     \"boundTo\": \"My API Key\",     \"tokenType\": \"Bearer\",     \"token\": \"<JWT Access Token>\",     \"expiresIn\": 1,     \"enableHypermedia\": true,     \"roles\": [],     \"allowedTerminals\": [] } ```  For security reasons, access tokens expire after a certain amount of time. Therefore, your application must implement a mechanism to keep track of the `expiresIn` property which is the number of hours the token is valid for.  **Note:** The lifespan of a token must not be hard-coded on the client-side as the value of `expiresIn` property is subject to change without prior notice.  ## Making Authenticated Calls Apart from the [authenticate](#operation/authenticate) operation, the entire API requires `Bearer` authentication scheme and expects a valid JWT token as proof of identity. The [cURL](https://github.com/curl/curl) snippet below is an example of how to use your access token, in this specific case, to request the list of available terminals in your account.  ``` curl https://testpayments.worldnettps.com/merchant/api/v1/account/terminals?pageSize=10 \\   -H \"Content-Type: application/json\" \\   -H \"Authorization: Bearer <JWT Token>\" ```  **Note:** The API will issue a response with status `401 Unauthorized` for requests carrying an expired JWT.  # API Requests We provide developers looking to integrate with our solutions with a full-featured **Sandbox**.  - Sandbox URL: https://testpayments.worldnettps.com/merchant/  In order to perform actions on the API's resources you must combine your requests with the proper [HTTP Request Method](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods).  The Merchant API supports the following HTTP Methods which are sometimes referred as *HTTP Verbs*:  HTTP Method  | Description ------------ | ------------- [GET](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/GET) | It requests a representation of the specified resource. Requests using `GET` are read-only. [POST](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) | It is used to submit an entity to the specified resource, often causing a change in state on the server. [PATCH](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PATCH) | It is used to apply partial modifications to a resource. [DELETE](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/DELETE) | It deletes / cancels / reverts the specified resource.  ## Request Identifiers The Merchant API assigns a unique identifier for every request that comes in. You can find your requests' identifiers either in the `X-Request-Id` header or in the Error field `debugIdentifier`.  Request ID's are part of an effort to speed troubleshooting by facilitating communication between clients and our support team. Since we keep track of all request identifiers in our log files, you just need to inform the request's identifier when asking us to assist you with problems that might come up during your integrations.  ## Customer Account Payloads  Client applications need to be able to send the customers' account details when generating payments, initiating unreferenced refunds and registering secure credentials.  This information is expected in the form of payloads which varies based on the mechanism used to capture the account/card details.  For instance, when the card details are manually inputted, a `KEYED` payload is expected. However, an `EMV` payload is always expected for contact and contactless EMV transactions. It is worth mentioning that the proper use of payloads also depend on the channel over which your terminal is operating. In the table below we show the supported payloads for each of the three available channels:  Channel                      | Supported Payloads ---------------------------- | ------------------------- WEB (eCommerce)              | `KEYED`, `SECURE_CREDENTIALS`, `DIGITAL_WALLET` POS (Cardholder Present)     | `KEYED`, `EMV`, `RAW`, `MAG_STRIPE` MOTO (Mail/Telephone Order)  | `KEYED`, `SECURE_CREDENTIALS`  ## Request Headers HTTP Header  | Description ------------ | ------------- [Accept](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept) | The response format expected by your application.<br />The Merchant API only produces `application/json` response format. [Accept-Language](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Language) | It advertises which languages the client is able to understand, and which locale variant is preferred.<br />The Merchant API fully supports English `en` and French `fr` languages. [Content-Type](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type) | The body format of the request your application is sending to the API.<br />The Merchant API only consumes `application/json` content type. [Authorization](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Authorization) | It must contain the credentials (API Key or JWT Access Token) to authenticate your application.<br />The API will issue a `401 Unauthorized` response with the `WWW-Authenticate` header attached if your application fails to use this header properly. [X-Integration-ID](#) | It should be sent in every call by ISV integrations that use Merchant-Level API Keys for authentication  ## Partial Updates Partial update requests are signaled with the HTTP method `PATCH`. To perform partial updates, clients must specify only the properties that have changed.  **Note:** To clear the content of a property, supply an empty value.  ## Testing Requests Eventually it will be necessary to perform some transactions. For resources such as testing credit cards and simulated responses, see [Testing Resources](https://docs.worldnettps.com/doku.php?id=developer:integration_docs:testing-guide#testing_resources).  # API Responses Client applications must be able to handle JSON body format as well as a range of [HTTP status codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) when processing responses. Some resources might also include contextual hypermedia links. We strongly recommend that clients use these links to request more information or perform additional actions on a given resource.  ## HTTP Status Codes The Merchant API has adopted a comprehensive range of status codes where `2XX` statuses are returned for successful requests and `4XX` or `5XX` for failed requests.  The full range of status codes supported by this API:  HTTP Status Code  | Description ----------------- | ------------- [200 OK](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/200) | Indicates that the request has succeeded. [201 Created](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/201) | Indicates that the request has succeeded and has led to the creation of a resource. [204 No Content](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/204) | Indicates that the server successfully executed the method but returns no response body.<br />This status is sent specifically to respond to `DELETE` requests. [400 Bad Request](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/400) | Indicates that the server cannot or will not process the request due to malformed request syntax or schema violation. [401 Unauthorized](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/401) | Indicates that the request has not been applied because it lacks valid authentication credentials.<br />This status is sent with a `WWW-Authenticate` header that contains information on how to authorize correctly. [403 Forbidden](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | Indicates that the server understood the request but refuses to authorize it due to the lack of permissions.<br />Re-authenticating will make no difference until the proper permissions and terminals are added to the API Key. [404 Not Found](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/404) | Indicates that the server cannot find the requested resource. [405 Method Not Allowed](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/405) | Indicates that the request method is known by the server but is not supported by the target resource. [406 Not Acceptable](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/406) | Indicates that the server cannot produce a response matching the value from `Accept` header. [415 Unsupported Media Type](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/415) | Indicates that the server refuses to accept the request because the payload format described by the `Content-Type` is unsupported. [422 Unprocessable Entity](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/422) | Indicates that the server understands the content type of the request entity, and the syntax of the request entity is correct, but it was unable to proceed due to semantic errors or failed business validations. [500 Internal Server Error](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/500) | Indicates that the server encountered an unexpected condition that prevented it from fulfilling the request. [501 Not Implemented](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/501) | Indicates that the server does not yet support the functionality required to fulfill the request, but might in the future.  ## Error Handling In the event of a failure, the Merchant API returns an error response body that includes additional details in the format below:  ``` {     \"debugIdentifier\": \"ae6d75eb-381b-4a01-9f49-fdff12e3848b\",     \"details\": [         {             \"errorCode\": \"X_400_002\",             \"errorMessage\": \"Unable to deserialize value\",             \"source\": {                 \"location\": \"BODY\",                 \"resource\": \"TipType\",                 \"property\": \"type\",                 \"value\": \"VARIABLE\",                 \"expected\": \"Acceptable values: [PERCENTAGE, FIXED_AMOUNT]\"             }         }     ] } ```  Error messages are intended to help developers to fix any problems that may come up during integration.<br />However, if you ever have a hard time troubleshooting an issue or even wish to make a suggestion, do not hesitate to [contact us](https://worldnetpayments.com/contact/). Do not forget to send us the `debugIdentifier` along with your inquiries.  ## HATEOAS (Hypermedia Links) [HATEOAS](https://en.wikipedia.org/wiki/HATEOAS) is a powerful mechanism when it comes to enabling self-discoverability, reducing invalid state transition calls and protecting your application against unexpected changes on resources URL's.  This snippet from a sample `payments` response shows the list of hypermedia controls that represent the operations available for the newly created payment resource.  ``` \"links\": [     {         \"rel\": \"capture\",         \"method\": \"PATCH\"         \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/transaction/payments/GH2AERQEJS/capture\"     },     {         \"rel\": \"refund\",         \"method\": \"POST\"         \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/transaction/payments/GH2AERQEJS/refunds\"     },     {         \"rel\": \"update\",         \"method\": \"PATCH\"         \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/transaction/payments/GH2AERQEJS\"     },     {         \"rel\": \"self\",         \"method\": \"GET\"         \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/transaction/payments/GH2AERQEJS\"     },     {         \"rel\": \"reverse\",         \"method\": \"DELETE\"         \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/transaction/payments/GH2AERQEJS\"     } ] ```  # Pagination The Merchant API features a cursor-based pagination which is sometimes referred as continuation token pagination. This pagination approach works by returning a pointer to a specific item in the dataset. On subsequent requests, the server returns results after the given pointer.  Clients don't need to worry about implementing complex pagination mechanism in their applications as we return, for all paginated resources, the total count and a hypermedia link that can be used to load more results. It is important to mention that the response containing the last elements will not contain a `next` hyperlink. We do that so you know that there are no more elements to load. ``` \"links\": [     {         \"rel\": \"next\",         \"method\": \"GET\"         \"href\": \"https://testpayments.worldnettps.com/merchant/api/v1/account/terminals?next=CWY4XRGUUY\"     } ] ```  The default number of elements per page is `10` and the maximum is `100`, but it can be changed by adding the query parameter `pageSize` to requests as follows: ``` curl https://testpayments.worldnettps.com/merchant/api/v1/account/terminals?pageSize=5 \\   -H \"Content-Type: application/json\" \\   -H \"Authorization: Bearer <JWT Token>\" ```  **Note:** For performance reasons, the elements inside of a paginated list only represent a compact version of the resource listed. To retrieve the full version of a given resource, client applications must make a subsequent request using the proper hypermedia link.  # Versioning Versioning ensures that changes are backward compatible. The Merchant API uses a major and minor version nomenclature to manage changes.  ## Major Versions Major version numbers will reflect in the REST URL, for example `/api/v1/transaction/payments`.  Currently, **v1** is the only supported major version.  ## Minor Versions Minor and backward-compatible changes will be advertised via `X-API-Version` response header, for example `X-API-Version: 2020-01-01`.  Developers should use this header to keep track of new features and optimizations that might benefit their applications. 

The version of the OpenAPI document: v1
Contact: support@worldnettps.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.1.1

=end

require 'date'
require 'time'

module WorldnetPayments
  # Terminal settings and capabilities.
  class TerminalBankSettings
    # Indicates whether the terminal supports multi-currency processing.
    attr_accessor :allow_multicurrency

    # Indicates whether the terminal supports enhanced multi-currency processing.
    attr_accessor :allow_emcp

    # Indicates whether the terminal supports dynamic currency conversion.
    attr_accessor :allow_edcc

    # The terminal's base currency used for single currency transactions as well as MCP and DCC processing.  **Note:** Terminals where `allowMulticurrency` is enabled will not have a base currency.
    attr_accessor :base_currency

    # List of currencies supported by the terminal for multi-currency processing of any kind.
    attr_accessor :supported_currencies

    # Indicates whether the terminal is configured to process Mail Order / Telephone Order transactions.
    attr_accessor :allow_moto

    # Indicates whether the terminal is configured to process Web-based transactions.
    attr_accessor :allow_internet

    # Indicates whether the terminal is configured to process POS-based (Cardholder Present) transactions.
    attr_accessor :allow_chp

    # Indicates whether the terminal allows recurring payments.
    attr_accessor :allow_recurring

    # Indicates whether the terminal allows pre-authorizations.<br />This type of transactions need to be complemented with a capture operation which can be done for a partial as well as a full amount.
    attr_accessor :allow_pre_auth

    # If enabled, the terminal's transactions will be automatically cleared and settled based on the cut-off time in `batchTime` property.
    attr_accessor :enable_automatic_settle

    # Time, represented in the terminal's timezone, that defines the end-of-day closing for the terminal.<br />When in manual mode, merchants must send a `endOfDay` request in order to indicate that transactions performed prior to that moment are eligible to be cleared in the next settlement run.
    attr_accessor :batch_time

    # Friendly name assigned by the merchant.
    attr_accessor :display_name

    # Indicates whether the terminal accepts duplicate order identifiers.<br />An order is considered a duplicate when there is already another approved transaction sitting in the open batch with the same identifier.
    attr_accessor :force_unique_order_id

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'allow_multicurrency' => :'allowMulticurrency',
        :'allow_emcp' => :'allowEmcp',
        :'allow_edcc' => :'allowEdcc',
        :'base_currency' => :'baseCurrency',
        :'supported_currencies' => :'supportedCurrencies',
        :'allow_moto' => :'allowMoto',
        :'allow_internet' => :'allowInternet',
        :'allow_chp' => :'allowChp',
        :'allow_recurring' => :'allowRecurring',
        :'allow_pre_auth' => :'allowPreAuth',
        :'enable_automatic_settle' => :'enableAutomaticSettle',
        :'batch_time' => :'batchTime',
        :'display_name' => :'displayName',
        :'force_unique_order_id' => :'forceUniqueOrderId'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'allow_multicurrency' => :'Boolean',
        :'allow_emcp' => :'Boolean',
        :'allow_edcc' => :'Boolean',
        :'base_currency' => :'String',
        :'supported_currencies' => :'Array<String>',
        :'allow_moto' => :'Boolean',
        :'allow_internet' => :'Boolean',
        :'allow_chp' => :'Boolean',
        :'allow_recurring' => :'Boolean',
        :'allow_pre_auth' => :'Boolean',
        :'enable_automatic_settle' => :'Boolean',
        :'batch_time' => :'String',
        :'display_name' => :'String',
        :'force_unique_order_id' => :'Boolean'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `WorldnetPayments::TerminalBankSettings` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `WorldnetPayments::TerminalBankSettings`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'allow_multicurrency')
        self.allow_multicurrency = attributes[:'allow_multicurrency']
      end

      if attributes.key?(:'allow_emcp')
        self.allow_emcp = attributes[:'allow_emcp']
      end

      if attributes.key?(:'allow_edcc')
        self.allow_edcc = attributes[:'allow_edcc']
      end

      if attributes.key?(:'base_currency')
        self.base_currency = attributes[:'base_currency']
      end

      if attributes.key?(:'supported_currencies')
        if (value = attributes[:'supported_currencies']).is_a?(Array)
          self.supported_currencies = value
        end
      end

      if attributes.key?(:'allow_moto')
        self.allow_moto = attributes[:'allow_moto']
      end

      if attributes.key?(:'allow_internet')
        self.allow_internet = attributes[:'allow_internet']
      end

      if attributes.key?(:'allow_chp')
        self.allow_chp = attributes[:'allow_chp']
      end

      if attributes.key?(:'allow_recurring')
        self.allow_recurring = attributes[:'allow_recurring']
      end

      if attributes.key?(:'allow_pre_auth')
        self.allow_pre_auth = attributes[:'allow_pre_auth']
      end

      if attributes.key?(:'enable_automatic_settle')
        self.enable_automatic_settle = attributes[:'enable_automatic_settle']
      end

      if attributes.key?(:'batch_time')
        self.batch_time = attributes[:'batch_time']
      end

      if attributes.key?(:'display_name')
        self.display_name = attributes[:'display_name']
      end

      if attributes.key?(:'force_unique_order_id')
        self.force_unique_order_id = attributes[:'force_unique_order_id']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @allow_multicurrency.nil?
        invalid_properties.push('invalid value for "allow_multicurrency", allow_multicurrency cannot be nil.')
      end

      if @allow_emcp.nil?
        invalid_properties.push('invalid value for "allow_emcp", allow_emcp cannot be nil.')
      end

      if @allow_edcc.nil?
        invalid_properties.push('invalid value for "allow_edcc", allow_edcc cannot be nil.')
      end

      if @allow_moto.nil?
        invalid_properties.push('invalid value for "allow_moto", allow_moto cannot be nil.')
      end

      if @allow_internet.nil?
        invalid_properties.push('invalid value for "allow_internet", allow_internet cannot be nil.')
      end

      if @allow_chp.nil?
        invalid_properties.push('invalid value for "allow_chp", allow_chp cannot be nil.')
      end

      if @allow_recurring.nil?
        invalid_properties.push('invalid value for "allow_recurring", allow_recurring cannot be nil.')
      end

      if @allow_pre_auth.nil?
        invalid_properties.push('invalid value for "allow_pre_auth", allow_pre_auth cannot be nil.')
      end

      if @enable_automatic_settle.nil?
        invalid_properties.push('invalid value for "enable_automatic_settle", enable_automatic_settle cannot be nil.')
      end

      if !@display_name.nil? && @display_name.to_s.length > 24
        invalid_properties.push('invalid value for "display_name", the character length must be smaller than or equal to 24.')
      end

      if !@display_name.nil? && @display_name.to_s.length < 0
        invalid_properties.push('invalid value for "display_name", the character length must be great than or equal to 0.')
      end

      if @force_unique_order_id.nil?
        invalid_properties.push('invalid value for "force_unique_order_id", force_unique_order_id cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @allow_multicurrency.nil?
      return false if @allow_emcp.nil?
      return false if @allow_edcc.nil?
      base_currency_validator = EnumAttributeValidator.new('String', ["AED", "AFN", "ALL", "AMD", "ANG", "AOA", "ARS", "AUD", "AWG", "AZN", "BAM", "BBD", "BDT", "BGN", "BHD", "BIF", "BMD", "BND", "BOB", "BOV", "BRL", "BSD", "BTN", "BWP", "BYR", "BZD", "CAD", "CDF", "CHE", "CHF", "CHW", "CLF", "CLP", "CNY", "COP", "COU", "CRC", "CUC", "CUP", "CVE", "CZK", "DJF", "DKK", "DOP", "DZD", "EGP", "ERN", "ETB", "EUR", "FJD", "FKP", "GBP", "GEL", "GHS", "GIP", "GMD", "GNF", "GTQ", "GYD", "HKD", "HNL", "HRK", "HTG", "HUF", "IDR", "ILS", "INR", "IQD", "IRR", "ISK", "JMD", "JOD", "JPY", "KES", "KGS", "KHR", "KMF", "KPW", "KRW", "KWD", "KYD", "KZT", "LAK", "LBP", "LKR", "LRD", "LSL", "LTL", "LVL", "LYD", "MAD", "MDL", "MGA", "MKD", "MMK", "MNT", "MOP", "MRO", "MRU", "MUR", "MVR", "MWK", "MXN", "MXV", "MYR", "MZN", "NAD", "NGN", "NIO", "NOK", "NPR", "NZD", "OMR", "PAB", "PEN", "PGK", "PHP", "PKR", "PLN", "PYG", "QAR", "RON", "RSD", "RUB", "RWF", "SAR", "SBD", "SCR", "SDG", "SEK", "SGD", "SHP", "SLL", "SOS", "SRD", "SSP", "STD", "STN", "SVC", "SYP", "SZL", "THB", "TJS", "TMT", "TND", "TOP", "TRY", "TTD", "TWD", "TZS", "UAH", "UGX", "USD", "USN", "USS", "UYI", "UYU", "UZS", "VEF", "VES", "VND", "VUV", "WST", "XAF", "XCD", "XOF", "XPF", "YER", "ZAR", "ZMW", "ZWL"])
      return false unless base_currency_validator.valid?(@base_currency)
      return false if @allow_moto.nil?
      return false if @allow_internet.nil?
      return false if @allow_chp.nil?
      return false if @allow_recurring.nil?
      return false if @allow_pre_auth.nil?
      return false if @enable_automatic_settle.nil?
      return false if !@display_name.nil? && @display_name.to_s.length > 24
      return false if !@display_name.nil? && @display_name.to_s.length < 0
      return false if @force_unique_order_id.nil?
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] base_currency Object to be assigned
    def base_currency=(base_currency)
      validator = EnumAttributeValidator.new('String', ["AED", "AFN", "ALL", "AMD", "ANG", "AOA", "ARS", "AUD", "AWG", "AZN", "BAM", "BBD", "BDT", "BGN", "BHD", "BIF", "BMD", "BND", "BOB", "BOV", "BRL", "BSD", "BTN", "BWP", "BYR", "BZD", "CAD", "CDF", "CHE", "CHF", "CHW", "CLF", "CLP", "CNY", "COP", "COU", "CRC", "CUC", "CUP", "CVE", "CZK", "DJF", "DKK", "DOP", "DZD", "EGP", "ERN", "ETB", "EUR", "FJD", "FKP", "GBP", "GEL", "GHS", "GIP", "GMD", "GNF", "GTQ", "GYD", "HKD", "HNL", "HRK", "HTG", "HUF", "IDR", "ILS", "INR", "IQD", "IRR", "ISK", "JMD", "JOD", "JPY", "KES", "KGS", "KHR", "KMF", "KPW", "KRW", "KWD", "KYD", "KZT", "LAK", "LBP", "LKR", "LRD", "LSL", "LTL", "LVL", "LYD", "MAD", "MDL", "MGA", "MKD", "MMK", "MNT", "MOP", "MRO", "MRU", "MUR", "MVR", "MWK", "MXN", "MXV", "MYR", "MZN", "NAD", "NGN", "NIO", "NOK", "NPR", "NZD", "OMR", "PAB", "PEN", "PGK", "PHP", "PKR", "PLN", "PYG", "QAR", "RON", "RSD", "RUB", "RWF", "SAR", "SBD", "SCR", "SDG", "SEK", "SGD", "SHP", "SLL", "SOS", "SRD", "SSP", "STD", "STN", "SVC", "SYP", "SZL", "THB", "TJS", "TMT", "TND", "TOP", "TRY", "TTD", "TWD", "TZS", "UAH", "UGX", "USD", "USN", "USS", "UYI", "UYU", "UZS", "VEF", "VES", "VND", "VUV", "WST", "XAF", "XCD", "XOF", "XPF", "YER", "ZAR", "ZMW", "ZWL"])
      unless validator.valid?(base_currency)
        fail ArgumentError, "invalid value for \"base_currency\", must be one of #{validator.allowable_values}."
      end
      @base_currency = base_currency
    end

    # Custom attribute writer method with validation
    # @param [Object] display_name Value to be assigned
    def display_name=(display_name)
      if !display_name.nil? && display_name.to_s.length > 24
        fail ArgumentError, 'invalid value for "display_name", the character length must be smaller than or equal to 24.'
      end

      if !display_name.nil? && display_name.to_s.length < 0
        fail ArgumentError, 'invalid value for "display_name", the character length must be great than or equal to 0.'
      end

      @display_name = display_name
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          allow_multicurrency == o.allow_multicurrency &&
          allow_emcp == o.allow_emcp &&
          allow_edcc == o.allow_edcc &&
          base_currency == o.base_currency &&
          supported_currencies == o.supported_currencies &&
          allow_moto == o.allow_moto &&
          allow_internet == o.allow_internet &&
          allow_chp == o.allow_chp &&
          allow_recurring == o.allow_recurring &&
          allow_pre_auth == o.allow_pre_auth &&
          enable_automatic_settle == o.enable_automatic_settle &&
          batch_time == o.batch_time &&
          display_name == o.display_name &&
          force_unique_order_id == o.force_unique_order_id
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [allow_multicurrency, allow_emcp, allow_edcc, base_currency, supported_currencies, allow_moto, allow_internet, allow_chp, allow_recurring, allow_pre_auth, enable_automatic_settle, batch_time, display_name, force_unique_order_id].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = WorldnetPayments.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
