select point,
    sum(remain)
from (
        select sum(inc) as remain,
            point
        from Income_o
        where date < '2001-04-15'
        group by point
        union
        select - sum(out) as remain,
            point
        from outcome_o
        where date < '2001-04-15'
        group by point
    ) t
group by point