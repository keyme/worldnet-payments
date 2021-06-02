# WorldnetPayments::TerminalBankSettings

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **allow_multicurrency** | **Boolean** | Indicates whether the terminal supports multi-currency processing. |  |
| **allow_emcp** | **Boolean** | Indicates whether the terminal supports enhanced multi-currency processing. |  |
| **allow_edcc** | **Boolean** | Indicates whether the terminal supports dynamic currency conversion. |  |
| **base_currency** | **String** | The terminal&#39;s base currency used for single currency transactions as well as MCP and DCC processing.  **Note:** Terminals where &#x60;allowMulticurrency&#x60; is enabled will not have a base currency. | [optional] |
| **supported_currencies** | **Array&lt;String&gt;** | List of currencies supported by the terminal for multi-currency processing of any kind. | [optional] |
| **allow_moto** | **Boolean** | Indicates whether the terminal is configured to process Mail Order / Telephone Order transactions. |  |
| **allow_internet** | **Boolean** | Indicates whether the terminal is configured to process Web-based transactions. |  |
| **allow_chp** | **Boolean** | Indicates whether the terminal is configured to process POS-based (Cardholder Present) transactions. |  |
| **allow_recurring** | **Boolean** | Indicates whether the terminal allows recurring payments. |  |
| **allow_pre_auth** | **Boolean** | Indicates whether the terminal allows pre-authorizations.&lt;br /&gt;This type of transactions need to be complemented with a capture operation which can be done for a partial as well as a full amount. |  |
| **enable_automatic_settle** | **Boolean** | If enabled, the terminal&#39;s transactions will be automatically cleared and settled based on the cut-off time in &#x60;batchTime&#x60; property. |  |
| **batch_time** | **String** | Time, represented in the terminal&#39;s timezone, that defines the end-of-day closing for the terminal.&lt;br /&gt;When in manual mode, merchants must send a &#x60;endOfDay&#x60; request in order to indicate that transactions performed prior to that moment are eligible to be cleared in the next settlement run. | [optional] |
| **display_name** | **String** | Friendly name assigned by the merchant. | [optional] |
| **force_unique_order_id** | **Boolean** | Indicates whether the terminal accepts duplicate order identifiers.&lt;br /&gt;An order is considered a duplicate when there is already another approved transaction sitting in the open batch with the same identifier. |  |

## Example

```ruby
require 'worldnet_payments'

instance = WorldnetPayments::TerminalBankSettings.new(
  allow_multicurrency: null,
  allow_emcp: null,
  allow_edcc: null,
  base_currency: null,
  supported_currencies: null,
  allow_moto: null,
  allow_internet: null,
  allow_chp: null,
  allow_recurring: null,
  allow_pre_auth: null,
  enable_automatic_settle: null,
  batch_time: null,
  display_name: null,
  force_unique_order_id: null
)
```

