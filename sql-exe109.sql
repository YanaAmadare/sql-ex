select q_name,
    Whites,
    Blacks
from (
        select Whites,
            Blacks
        from (
                select count(q_name) as Whites
                from (
                        select q_name
                        from (
                                select distinct q_name,
                                    v_color
                                from (
                                        select Q_NAME,
                                            b_vol,
                                            case
                                                when v_color = 'R' then 1
                                                when v_color = 'G' then 10
                                                when v_color = 'B' then 100
                                            end v_color,
                                            sum(b_vol) OVER(PARTITION BY q_id, V_COLOR) as Итого_каждого_цвета_на_квадрат
                                        from utQ
                                            left join utB on utB.B_Q_ID = utQ.Q_ID
                                            left join utV on utV.V_ID = utB.B_V_ID
                                    ) t
                                where Итого_каждого_цвета_на_квадрат = 255
                            ) t1
                        group by q_name
                        having sum(v_color) = 111
                    ) as t2
            ) as t3
            cross join (
                select count(q_name) as Blacks
                from utQ
                    left join utB on utB.B_Q_ID = utQ.Q_ID
                    left join utV on utV.V_ID = utB.B_V_ID
                where v_color is null
            ) as t4
    ) as t5
    cross join (
        select q_name
        from (
                select distinct q_name,
                    v_color
                from (
                        select Q_NAME,
                            b_vol,
                            case
                                when v_color = 'R' then 1
                                when v_color = 'G' then 10
                                when v_color = 'B' then 100
                            end v_color,
                            sum(b_vol) OVER(PARTITION BY q_id, V_COLOR) as Итого_каждого_цвета_на_квадрат
                        from utQ
                            left join utB on utB.B_Q_ID = utQ.Q_ID
                            left join utV on utV.V_ID = utB.B_V_ID
                    ) t
                where Итого_каждого_цвета_на_квадрат = 255
                    or v_color is null
            ) t1
        group by q_name
        having sum(v_color) = 111
            or sum(v_color) is null
    ) as t6