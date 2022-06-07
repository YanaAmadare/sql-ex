SELECT name
FROM Battles 
WHERE DATEPART(yyyy,date)
NOT IN (SELECT launched FROM Ships)
