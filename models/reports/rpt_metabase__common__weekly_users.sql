select
    cast({{ dbt.date_trunc('week','created_timestamp') }} as date) as week,
    count(distinct user_id) as active_users
from {{ ref('stg_metabase__session') }}
group by 1
order by 1 asc