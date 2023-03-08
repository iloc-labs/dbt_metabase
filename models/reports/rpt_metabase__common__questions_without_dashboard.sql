select
    question.question_id,
    question.name,
    question.display,
    question.query_type,
    question.updated_at,
    collection.name as collection_name
from {{ ref('stg_metabase__question') }} question
left outer join {{ ref('stg_metabase__dashboard_question') }} dashboard_question
    on dashboard_question.question_id = question.question_id
left join {{ ref('stg_metabase__collection') }} collection
    on collection.collection_id = question.collection_id
where question.archived = false 
  and dashboard_question.card_id is null
order by question.updated_at