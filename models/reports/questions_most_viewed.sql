with question_activity as (

    select 
        rc.name,
        vl.user_id,
        rc.description,
    from
        view_log vl
    inner join 
        report_card rc
            on rc.id = vl.model_id
    where vl.model = 'card'

)
select
    name,
    description,
    count(user_id) as view_count
from question_activity
group by name, description
order by view_count