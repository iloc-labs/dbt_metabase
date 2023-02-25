select
    dashboard.dashboard_id,
    dashboard.name as dashboard_name,
    dashboard.description,
    dashboard.archived,
    user.full_name as creator_name
from {{ ref('stg_metabase__dashboard') }} dashboard
left join {{ ref("stg_metabase__user") }} user
    on dashboard.creator_id = user.user_id