select
    topic,
    cast({{ dbt.date_trunc('day','activity_timestamp') }} as date) week,
    count(*) as activity_count
from {{ ref('stg_metabase__activity') }}
where model in ('dashboard', 'card')
group by 1, 2