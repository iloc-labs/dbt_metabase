select
    id as collection_id,
    name
from {{ source('metabase', 'collection') }}