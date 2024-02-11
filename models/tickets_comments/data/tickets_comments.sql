SELECT
    *,
    EXTRACT(date from commnet_timestamp) as date,
    EXTRACT(day from commnet_timestamp) as day,
    EXTRACT(month from commnet_timestamp) as month,
    EXTRACT(year from commnet_timestamp) as year
FROM {{ source('zendesk_ingested', 'flexor_support_tickets') }}
ORDER BY commnet_timestamp desc
LIMIT 10000
