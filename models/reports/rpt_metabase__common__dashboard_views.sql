with top_viewed_dashboards as (

    select
        view_log.model_id as dashboard_id,
        count(view_id) as view_count,
        count(distinct view_id) as viewers_count
    from {{ ref('stg_metabase__view_log') }} view_log
    where view_log.model = 'dashboard'
        and {{ dbt.datediff(
                'view_timestamp',
                dbt_date.today(tz=var('metabase_target_tz', 'UTC')),
                'day') 
            }} <= 90
    group by 1

)
select 
    views.dashboard_id,
    views.view_count,
    dashboard_id.name as dashboard_name
from top_viewed_dashboards views
left join {{ref('stg_metabase__dashboard')}} dashboard
    on view_log.model_id = dashboard.dashboard_id
order by views.view_count