view: get_earnings_1 {
  derived_table: {
    sql: SELECT distinct top 16     a.Symbol           as Symbol
              ,a.[Date]                                as Earning_Date
              ,q.Quater                                as Quater
              ,cast(q.CAL_YEAR as int)                 as Calender_Year
              ,q.CAL_QTR                               as Calender_Quater
              ,min(b.[Date])                           as Next_Earning_Date
              ,max(c.[OptionExp])                      as Earning_Mnthly_Expiry
              ,ROUND(oe.Earning_Expected_Move_Perc,2)  as Earning_Expected_Move_Percent
              ,ROUND(oe.StraddleCost,2)                as StraddleCost
              ,oe.Expected_Move_Price                  as Expected_Move_Price
              ,oe.StraddleCost_Price                   as StraddleCost_Price
              ,max(oe.ATM_IV)                          as ATMIVOnEarning
              ,max(oe_nxt.ATM_IV)                      as ATMIVOnEarningNext
              ,max(os.iv30mean)                        as iv30mean
              ,max(os_nxt.iv30mean)                    as IV30OnEarningNext
              ,a.[Close]                               as PriceOnEarning
              ,b.[Close]                               as PriceOnNextEarning
              ,min(d.[Close])                          as Prev_Mnth_Min_Price
              ,max(d.[Close])                          as Prev_Mnth_Max_Price
              ,min(e.[Close])                          as Next_Mnth_Min_Price
              ,max(e.[Close])                          as Next_Mnth_Max_Price

FROM Stock_Quotes_Adj a

left outer join
(SELECT Symbol,[Close] , [DATE]
FROM Stock_Quotes_Adj
WHERE Flags = 'P' ) b
on a.Symbol=b.Symbol
and a.[DATE]<b.[DATE]

left outer join
(SELECT Symbol,EarningDate,OptionExp
From Earnings_Data) c
on a.Symbol=c.Symbol
and a.[Date]=c.EarningDate

left outer join
(SELECT Symbol
       ,optionExpDate
     ,Straddle_Cost as StraddleCost_Price
     ,DataDate,Expected_Move as Expected_Move_Price
     ,ATM_IV
     ,(Expected_Move/Close_Price)*100 as Earning_Expected_Move_Perc
     ,(Straddle_Cost/Close_Price)*100 as StraddleCost
FROM Option_ExpDates) oe
on  c.EarningDate=oe.[DataDate]
AND c.[OptionExp]=oe.optionExpDate
AND c.Symbol=oe.Symbol

left outer join
(SELECT Symbol
       ,optionExpDate
     ,Straddle_Cost as StraddleCost_Price
     ,DataDate,Expected_Move as Expected_Move_Price
     ,ATM_IV
     ,(Expected_Move/Close_Price)*100 as Earning_Expected_Move_Perc
     ,(Straddle_Cost/Close_Price)*100 as StraddleCost
FROM Option_ExpDates) oe_nxt
on c.[OptionExp]  = oe_nxt.optionExpDate
AND c.Symbol      = oe_nxt.Symbol

left outer join
(SELECT Symbol,[Close],[DATE]
FROM Stock_Quotes_Adj ) d
on a.Symbol=d.Symbol
and d.[DATE] between DATEADD(MONTH,-1,a.[Date]) and  a.[Date]

left outer join
(SELECT Symbol,[Close],[DATE]
FROM Stock_Quotes_Adj ) e
on a.Symbol=e.Symbol
and e.[DATE] between  a.[Date] and DATEADD(MONTH,1,a.[Date])

left outer join
(SELECT Symbol,quotedate,iv30mean
FROM Option_Stats) os
 on a.Symbol = os.Symbol
AND a.[Date] = os.quotedate

left outer join
(SELECT Symbol,quotedate,iv30mean
FROM Option_Stats) os_nxt
 on b.Symbol = os_nxt.Symbol
AND b.[Date] = os_nxt.quotedate

left outer join(
SELECT code,[Date],'Q'+CAL_QTR+'`'+RIGHT((CAL_YEAR),2) as Quater,CAL_QTR,CAL_YEAR
FROM [ZacksEarningSurpriseZES-1]
) Q
on a.Symbol=Q.code
and a.[Date]= Q.[Date]


WHERE a.Symbol = {% parameter symb %}
AND a.Flags = 'E'
AND a.[Date] <= {% parameter dte %}
AND YEAR(a.[DATE]) > 2006
AND b.[DATE]=oe_nxt.[DataDate]
group by a.Symbol,a.[Date],q.Quater,a.[Close],b.[Close],oe.Expected_Move_Price,oe.Earning_Expected_Move_Perc,oe.StraddleCost_Price,oe.StraddleCost,CAL_QTR,CAL_YEAR
Order by a.[Date]  desc
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
    link:
    {
      label: "Load Previous Month Details"
      url: "/dashboards/276?Symbol={{symbol._value}}&Date={{value}}"
    }
    link:
    {
      label: "Load Next Month Details"
      url: "/dashboards/276?Symbol={{symbol._value}}&Date={{value}}"
    }
  }

  dimension: quater {
    type: string
    sql: ${TABLE}.Quater ;;
  }

  dimension: calender_year {
    type: string
    sql: ${TABLE}.Calender_Year ;;
  }

  dimension: calender_quater {
    type: number
    sql: ${TABLE}.Calender_Quater ;;
  }

  dimension: next_earning_date {
    type: date
    sql: ${TABLE}.Next_Earning_Date ;;
  }

  dimension: earning_mnthly_expiry {
    type: date
    sql: ${TABLE}.Earning_Mnthly_Expiry ;;
  }

  dimension: earning_expected_move_percent {
    type: number
    sql: ${TABLE}.Earning_Expected_Move_Percent ;;
  }

  dimension: straddle_cost {
    type: number
    sql: ${TABLE}.StraddleCost ;;
  }

  dimension: expected_move_price {
    type: number
    sql: ${TABLE}.Expected_Move_Price ;;
  }

  dimension: straddle_cost_price {
    type: number
    sql: ${TABLE}.StraddleCost_Price ;;
  }

  dimension: atmivon_earning {
    type: number
    sql: ${TABLE}.ATMIVOnEarning ;;
  }

  dimension: atmivon_earning_next {
    type: number
    sql: ${TABLE}.ATMIVOnEarningNext ;;
  }

  dimension: iv30mean {
    type: number
    sql: ${TABLE}.iv30mean ;;
  }

  dimension: iv30_on_earning_next {
    type: number
    sql: ${TABLE}.IV30OnEarningNext ;;
  }

  dimension: price_on_earning {
    type: number
    sql: ${TABLE}.PriceOnEarning ;;
  }

  dimension: price_on_next_earning {
    type: number
    sql: ${TABLE}.PriceOnNextEarning ;;
  }

  dimension: prev_mnth_min_price {
    type: number
    sql: ${TABLE}.Prev_Mnth_Min_Price ;;
  }

  dimension: prev_mnth_max_price {
    type: number
    sql: ${TABLE}.Prev_Mnth_Max_Price ;;
  }

  dimension: next_mnth_min_price {
    type: number
    sql: ${TABLE}.Next_Mnth_Min_Price ;;
  }

  dimension: next_mnth_max_price {
    type: number
    sql: ${TABLE}.Next_Mnth_Max_Price ;;
  }

  measure: calen_quater {
    type: number
    sql:${TABLE}.Calender_Quater;;
    drill_fields: []
    link:
    {
      label: "Load Previous Month Details"
      url: "/dashboards/276?Symbol={{symbol._value}}&Date={{earning_date._value}}"
    }
    link:
    {
      label: "Load Next Month Details"
      url: "/dashboards/279?Symbol={{symbol._value}}&Date={{earning_date._value}}"
    }
  }

  measure: nxt_earn_date {
    type: date
    sql:${TABLE}.Next_Earning_Date;;

  }

  measure: earn_mnthly_exp {
    type: date
    sql:${TABLE}.Earning_Mnthly_Expiry;;
  }

  set: detail {
    fields: [
      symbol,
      earning_date,
      quater,
      calender_year,
      calender_quater,
      next_earning_date,
      earning_mnthly_expiry,
      earning_expected_move_percent,
      straddle_cost,
      expected_move_price,
      straddle_cost_price,
      atmivon_earning,
      atmivon_earning_next,
      iv30mean,
      iv30_on_earning_next,
      price_on_earning,
      price_on_next_earning,
      prev_mnth_min_price,
      prev_mnth_max_price,
      next_mnth_min_price,
      next_mnth_max_price
    ]
  }
}
