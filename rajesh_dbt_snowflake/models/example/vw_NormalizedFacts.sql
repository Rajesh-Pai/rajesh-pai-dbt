{{ config(materialized='view') }}

with source_data as (

select 

 Date,
 Location,

 New_Cases,
 New_Deaths,
 New_Active_Cases,
 New_Recovered,

 New_Deaths_per_Million,
 New_Cases_per_Million,
 Total_Deaths_per_Million,
 Total_Cases_per_Million,

 Growth_Factor_of_New_Cases,
 Growth_Factor_of_New_Deaths,

 Case_Recovered_Rate,
 Case_Fatality_Rate,


 Total_Recovered,
 Total_Cases,
 Total_Active_Cases,
 Total_Deaths

from {{ref('Base')}}
)

select *
from source_data
select * from "INTERVIEW_DB"."PLAYGROUND_RAJESH_PAI"."TBLSTATSNEW"
