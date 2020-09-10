view: previous_earnings {
  derived_table: {
    sql: SELECT  sqa.Symbol       as Symbol
       ,sqa.[Date]       as Earning_Date
       ,c.MarketDate     as Prev_Date
       ,d.[Close]        as Prev_PriceOnEarning
       ,((sqa.[Close]-d.[Close])/d.[Close])*100   as Prev_Prec_Move
FROM

(SELECT Symbol,[Date],[Close],ROW_NUMBER () OVER(PARTITION BY Symbol ORDER BY Symbol,[Date] desc)  as Dte_Range
FROM Stock_Quotes_Adj
WHERE Flags = 'E'
AND YEAR([DATE]) > 2006
) sqa

 left outer join
 (SELECT MarketDate
 FROM Market_OpenDates) c
 on c.MarketDate between DATEADD(MONTH,-1,sqa.[Date]) and sqa.[Date]

 left outer join
(SELECT Symbol,[Date],[Close]
FROM Stock_Quotes_Adj
--Where Symbol= 'AAPL'
) d
on c.MarketDate=d.[Date]

WHERE sqa.Symbol = {% parameter symb %}
and sqa.Symbol=d.Symbol
and  sqa.[Date] = {% parameter dte %}
and sqa.Dte_Range <= 16
;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

 parameter: symb {
    type: string
  }

  parameter: dte {
    type: date
  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.Symbol ;;
  }

  dimension: earning_date {
    type: date
    sql: ${TABLE}.Earning_Date ;;
  }

  dimension: prev_date {
    type: date
    sql: ${TABLE}.Prev_Date ;;
  }

  dimension: prev_price_on_earning {
    type: number
    sql: ${TABLE}.Prev_PriceOnEarning ;;
  }

  dimension: prev_prec_move {
    type: number
    sql: ${TABLE}.Prev_Prec_Move ;;
  }

  set: detail {
    fields: [symbol, earning_date, prev_date, prev_price_on_earning, prev_prec_move]
  }
}
