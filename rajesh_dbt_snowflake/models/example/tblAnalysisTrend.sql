-- this table represents probable future stats with past data as reference.
-- since the data points are limited we are populating data for one year

{{ config(materialized='table') }}

WITH cte
     AS (SELECT date,
                location,
                total_recovered,
                total_cases,
                total_active_cases,
                total_deaths,
                Row_number()
                  OVER(
                    partition BY location
                    ORDER BY date DESC) row_num
         FROM
--         {{ref('Base')}}
          base),
     cte2
     AS (SELECT Max(date) max_date,
                location
         FROM
--         {{ref('Base')}}
          base
         GROUP  BY location),
cte3 as (SELECT Dateadd(day, row_num, max_date) date,
       cte.location,
       total_recovered,
       total_cases,
       total_active_cases,
       total_deaths
FROM   cte
       INNER JOIN cte2
               ON cte.location = cte2.location)
select * from cte3