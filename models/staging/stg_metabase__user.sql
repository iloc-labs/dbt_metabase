select *
from {{ source('metabase', 'core_user') }}