select 
    id,
    name,
    description,
    archived,
    display,
    query_type
from metabase.report_card
where dataset_query like '%native%'