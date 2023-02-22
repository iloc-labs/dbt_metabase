select
    count(cu.id) as view_count,
    cu.email,
    cu.first_name,
    cu.last_name,
    rd.name as dashboard_name,
    rd.description as dashboard_description
from 
    core_user cu
inner join
    view_log vl
        on vl.user_id = cu.id
inner join
    report_dashboard rd
        on rd.id	= vl.model_id
where vl.model='dashboard'
group by cu.email, cu.first_name, cu.last_name, rd.name, rd.description