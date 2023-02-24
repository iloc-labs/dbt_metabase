select
    dashboard_question.dashboard_id,
    dashboard_question.question_id,
    dashboard.name as dashboard_name,
    dashboard.description as dashboard_description,
    dashboard.archived as dashboard_archived,
    question.name as question_name,
    question.description as question_description,
    question.display as question_display,
    question.archived as question_archived,
from {{ ref('stg_metabase__dashboard') }} dashboard
inner join {{ ref('stg_metabase__dashboard_question') }} dashboard_question 
    on dashboard.dashboard_id = dashboard_question.dashboard_id
inner join {{ ref('stg_metabase__question') }} question
    on question.question_id = dashboard_question.question_id