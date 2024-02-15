
# Flexor's dbt Package For Transforming ZenDesk Tickets To Structured Data
<p align="center">
   <img alt="GitHub License" src="https://img.shields.io/github/license/flexor-ai/dbt-zendesk">
   <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" />
   <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" />
</p>

> 💡 Note: This package is meant to be run by [Flexor](https://flexor.ai) users in order to transform ZenDesk tickets into structued data in dbt. If you found us on GitHub, please contact us at hello@flexor.ai to get access! 

## 📣 What does this dbt package do?

Flexor is an [Unstructured Transformation Layer](https://flexor.ai/product/), that allows for the creation of gold-standard tables from unstructured data by performing transformations on the raw text.

This package is meant to help Flexor users who are also dbt users perform `flex` transformations as part of dbt models.

Note that this package contains our approach to **which questions you should ask** about your ZenDesk data, and the exacft `flex` queries you should use to extract said information.

Assuming your data is loaded into a data warehouse, for every ticket and ticket comment, the package exposes 3 types of data:
1. Data referenced from the source ordered by comment_timestamp (View).
2. Various `flex` transformations on the unstructured data.
   Each transformation is stored in a separate incremental table.
   The tables columns are
 - flex json column (with the flex transformation results)
 - flex_id string column (used for joins)
3. Statistics on the ticket (Views).

| **Model**                          | **Description**                                                                                                        |
| ---------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| [tickets_comments_discount](https://github.com/flexor-ai/dbt-zendesk/blob/main/models/tickets_comments/flex_transformations/tickets_comments_discount.sql)        | A boolean classification question - `Is the user asking for a discount?`                                                       |
| [tickets_comments_identifier](https://github.com/flexor-ai/dbt-zendesk/blob/main/models/tickets_comments/flex_transformations/tickets_comments_identifier.sql)       | A boolean classification question + extraction - `Does the request have a relevant identifier? -> [email, order number, account id, tracking order, phone number]`
| [tickets_comments_interface](https://github.com/flexor-ai/dbt-zendesk/blob/main/models/tickets_comments/flex_transformations/tickets_comments_interface.sql) | A boolean question - `Is the ticket about unclear user interface or problems in usage?`                                                 |
| [tickets_comments_shipping](https://github.com/flexor-ai/dbt-zendesk/blob/main/models/tickets_comments/flex_transformations/tickets_comments_shipping.sql) | A boolean classification question - `Is the ticket about shipping options?`                                                |
| [tickets_comments_specific_product](https://github.com/flexor-ai/dbt-zendesk/blob/main/models/tickets_comments/flex_transformations/tickets_comments_specific_product.sql) | A boolean classification question + extraction - `Does the customer asking about a specific product? -> which product?`
| [tickets_comments_tech_issues](https://github.com/flexor-ai/dbt-zendesk/blob/main/models/tickets_comments/flex_transformations/tickets_comments_tech_issues.sql) | A boolean classification question - `'Is the ticket about technical issues?`                                                |

In addition the package expose the `all_tickets` comparison statistics view for an easy review of the potential outputs.

## 🎯 How do I use the dbt package?

### Step 1: Prerequisites

To use this dbt package, you must have the followingr ready to go on your machine:

1. Working dbt core/cloud (`pip install dbt-core dbt-snowflake dbt-bigquery`)
1. A BigQuery or Snowflake dataset configured with a `profiles.yml` file 
1. Ingested dbt tickets (update the `sources.yml` file accordingly)
1. To enable the `flex` function to use actual user input, change `flex_online_mode` to `true`

### Step 2: Install and run the package

```
dbt deps
dbt run
```

# 🔍 Does this package have dependencies?

No - but you should have acess to the [Flexor](https://flexor.ai) platform in order to use it. 

# 🙌 How is this package maintained and can I contribute?
The Flexor team actively maintains this package - if you have any questions or want to contribute, simply open a PR or email us at hello@flexor.ai.

# 🏪 Are there any resources available?
- If you have questions or want to reach out for help, please refer to the [GitHub Issue](https://github.com/flexor-ai/dbt-zendesk/issues/new/choose) section and create an issue.
- If you want to learn more about Flexor, you can visit our website at [Flexor.ai](https://flexor.ai)
