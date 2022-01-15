{{ config(materialized='table') }}

with source_data as (

select

 base.Location,
 DATE,
 Coordinates,
 Growth_Factor_of_New_Cases,
 Growth_Factor_of_New_Deaths

from {{ref('Base')}} base
inner join {{ref('tblGeoDemographic')}} geo on geo.Location = base.Location

)

select *
from source_data