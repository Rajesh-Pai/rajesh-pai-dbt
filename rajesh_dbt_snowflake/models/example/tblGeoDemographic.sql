{{ config(materialized='table') }}

with source_data as (

SELECT DISTINCT location_iso_code,
                location,
                location_level,
                province,
                country,
                continent,
                island,
                time_zone,
                special_status,
                total_regencies,
                total_cities,
                total_districts,
                total_urban_villages,
                total_rural_villages,
                area_km_2_,
                population,
                population_density,
                longitude,
                latitude,
                CONCAT(Latitude, ', ', Longitude) Coordinates

FROM {{ref('Base')}}
)

SELECT *
FROM source_data