with source_covid_19 as (
    select * from {{ source('fivetran_interview_db', 'covid_19_indonesia_samchristy_s') }}
),


case_details as (
    select Date, New_Cases, New_Deaths, New_Recovered, New_Active_Cases, Total_Cases, Total_Deaths, Total_Recovered, Total_Active_Cases, New_Cases_Per_million,
     Total_Deaths_per_million, Case_fatality_Rate, Case_Recovered_Rate ,Growth_factor_of_New_Cases, Growth_factor_of_New_Deaths  from source_covid_19

)
select * from case_details