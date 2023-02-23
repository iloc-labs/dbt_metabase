select *
from {{ source('metabase', 'view_log') }}