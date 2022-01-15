{{ config(materialized='table') }}

with source_data as (

select

 base.ISLAND,
 Date,
 max(Coordinates) as Coordinates,

 sum(New_Cases) as New_Cases,
 sum(New_Deaths) as New_Deaths,
 sum(New_Active_Cases) as New_Active_Cases,
 sum(New_Recovered) as New_Recovered,

 sum(New_Deaths_per_Million) as New_Deaths_per_Million,
 sum(New_Cases_per_Million) as New_Cases_per_Million,
 sum(Total_Deaths_per_Million) as Total_Deaths_per_Million,
 sum(Total_Cases_per_Million) as Total_Cases_per_Million,

 avg(Growth_Factor_of_New_Cases) as Growth_Factor_of_New_Cases,
 avg(Growth_Factor_of_New_Deaths) as Growth_Factor_of_New_Deaths,

 avg(Case_Recovered_Rate) as Case_Recovered_Rate,
 avg(Case_Fatality_Rate) as Case_Fatality_Rate,


 sum(Total_Recovered) as Total_Recovered,
 sum(Total_Cases) as Total_Cases,
 sum(Total_Active_Cases) as Total_Active_Cases,
 sum(Total_Deaths) as Total_Deaths


from Base base
inner join tblGeoDemographic geo on geo.Location = base.Location
where base.ISLAND is not null
group by 1, 2)

select *
from source_data