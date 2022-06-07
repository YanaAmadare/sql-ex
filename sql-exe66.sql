select t.date,
    case
        when t1.count_trip is null then 0
        else t1.count_trip
    end
from (
        SELECT CAST('2003-04-01 00:00:00' AS DATETIME) AS date
            UNION ALL
        SELECT CAST('2003-04-02 00:00:00' AS DATETIME)
        UNION ALL
        SELECT CAST('2003-04-03 00:00:00' AS DATETIME)
        UNION ALL
        SELECT CAST('2003-04-04 00:00:00' AS DATETIME)
        UNION ALL
        SELECT CAST('2003-04-05 00:00:00' AS DATETIME)
        UNION ALL
        SELECT CAST('2003-04-06 00:00:00' AS DATETIME)
        UNION ALL
        SELECT CAST('2003-04-07 00:00:00' AS DATETIME)
    ) as t
    left join (
        select date,
            count (distinct trip.trip_no) as count_trip
        from Pass_in_trip
            left join Trip on Trip.trip_no = Pass_in_trip.trip_no
        where date between '2003-04-01 00:00:00' and '2003-04-07 00:00:00'
            and town_from = 'Rostov'
        group by date
    ) as t1 on t.date = t1.date



