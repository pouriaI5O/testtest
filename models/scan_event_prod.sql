with cte4 as(select *FROM {{ source('public','matrix_scan_events_prod') }}),
 NS AS (
  select 1 as n union all
  select 2 union all
  select 3 union all
  {{ config(
    materialized='table'
)}}
  select 4 union all
  select 5 union all
  select 6 union all
  select 7 union all
  select 8 union all
  select 9 union all
  select 10 union all
  select 11 union all
  select 12 union all
  select 13 union all
  select 14 union all
  select 15 union all
  select 16 union all
  select 17 union all
  select 18 union all
  select 19 union all
  select 20
),
cte as(select *from cte4),
cte2 as(select B.scannedat,B.assignmentid,B.stationid ,
  TRIM(JSON_EXTRACT_ARRAY_ELEMENT_TEXT(B.partnumbers, NS.n - 1)) AS val
from NS
inner join cte B ON NS.n <= JSON_ARRAY_LENGTH(B.partnumbers))
select stationid as station_id,assignmentid as assignment_id,cast(
    scannedat as timestamp
) as scanned_at,val as part_number  from cte2


