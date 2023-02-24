select
    question_id,
    name,
    description,
    archived,
    display,
    query_type,
    is_native
from {{ ref('stg_metabase__question') }}