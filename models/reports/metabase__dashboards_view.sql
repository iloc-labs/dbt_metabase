select
    count(user.id) as view_count,
    user.email,
    user.first_name,
    user.last_name,
    dashboard.name as dashboard_name,
    dashboard.description as dashboard_description
from {{ ref('stg_matabase__user') }} user
inner join {{ ref('stg_matabase__view_log') }} view_log
    on view_log.user_id = user.id
inner join {{ ref('stg_matabase__dashboard') }} dashboard
    on dashboard.id = view_log.model_id
where view_log.model='dashboard'
group by user.email, user.first_name, user.last_name, dashboard.name, dashboard.description