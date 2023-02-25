select
    id as user_id,
    email,
    locale,
    password,
    settings,
    is_active,
    is_qbnewb,
    last_name,
    ldap_auth,
    first_name,
    last_login,
    sso_source,
    google_auth,
    reset_token,
    is_superuser,
    password_salt,
    is_datasetnewb,
    reset_triggered,
    login_attributes,
    {{ dbt_date.convert_timezone(
        column='cast(date_joined as ' ~ dbt.type_timestamp() ~ ')',
        target_tz=var('metabase_target_tz', "UTC"),
        source_tz=var('metabase_source_tz', "UTC"))
    }} as date_joined_timestamp,
    {{ dbt_date.convert_timezone(
        column='cast(updated_at as ' ~ dbt.type_timestamp() ~ ')',
        target_tz=var('metabase_target_tz', "UTC"),
        source_tz=var('metabase_source_tz', "UTC"))
    }} as updated_timestamp,
    concat(first_name, ' ', last_name) as full_name,
from {{ source('metabase', 'core_user') }}