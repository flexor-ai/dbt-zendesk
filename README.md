# Flexor-dbt Zendesk Tickets (and comments)

[Flexor-dbt](https://github.com/flexor-ai/flexor-dbt) support for zendesk ingestion

# What does this examples do?

For every ticket and ticket comment, the package exposes 3 types of data:
1. Data referenced from the source ordered by comment_timestamp (View).
2. Various `flex` transformations on the unstructured data.
   Each transformation is stored in a separate incremental table.
   The tables columns are
 - flex json column (with the flex transformation results)
 - flex_id string column (used for joins)
3. Statistics on the ticket (Views).

In addition the package expose all_tickets comparison statistics view

# How do I use the dbt package?

## Step 1: Prerequisites

To use this dbt package, you must have the following:

0. Working dbt core/cloud (`pip install dbt-core dbt-snowflake dbt-bigquery`)
1. A BigQuery or Snowflake dataset configured with a profiles.yml file 
2. Ingested dbt tickets (update the `sources.yml` file)
3. To enable flex function to use any user input, change `flex_online_mode` to `true`

## Step 3: Install and run the package

```
dbt deps
dbt run
```
