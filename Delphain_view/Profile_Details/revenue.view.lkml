view: revenue {
  derived_table: {
    sql: select top(1)
       Ticker
       ,revenueusd/1000000 as revenueusd
       ,netinc/1000000 as netinc
       ,opinc/1000000 as opinc
       ,(CASE WHEN assets>0 THEN ((netinc - ncfo-ncfi)/assets)*100 ELSE 0 END) as Sloan_Ratio
       ,assets/1000000 as assets

from  Key_Fundamentals.dbo.K2O_US_Fundamentals_Stag

where {% condition Symbol %} Ticker {% endcondition %}
AND calendardate<='20200720'
AND {% condition datefilter %} calendardate {% endcondition %}
and dimension IN ('ART','MRT')
order by reportperiod DESC ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  filter: Symbol {
    type: string
  }

  filter: datefilter {
    type: date
  }

  dimension: ticker {
    type: string
    sql: ${TABLE}.Ticker ;;
  }

  dimension: Total_Revenue_TTM {
    type: number
    sql: ${TABLE}.revenueusd
    value_format: "0 \" Billions\"";;
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


  set: detail {
    fields: [
      ticker,
      Total_Revenue_TTM,
      netinc,
      opinc,
      sloan_ratio,
      assets
    ]
  }
}
