select
    dashboard_id,
    dashboard_name,
    dashboard_description,
    question_name,
    question_description,
    question_display
from {{ ref('int_metabase__dashboard_question_extended') }} 
where dashboard_archived = 0 and question_archived = 0