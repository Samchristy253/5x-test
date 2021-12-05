with source_covid19 as(select * from {{ source('fivetran_interview_db', 'covid_19_indonesia_samchristy_s') }} ),
final as (select * from source_covid19)
select * from final
