select distinct classes.class,
    count(sunk)
from (
        SELECT distinct classes.class,
            count(*) as sunk
        FROM classes
            left join ships on classes.class = ships.class
            left join outcomes on (outcomes.ship = classes.class)
            or (outcomes.ship = ships.name)
        where result = 'sunk'
        group by classes.class
    ) t
    right join classes on classes.class = t.class
group by classes.class