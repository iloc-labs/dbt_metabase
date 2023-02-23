with question_activity as (

    select 
        question.name,
        view_log.user_id,
        question.description,
    from {{ ref('stg_matabase__view_log') }} view_log
    inner join {{ ref('stg_matabase__question') }} question
        on question.id = view_log.model_id
    where view_log.model = 'card'

)
select
    name,
    description,
    count(user_id) as view_count
from question_activity
group by name, description
order by view_count