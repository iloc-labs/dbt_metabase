select *
from {{ source('metabase', 'report_dashboard') }}