select *
from {{ source('metabase', 'report_card') }}