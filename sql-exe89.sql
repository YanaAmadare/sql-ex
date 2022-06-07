Select maker,
    count(*) as Количество
from product
group by maker
having count(*) <= ALL (SELECT COUNT(*) 
                        FROM product 
                        GROUP BY maker)
or count(*) >= ALL (SELECT COUNT(*) 
                        FROM product 
                        GROUP BY maker)
