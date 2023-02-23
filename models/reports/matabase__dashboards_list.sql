select
    id,
    name,
    description,
    archived 
from {{ ref('stg_matabase__dashboard') }}