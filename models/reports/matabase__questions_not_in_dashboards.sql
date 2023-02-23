select
    question.id,
    question.name,
    question.description,
    question.display,
    question.query_type
from {{ ref('stg_matabase__question') }} question
left outer join {{ ref('stg_matabase__dashboard_question') }} dashboard_question
    on dashboard_question.card_id = question.id
where question.archived = 0 
  and dashboard_question.card_id is null