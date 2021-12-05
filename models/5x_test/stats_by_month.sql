with source_covid19 as(select * from {{ source('fivetran_interview_db', 'covid_19_indonesia_samchristy_s') }} ),
final as (
    select year(to_date(Date,'mm/dd/yyyy')),month(to_date(Date,'mm/dd/yyyy')),sum(Total_Deaths) - 
    lag(sum(Total_Deaths)) over (order by year(to_date(Date,'mm/dd/yyyy')), month(to_date(Date,'mm/dd/yyyy')))
    from source_covid19
    where year(to_date(Date,'mm/dd/yyyy')) in (2020, 2021)
    group by year(to_date(Date,'mm/dd/yyyy')), month(to_date(Date,'mm/dd/yyyy'))
)
select * from final