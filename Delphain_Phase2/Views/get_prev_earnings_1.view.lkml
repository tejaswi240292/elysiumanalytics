view: get_prev_earnings_1 {
  derived_table: {
    sql: SELECT  sqa.Symbol                                                      as Symbol
       ,sqa.[Date]                                                               as Earning_Date
       ,sqa.[Close]                                                              as Price_OnEarning
       ,c.MarketDate                                                             as Prev_Date
       ,d.[Close]                                                                as Prev_PriceOnEarning
       ,((sqa.[Close]-d.[Close])/d.[Close])*100                                  as Prev_Prec_Move
     ,ed.OptionExp                                                               as OptionExp
     ,min(qs.iv30mean)                                                           as IV30OnEarning
     ,min(qs_prev.iv30mean)                                                      as IV30_Prev
     ,(min(qs.iv30mean)-min(qs_prev.iv30mean))                                   as VolRise
     ,((min(qs.iv30mean)-min(qs_prev.iv30mean))/min(qs_prev.iv30mean))*100       as VolRisePerc
     ,min(oe.ATM_IV)                                                             as ATMIVOnEarning
     ,min(oe_prev.ATM_IV)                                                        as ATMIV_Prev
       ,min(oe.ATM_IV)-min(oe_prev.ATM_IV)                                       as ATMIvRise
     ,((min(oe.ATM_IV)-min(oe_prev.ATM_IV))/min(oe_prev.ATM_IV))*100             as ATMIvRisePerc
     ,min(sqac.[Close])                                                          as MINClose
     ,max(sqac.[Close])                                                          as MAXClose
     ,(((max(sqac.[Close])-d.[Close])/d.[Close]) * 100)                          as MAXClosePerc
     ,(((min(sqac.[Close])-d.[Close])/d.[Close]) * 100)                          as MINClosePerc


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
Where Symbol= 'AAPL'
) d
on c.MarketDate=d.[Date]

left outer join
(SELECT Symbol
       ,quotedate
       ,iv30mean
FROM Option_Stats) qs
on  sqa.Symbol  = qs.Symbol
AND  sqa.[Date] = qs.quotedate

left outer join
(SELECT Symbol
       ,quotedate
       ,iv30mean
FROM Option_Stats) qs_prev
 on c.MarketDate = qs_prev.quotedate

 left outer join
(SELECT Symbol
       ,EarningDate
     ,OptionExp
From Earnings_Data) ed
on sqa.Symbol=ed.Symbol
and sqa.[Date]=ed.EarningDate

left outer join
(SELECT  Symbol
        ,ATM_IV
        ,DataDate
        ,optionExpDate
FROM Option_ExpDates
) oe
on  ed.Symbol       = oe.Symbol
AND ed.EarningDate  = oe.DataDate
AND ed.OptionExp    = oe.optionExpDate

left outer join
(SELECT  Symbol
        ,ATM_IV
        ,DataDate
        ,optionExpDate
FROM Option_ExpDates
) oe_prev
on  ed.Symbol       = oe_prev.Symbol
AND ed.OptionExp    = oe_prev.optionExpDate

left outer join
(SELECT Symbol,[Date],[Close]
   FROM Stock_Quotes_Adj)  sqac
on sqa.Symbol= sqac.Symbol

WHERE sqa.Symbol    ={% parameter symb %}
and qs_prev.Symbol  = sqa.Symbol
AND c.MarketDate    = oe_prev.DataDate
and sqac.[Date]    >=   c.MarketDate
and sqac.[Date]    <=  sqa.[Date]
and sqa.[Date]      = {% parameter dte %}
and sqa.Dte_Range  <= 16

group by sqa.Symbol,sqa.[Date],sqa.[Close],c.MarketDate,d.[Close],((sqa.[Close]-d.[Close])/d.[Close])*100,ed.OptionExp
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

  dimension: price_on_earning {
    type: number
    sql: ${TABLE}.Price_OnEarning ;;
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

  dimension: option_exp {
    type: date
    sql: ${TABLE}.OptionExp ;;
  }

  dimension: iv30_on_earning {
    type: number
    sql: ${TABLE}.IV30OnEarning ;;
  }

  dimension: iv30_prev {
    type: number
    sql: ${TABLE}.IV30_Prev ;;
  }

  dimension: vol_rise {
    type: number
    sql: ${TABLE}.VolRise ;;
  }

  dimension: vol_rise_perc {
    type: number
    sql: ${TABLE}.VolRisePerc ;;
  }

  dimension: atmivon_earning {
    type: number
    sql: ${TABLE}.ATMIVOnEarning ;;
  }

  dimension: atmiv_prev {
    type: number
    sql: ${TABLE}.ATMIV_Prev ;;
  }

  dimension: atmiv_rise {
    type: number
    sql: ${TABLE}.ATMIvRise ;;
  }

  dimension: atmiv_rise_perc {
    type: number
    sql: ${TABLE}.ATMIvRisePerc ;;
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
    sql:${TABLE}.Earning_Date;;
  }

  measure: prv_dte {
    type: date
    sql:${TABLE}.Prev_Date;;
  }

  set: detail {
    fields: [
      symbol,
      earning_date,
      price_on_earning,
      prev_date,
      prev_price_on_earning,
      prev_prec_move,
      option_exp,
      iv30_on_earning,
      iv30_prev,
      vol_rise,
      vol_rise_perc,
      atmivon_earning,
      atmiv_prev,
      atmiv_rise,
      atmiv_rise_perc,
      minclose,
      maxclose,
      maxclose_perc,
      minclose_perc
    ]
  }
}
