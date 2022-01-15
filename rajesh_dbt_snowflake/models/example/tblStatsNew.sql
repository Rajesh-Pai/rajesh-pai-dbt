{{ config(materialized='table') }}

with source_data as (

select 

 base.Location,
 DATE,
 Coordinates,

 New_Cases,
 New_Deaths,
 New_Active_Cases,
 New_Recovered

from {{ref('Base')}} base
inner join {{ref('tblGeoDemographic')}} geo on geo.Location = base.Location
)

select *
from source_data