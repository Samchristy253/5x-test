{{ config(materialized='table') }}
with source_covid_19 as (
    select * from {{ source('fivetran_interview_db', 'covid_19_indonesia_samchristy_s') }}
),
location_details as ( 
    select Date, Location, Country,  Location_level, Continent, Total_Regencies, Total_Cities, Total_Districts, Total_Urban_villages, Total_Rural_villages, AREA_KM_2_, Population, Population_Density, Longitude, Latitude  from source_covid_19

)
select * from location_details