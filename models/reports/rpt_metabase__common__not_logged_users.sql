select
    id,
    email,
    full_name
from {{ ref('stg_metabase__user') }}
where last_login is null