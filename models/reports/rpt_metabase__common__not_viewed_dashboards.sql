with last_views as (

    select
        model_id,
        max(view_timestamp) as last_view_date
    from {{ ref('stg_metabase__view_log') }}
    where model = 'dashboard'
    group by model_id

), not_viewed as (

    select
        last_views.last_view_date,
        dashboard.name as dashboard_name,
        collection.name as collection_name
    from last_views
    left join {{ ref('stg_metabase__dashboard') }} dashboard
        on last_views.model_id = dashboard.dashboard_id
    left join collection
        on dashboard.collection_id = collection.collection_id
    where  {{ dbt.datediff(dbt_date.now(), 'last_views.last_view_date', 'day') }} > 90

)
select *
from not_viewed
where dashboard_name is not null