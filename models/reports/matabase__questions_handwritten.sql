select 
    id,
    name,
    description,
    archived,
    display,
    query_type
from {{ ref('stg_matabase__question') }}
where dataset_query like '%native%'