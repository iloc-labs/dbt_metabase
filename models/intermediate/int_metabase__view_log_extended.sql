with view_log as (

    select 
        view_id,
        model,
        user_id as viewer_id,
        model_id,
        view_timestamp
    from {{ ref('stg_metabase__view_log') }}

), model as (

    select
        model_id,
        model_name,
        model,
        archived,
        created_timestamp,
        creator_id,
    from {{ ref('int_metabase__model') }}

), user as (
    
    select
        user_id,
        full_name,
    from {{ ref('stg_metabase__user') }}

)
select
    view_log.view_id,
    view_log.viewer_id,
    user_viewer.user_name as viewer_name,
    view_log.view_timestamp,
    model.model_id,
    model.model_name,
    model.creator_id,
    user_creator.user_name as creator_name,
    model.archived,
    model.model,
from view_log
inner join model
    on view_log.model_id = model.model_id
    and view_log.model = model.model
left join user user_viewer 
    on view_log.viewer_id = user_viewer.user_id
left join user user_creator
    on model.creator_id = user_creator.user_id
