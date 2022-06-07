select point, date, type, 
case when sum(inc) is null then sum(out) else sum(inc) end сумма
from
(select inc,
    out,
    case
        when i.point is null then 'out'
        else 'inc'
    end type,
    case
        when i.point is null then o.point
        else i.point
    end point,
    case
        when i.date is null then o.date
        else i.date
    end date
from income i
    full join outcome o on i.point = o.point
    and i.date = o.date
    
where inc is null
    or out is null) t
group by point, date, type
order by point, date
