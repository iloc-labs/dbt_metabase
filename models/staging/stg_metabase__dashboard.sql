select
    id as dashboard_id,
    name,
    caveats,
    archived,
    position,
    cache_ttl,
    entity_id,
    creator_id,
    parameters,
    description,
    is_app_page,
    public_uuid,
    collection_id,
    embedding_params,
    enable_embedding,
    made_public_by_id,
    points_of_interest,
    collection_position,
    show_in_getting_started,
    {{ dbt_date.convert_timezone(
        column='cast(created_at as ' ~ dbt.type_timestamp() ~ ')',
        target_tz=var('metabase_target_tz', "UTC"),
        source_tz=var('metabase_source_tz', "UTC"))
    }} as created_timestamp,
    {{ dbt_date.convert_timezone(
        column='cast(updated_at as ' ~ dbt.type_timestamp() ~ ')',
        target_tz=var('metabase_target_tz', "UTC"),
        source_tz=var('metabase_source_tz', "UTC"))
    }} as updated_timestamp,
from {{ source('metabase', 'report_dashboard') }}