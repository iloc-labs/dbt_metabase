select
    model_name as question_name,
    viewer_name,
    count(view_id) as view_count,
from {{ ref('int_metabase__view_log_extended') }}
where model = 'card' 
    and {{ dbt.datediff(
            'view_timestamp',
            dbt_date.today(tz=var('metabase_target_tz', 'UTC')),
            'day') 
        }} <= 90
group by model_name, viewer_name