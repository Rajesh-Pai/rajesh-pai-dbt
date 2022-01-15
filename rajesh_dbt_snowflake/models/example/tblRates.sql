{{ config(materialized='table') }}

with source_data as (

select
 base.Location,
 DATE,
 Coordinates,
 Case_Recovered_Rate,
 Case_Fatality_Rate


from {{ref('Base')}} base
inner join {{ref('tblGeoDemographic')}} geo on geo.Location = base.Location

)

select *
from source_data


tblAnalysisTrend.sql