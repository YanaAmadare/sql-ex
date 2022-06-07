SELECT t.class,
    sunk
from (
        SELECT classes.class,
            count(*) as sunk
        FROM classes
            left join ships on classes.class = ships.class
            left join outcomes on (outcomes.ship = classes.class)
            or (outcomes.ship = ships.name)
        where result = 'sunk'
        group by classes.class
    ) t
    join (
        SELECT classes.class,
            count( *) as ship_amount
        FROM classes
            left join ships on classes.class = ships.class
            left join outcomes on (outcomes.ship = classes.class)
            or (outcomes.ship = ships.name)
        group by classes.class
        having  count( *)>=3
    ) t1 on t.class = t1.CLASS