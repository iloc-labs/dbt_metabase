with views as (

    select distinct
        user_id,
        cast({{ dbt.date_trunc('week','user.view_timestamp') }} as date) as week,
    from {{ ref('stg_metabase__view_log') }}

)
select
    views.week,
    cast(count(distinct future_views.user_id) / count(distinct views.user_id) as float) as retention
from views
left join views as future_views
    on views.user_id = future_views.user_id
    and views.week = {{ dbt.dateadd('week', -1, future_views.week) }}
group by views.week