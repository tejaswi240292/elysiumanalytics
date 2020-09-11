view: get_analyst_rating {
  derived_table: {
    sql: select a.*
      ,kuf.Grade
    ,kuf.Revenue
    ,kuf.FinalScore

from

(select Ticker, CalendarDate,Dimension,fScore,mScore,zScore,Sloan_Ratio,ROW_NUMBER () over (partition by Ticker order by CalendarDate desc) as Date_Row
from [Key_Fundamentals].[dbo].[K2O_Fundamentals_Score]
where Ticker = COALESCE(NULLIF({% parameter symb %},'NULL'), (select top 1 symbol from Stock_Quotes_Adj where symbol not in ('SPX','NDX') and [Date]='20200722' order by [Close] desc))
and Dimension = 'ARQ') a

left outer join [Key_Fundamentals].[dbo].K2O_US_Fundamentals_Grade  kuf

on a.Ticker=kuf.Symbol
and a.CalendarDate=kuf.CalendarDate
and a.Dimension=kuf.Dimension

where a.Date_Row <= {% parameter tot_quaters %}
  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: tot_quaters  {
    type: number
  }

  parameter: symb  {
    type: string
    default_value: "NULL"
  }

  dimension: ticker {
    type: string
    sql: ${TABLE}.Ticker ;;
  }

  dimension: calendar_date {
    type: date
    sql: ${TABLE}.CalendarDate ;;
  }

  dimension: dimension {
    type: string
    sql: ${TABLE}.Dimension ;;
  }

  dimension: f_score {
    type: number
    sql: ${TABLE}.fScore ;;
  }

  dimension: m_score {
    type: number
    sql: ${TABLE}.mScore ;;
  }

  dimension: z_score {
    type: number
    sql: ${TABLE}.zScore ;;
  }

  dimension: sloan_ratio {
    type: number
    sql: ${TABLE}.Sloan_Ratio ;;
  }

  dimension: date_row {
    type: number
    sql: ${TABLE}.Date_Row ;;
  }

  dimension: grade {
    type: string
    sql: ${TABLE}.Grade ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.Revenue ;;
  }

  dimension: final_score {
    type: number
    sql: ${TABLE}.FinalScore ;;
  }

  measure: grde {
    type: string
    sql: ${TABLE}.Grade ;;
  }

  measure: fnl_score {
    type: number
    sql: ${TABLE}.FinalScore ;;
  }

  set: detail {
    fields: [
      ticker,
      calendar_date,
      dimension,
      f_score,
      m_score,
      z_score,
      sloan_ratio,
      date_row,
      grade,
      revenue,
      final_score
    ]
  }
}
