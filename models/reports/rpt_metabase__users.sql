select
    id,
    email,
    first_name,
    last_name
from {{ ref('stg_metabase__user') }}
where last_login is null