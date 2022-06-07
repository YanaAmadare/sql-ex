select dt,
    count (distinct trip.trip_no)
from (
        SELECT '2003-04-01 00:00:00' AS dt
        UNION ALL
        SELECT '2003-04-02 00:00:00'
        UNION ALL
        SELECT '2003-04-03 00:00:00'
        UNION ALL
        SELECT '2003-04-04 00:00:00'
        UNION ALL
        SELECT '2003-04-05 00:00:00'
        UNION ALL
        SELECT '2003-04-06 00:00:00'
        UNION ALL
        SELECT '2003-04-07 00:00:00'
    ) as t
    left join (
        select date,
            count (distinct trip.trip_no) as кол - во
        from Pass_in_trip
            left join Trip on Trip.trip_no = Pass_in_trip.trip_no
        where date between '2003-04-01 00:00:00' and '2003-04-07 00:00:00'
            and town_from = 'Rostov'
        group by date
    ) as t1 on t.dt = t1.date