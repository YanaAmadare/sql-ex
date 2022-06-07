select sum(sum_inc)
from (
        select sum(inc) as sum_inc
        from income_o
        
        union
        select - sum(out) as sum_out
        from outcome_o
        
    ) t


    select 

    sum() over(partition by) 
    from 
    join .. on 
    where
    group by
    having
    order by

    in ()
    between ... and ...