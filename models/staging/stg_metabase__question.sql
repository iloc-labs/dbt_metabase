select
    id as question_id,
    name,
    dataset,
    display,
    archived,
    is_write,
    table_id,
    cache_ttl,
    entity_id,
    creator_id,
    parameters,
    query_type,
    database_id,
    description,
    public_uuid,
    collection_id,
    dataset_query,
    result_metadata,
    embedding_params,
    enable_embedding,
    made_public_by_id,
    collection_preview,
    parameter_mappings,
    collection_position,
    visualization_settings
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
from {{ source('metabase', 'report_card') }}