select
    dashboard_id,
    name,
    description,
    archived 
from {{ ref('stg_metabase__dashboard') }}