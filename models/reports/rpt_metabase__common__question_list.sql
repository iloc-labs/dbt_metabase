select
    question.question_id,
    question.name as question_name,
    question.description,
    question.archived,
    question.display,
    question.query_type,
    user.full_name as creator_name
from {{ ref('stg_metabase__question') }} question
left join {{ ref('stg_metabase__user') }} user
    on question.creator_id = user.user_id