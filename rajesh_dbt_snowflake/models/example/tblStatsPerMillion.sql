{{ config(materialized='table') }}

with source_data as (

select 

 base.Location,
 DATE,
 Coordinates,

 New_Deaths_per_Million,
 New_Cases_per_Million,
 Total_Deaths_per_Million,
 Total_Cases_per_Million

from {{ref('Base')}} base
inner join {{ref('tblGeoDemographic')}} geo on geo.Location = base.Location

)

select *
from source_data