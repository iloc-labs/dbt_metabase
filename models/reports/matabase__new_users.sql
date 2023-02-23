with activity_agg as (

    select 
        date as date_at,
        count(user_id) as count
    from {{ ref('stg_matabase__activity') }}
    where topic = 'user-joined'
    group by 1

)
select
    date_at,
    sum(count) over (
        order by date_at asc
        rows between unbounded preceding and current row
    ) as running_users
from activity_agg