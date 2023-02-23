select *
from {{ source('metabase', 'activity') }}