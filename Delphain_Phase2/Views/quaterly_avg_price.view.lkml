view: quaterly_avg_price {
  derived_table: {
    sql: SELECT b.Quater
      ,avg(a.[Close]) as quat_avg_price
       ,max(a.[Close]) as quat_max_price
       ,min(a.[Close]) as quat_min_price

from Stock_Quotes_Adj a
left outer join
(select a.Symbol
      ,a.[Date] as dte
    ,Q.Quater
    ,Q.CAL_QTR
    ,Q.CAL_YEAR
    ,FIRST_VALUE(a.[Date]) OVER ( ORDER BY a.[Date] ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) as prev_quat_dte

from Stock_Quotes_Adj a
left outer join(
SELECT code,[Date]
      ,CAL_YEAR+'-'+'Q'+CAL_QTR as Quater
    ,CAL_QTR,CAL_YEAR
FROM [ZacksEarningSurpriseZES-1]
) Q
on a.Symbol=Q.code
and a.[Date]= Q.[Date]
WHERE a.Symbol = {% parameter symb %}
AND a.Flags = 'E'
AND YEAR(a.[Date])> 2015) b
 on a.Symbol=b.Symbol

 where a.Symbol={% parameter symb %}
 and a.[Date] between b.prev_quat_dte and b.dte
group by b.Quater
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  parameter: symb {
    type: string
  }
  dimension: quater {
    type: string
    sql: ${TABLE}.Quater ;;
  }

  dimension: quat_avg_price {
    type: number
    sql: ${TABLE}.quat_avg_price ;;
  }

  dimension: quat_max_price {
    type: number
    sql: ${TABLE}.quat_max_price ;;
  }

  dimension: quat_min_price {
    type: number
    sql: ${TABLE}.quat_min_price ;;
  }

  set: detail {
    fields: [quater, quat_avg_price, quat_max_price, quat_min_price]
  }
}
