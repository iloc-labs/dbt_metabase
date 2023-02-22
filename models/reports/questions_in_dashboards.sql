select
    rd.id,
    rd.name as dashboard_name,
    rd.description as dashboard_description,
    q.name as question_name,
    q.description as question_description,
    q.display as question_display
from 
    report_dashboard rd
inner join
    report_dashboardcard rdc 
        on rd.id = rdc.dashboard_id
inner join
    report_card q
        on q.id = rdc.card_id
where rd.archived = 0 and q.archived = 0