select
    id,
    email,
    first_name,
    last_name
from {{ ref('stg_matabase__user') }}
where last_login is null