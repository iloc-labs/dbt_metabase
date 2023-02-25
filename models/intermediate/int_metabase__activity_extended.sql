select
    activity.*,
    user.full_name
from {{ ref('stg_metabase__activity') }} activity
left join {{ ref('stg_metabase__user') }} user
    on activity.user_id = user.user_id