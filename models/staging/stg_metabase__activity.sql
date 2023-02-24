select
    id as activity_id,
    model,
    topic,
    details,
    user_id,
    model_id,
    custom_id,
    database_id,
    {{ dbt_date.convert_timezone(
        column='cast(timestamp as ' ~ dbt.type_timestamp() ~ ')',
        target_tz=var('metabase_target_tz', "UTC"),
        source_tz=var('metabase_source_tz', "UTC"))
    }} as activity_timestamp,
from {{ source('metabase', 'activity') }}