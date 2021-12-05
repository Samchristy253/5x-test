with source_covid_19 as (
    select * from {{ source('fivetran_interview_db', 'covid_19_indonesia_samchristy_s') }}
),
final_table as(
    select Date, Country, Population, Population_Density,  Total_Cases, Total_Deaths, Case_fatality_Rate, 
    location, Location_level, Total_Regencies, Total_Cities, Total_Districts, Total_Urban_villages, Total_Rural_villages, AREA_KM_2_, Longitude, Latitude

    from 
    source_covid_19 
    order by Total_Deaths desc
)
select * from final_table
