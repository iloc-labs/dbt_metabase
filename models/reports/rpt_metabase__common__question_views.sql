with top_viewed_question as (

    select
        view_log.model_id as question_id,
        question.name as question_name
        count(view_id) as view_count
    from {{ ref('stg_metabase__view_log') }} view_log
    left join {{ref('stg_metabase__question')}} question
        on view_log.model_id = question.question_id
    where view_log.model = 'card'
        and {{ dbt.datediff(
                'view_timestamp',
                dbt_date.today(tz=var('metabase_target_tz', 'UTC')),
                'day') 
            }} <= 90
    group by 1, 2
    order by 3 desc

)
select *
from top_viewed_question