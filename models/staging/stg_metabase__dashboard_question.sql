select
    id as dashboard_question_id,
    col,
    row,
    size_x,
    size_y,
    card_id,
    action_id,
    entity_id,
    dashboard_id,
    parameter_mappings,
    visualization_settings,
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
from {{ source('metabase', 'report_dashboardcard') }}