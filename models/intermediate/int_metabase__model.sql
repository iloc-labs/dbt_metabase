with question as (

    select
        question_id as model_id,
        name as model_name,
        archived,
        creator_id,
        created_timestamp,
        'card' as model,
    from {{ ref('stg_metabase__question') }} 

), dashboard as (

    select
        dashboard_id as model_id,
        name as model_name,
        archived,
        creator_id,
        created_timestamp,
        'dashboard' as model
    from {{ ref('stg_metabase__dashboard') }} 

), model as (

    select * from question
    union all
    select * from dashboard

)
select * from model