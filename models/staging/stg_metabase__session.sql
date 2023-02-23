select *
from {{ source('metabase', 'core_session') }} 