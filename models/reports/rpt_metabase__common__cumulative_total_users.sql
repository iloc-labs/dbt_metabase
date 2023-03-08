with joined_users as (

    select 
        cast({{ dbt.date_trunc('day','date_joined_timestamp') }} as date) date,
        count(user_id) as user_count
    from {{ ref('stg_metabase__user') }}
    group by 1

)
select
    date,
    sum(user_count) over (
        order by date asc
        rows between unbounded preceding and current row
    ) as running_users
from joined_users