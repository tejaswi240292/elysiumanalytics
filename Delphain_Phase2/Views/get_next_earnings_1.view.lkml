view: get_next_earnings_1 {
  derived_table: {
    sql: SELECT sqa.Symbol                                                                                  as Symbol
               ,sqa.[Date]                                                                                  as Earning_Date
               ,sqa.Next_Earning_Date                                                                       as Next_Earning_Date
               ,c.MarketDate                                                                                as Next_Date
               ,sqaa.PriceOnEarning                                                                         as PriceOnEarning
               ,sqab.PriceOnNextEarning                                                                     as PriceOnNextEarning
               ,d.[Close]                                                                                   as PriceOnNextDate
               ,((d.[Close]-sqab.PriceOnNextEarning)/sqab.PriceOnNextEarning)*100                           as Next_Prec_Move
               ,Min(sqac.[Close])                                                                           as MINClose
               ,Max(sqac.[Close])                                                                           as MAXClose
               ,(((max(sqac.[Close])-d.[Close])/d.[Close]) * 100)                                           as MAXClosePerc
               ,(((min(sqac.[Close])-d.[Close])/d.[Close]) * 100)                                           as MINClosePerc

FROM

(
SELECT a.Symbol,a.[Date],min(b.[Date]) as Next_Earning_Date,ROW_NUMBER () OVER(PARTITION BY a.Symbol ORDER BY a.Symbol,a.[Date] desc)  as Dte_Range
FROM Stock_Quotes_Adj a
inner join
(select  Symbol,[Date],[Close]
  from Stock_Quotes_Adj
  where Flags = 'P'  ) b
on  a.Symbol= b.Symbol
and a.[Date]<b.[Date]
WHERE a.Flags = 'E'
AND YEAR(a.[DATE]) > 2006
group by a.Symbol,a.[Date]
) sqa

left outer join
(select Symbol,[Date],[Close] as PriceOnEarning
from  Stock_Quotes_Adj) sqaa
on sqa.Symbol=sqaa.Symbol
and sqa.[Date]=sqaa.[Date]

left outer join
(select Symbol,[Date],[Close] as PriceOnNextEarning
from  Stock_Quotes_Adj
) sqab
on sqa.Symbol=sqab.Symbol
and sqa.Next_Earning_Date=sqab.[Date]


left outer join
(SELECT MarketDate
FROM Market_OpenDates) c
on c.MarketDate > sqa.[Date]
and c.MarketDate <= DATEADD(MONTH,1,sqa.[Date])

left outer join
(SELECT Symbol,[Date],[Close]
FROM Stock_Quotes_Adj
Where Symbol= 'AAPL'
) d
on c.MarketDate=d.[Date]

left outer join
(SELECT Symbol,[Date],[Close]
   FROM Stock_Quotes_Adj)  sqac
on sqa.Symbol= sqac.Symbol



WHERE sqa.Symbol ={% parameter symb %}
and sqa.[Date] = {% parameter dte %}
and sqac.[Date] >= sqa.Next_Earning_Date
and sqac.[Date] <= c.MarketDate
and sqa.Dte_Range between 1 and 16
group by   sqa.Symbol ,sqa.[Date]  ,sqa.Next_Earning_Date  ,c.MarketDate,sqaa.PriceOnEarning,sqab.PriceOnNextEarning ,d.[Close] ,((d.[Close]-sqab.PriceOnNextEarning)/sqab.PriceOnNextEarning)*100
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter:symb {
    type: string
  }

  parameter:dte {
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

  dimension: next_earning_date {
    type: date
    sql: ${TABLE}.Next_Earning_Date ;;
  }

  dimension: next_date {
    type: date
    sql: ${TABLE}.Next_Date ;;
  }

  dimension: price_on_earning {
    type: number
    sql: ${TABLE}.PriceOnEarning ;;
  }

  dimension: price_on_next_earning {
    type: number
    sql: ${TABLE}.PriceOnNextEarning ;;
  }

  dimension: price_on_next_date {
    type: number
    sql: ${TABLE}.PriceOnNextDate ;;
  }

  dimension: next_prec_move {
    type: number
    sql: ${TABLE}.Next_Prec_Move ;;
  }

  dimension: minclose {
    type: number
    sql: ${TABLE}.MINClose ;;
  }

  dimension: maxclose {
    type: number
    sql: ${TABLE}.MAXClose ;;
  }

  dimension: maxclose_perc {
    type: number
    sql: ${TABLE}.MAXClosePerc ;;
  }

  dimension: minclose_perc {
    type: number
    sql: ${TABLE}.MINClosePerc ;;
  }

  measure: earn_date {
    type: date
    sql: ${TABLE}.Earning_Date ;;
  }

  measure: nxt_earn_date {
    type: date
    sql: ${TABLE}.Next_Earning_Date ;;
  }
  measure: nxt_date {
    type: date
    sql: ${TABLE}.Next_Date;;
  }

  set: detail {
    fields: [
      symbol,
      earning_date,
      next_earning_date,
      next_date,
      price_on_earning,
      price_on_next_earning,
      price_on_next_date,
      next_prec_move,
      minclose,
      maxclose,
      maxclose_perc,
      minclose_perc
    ]
  }
}
