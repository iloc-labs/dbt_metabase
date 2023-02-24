select
    id as view_id,
    model,
    user_id,
    model_id,
    metadata,
    {{ dbt_date.convert_timezone(
        column='cast(timestamp as ' ~ dbt.type_timestamp() ~ ')',
        target_tz=var('metabase_target_tz', "UTC"),
        source_tz=var('metabase_source_tz', "UTC"))
    }} as view_timestamp,
from {{ source('metabase', 'view_log') }}