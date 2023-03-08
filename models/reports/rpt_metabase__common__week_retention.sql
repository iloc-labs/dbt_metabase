with views as (

    select distinct
        user_id,
        cast({{ dbt.date_trunc('week','user.view_timestamp') }} as date) week,
        min(cast({{ dbt.date_trunc('week','user.view_timestamp') }} as date)) over (
            partition by user_id
        ) as week_joined,
    from {{ ref('stg_metabase__view_log') }}

), cohort_size as (
    
    select
        week_joined,
        count(distinct user_id) as total_users
    from views
    group by week_joined
    
), views_with_period as (

    select 
        user_id,
        week,
        week_joined,
        {{ dbt.datediff('view_date', 'first_view_date', 'week') }} / 7 as period
    from views

), retention as (

    select
        week_joined,
        period,
        count(distinct user_id) as total_repeators
    from views_with_period
    where period <= 10
    group by 1, 2

), result as (

    select
        retention.week_joined,
        retention.period,
        retention.total_repeators,
        cohort_size.total_users,
        retention.total_repeators/cohort_size.total_users::float as retention
    from retention
    left join cohort_size
        on retention.first_week = cohort_size.first_week

)
select
    *
from result