select
    id as session_id,
    user_id,
    {{ dbt_date.convert_timezone(
        column='cast(created_at as ' ~ dbt.type_timestamp() ~ ')',
        target_tz=var('metabase_target_tz', "UTC"),
        source_tz=var('metabase_source_tz', "UTC"))
    }} as created_timestamp,
    anti_csrf_token,
from {{ source('metabase', 'core_session') }} 