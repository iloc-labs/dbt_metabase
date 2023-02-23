select
    dashboard.id,
    dashboard.name as dashboard_name,
    dashboard.description as dashboard_description,
    question.name as question_name,
    question.description as question_description,
    question.display as question_display
from {{ ref('stg_matabase__dashboard') }} dashboard
inner join {{ ref('stg_matabase__dashboard_question') }} dashboard_question 
    on dashboard.id = dashboard_question.dashboard_id
inner join {{ ref('stg_matabase__question') }} question
    on question.id = dashboard_question.card_id
where dashboard.archived = 0 and question.archived = 0