SELECT maker, 
CASE 
    WHEN MAX(CASE WHEN price IS NULL THEN 1 ELSE 0 END)=0
    THEN MAX(price)
END
FROM 

(
    SELECT maker, price
    FROM Product
        JOIN PC ON Product.model=PC.model

UNION
    SELECT maker, price
    FROM Product
    JOIN Laptop ON Product.model=Laptop.model

UNION
    SELECT maker, price
    FROM Product
    JOIN Printer ON Product.model=Printer.model
) as t
GROUP BY maker
