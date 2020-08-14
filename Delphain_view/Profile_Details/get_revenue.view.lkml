view: get_revenue {
  derived_table: {
    sql: select top(1)
        a.Ticker
       ,a.reportperiod
       ,a.calendardate
       ,a.revenueusd/1000000 as revenueusd
       ,a.netinc/1000000 as netinc
       ,a.opinc/1000000 as opinc
       ,(CASE WHEN a.assets>0 THEN ((a.netinc - a.ncfo-a.ncfi)/a.assets)*100 ELSE 0 END) as Sloan_Ratio
       ,a.assets/1000000 as assets
     ,DATENAME(Month,DATEADD(month, b.[per_end_month_nbr]-1, CAST('2008-01-01' AS datetime)))  as Financial_Year_Ending
from  Key_Fundamentals.dbo.K2O_US_Fundamentals_Stag a
LEFT OUTER JOIN tbl_ZACKS_CP b
ON a.Ticker=b.Ticker
Where  dimension IN ('ART','MRT')
and reportperiod <= getdate()
and a.Ticker = {%parameter sym%}
order by reportperiod DESC
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  parameter: sym {
    type: string
  }

  dimension: ticker {
    type: string
    sql: ${TABLE}.Ticker ;;
  }

  dimension: reportperiod {
    type: date
    sql: ${TABLE}.reportperiod ;;
  }

  dimension: calendardate {
    type: date
    sql: ${TABLE}.calendardate ;;
  }

  dimension: revenueusd {
    type: number
    sql: ${TABLE}.revenueusd ;;
  }

  dimension: netinc {
    type: number
    sql: ${TABLE}.netinc ;;
  }

  dimension: opinc {
    type: number
    sql: ${TABLE}.opinc ;;
  }

  dimension: sloan_ratio {
    type: number
    sql: ${TABLE}.Sloan_Ratio ;;
  }

  dimension: assets {
    type: number
    sql: ${TABLE}.assets ;;
  }

  dimension: financial_year_ending {
    type: string
    sql: ${TABLE}.Financial_Year_Ending ;;
  }

  set: detail {
    fields: [
      ticker,
      reportperiod,
      calendardate,
      revenueusd,
      netinc,
      opinc,
      sloan_ratio,
      assets,
      financial_year_ending
    ]
  }
}
