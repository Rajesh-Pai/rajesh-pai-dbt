{{ config(materialized='table') }}

with source_data as (

select
cast(TOTAL_RECOVERED as int) as TOTAL_RECOVERED,
cast(NEW_DEATHS as int) as NEW_DEATHS,
cast(NEW_CASES as int) as NEW_CASES,
cast(TOTAL_DEATHS as int) as TOTAL_DEATHS,
cast(NEW_RECOVERED as int) as NEW_RECOVERED,
cast(TOTAL_ACTIVE_CASES as int) as TOTAL_ACTIVE_CASES,
cast(TOTAL_CASES_PER_MILLION as float) as TOTAL_CASES_PER_MILLION,
cast(NEW_CASES_PER_MILLION as float) as NEW_CASES_PER_MILLION,
cast(NEW_DEATHS_PER_MILLION as float) as NEW_DEATHS_PER_MILLION,
cast(CASE_FATALITY_RATE as float) as CASE_FATALITY_RATE,
cast(TOTAL_RURAL_VILLAGES as int) as TOTAL_RURAL_VILLAGES,
cast(TOTAL_REGENCIES as int) as TOTAL_REGENCIES,
cast(POPULATION as int) as POPULATION,
cast(POPULATION_DENSITY as float) as POPULATION_DENSITY,
TIME_ZONE,
LATITUDE,
LONGITUDE,
LOCATION_ISO_CODE,
cast(TOTAL_CITIES as int) as TOTAL_CITIES,
cast(TOTAL_DISTRICTS as int) as TOTAL_DISTRICTS,
ISLAND,
to_date(Date, 'MM/DD/YYYY') as Date,
PROVINCE,
CASE_RECOVERED_RATE,
SPECIAL_STATUS,
CONTINENT,
NEW_ACTIVE_CASES,
TOTAL_CASES,
TOTAL_URBAN_VILLAGES,
COUNTRY,
TOTAL_DEATHS_PER_MILLION,
LOCATION_LEVEL,
AREA_KM_2_,
GROWTH_FACTOR_OF_NEW_CASES,
LOCATION,
GROWTH_FACTOR_OF_NEW_DEATHS from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_RAJESH_PAI"
)

select *
from source_data

