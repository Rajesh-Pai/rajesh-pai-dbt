{{ config(materialized='table') }}

with source_data as (

select 

 base.Location,
 DATE,
 Coordinates,

 Total_Recovered,
 Total_Cases,
 Total_Active_Cases,
 Total_Deaths

from {{ref('Base')}} base
inner join {{ref('tblGeoDemographic')}} geo on geo.Location = base.Location

)

select *
from source_data