view: get_score_1 {
  derived_table: {
    sql: SELECT TOP (1) a.Ticker , a.calendardate , fScore,mScore,zScore,b.Sloan_Ratio
      from [Key_Fundamentals].[dbo].[K2O_Fundamentals_Score] a
      left outer join
      (select top (1)Ticker , (CASE WHEN assets>0 THEN ((netinc - ncfo-ncfi)/assets)*100 ELSE 0 END) as Sloan_Ratio
      from [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag]
      where dimension IN ('ART','MRT')
      and reportperiod <= getdate()
      and Ticker = {% parameter symb %}
      order by reportperiod DESC) b
      on a.Ticker=b.Ticker
      where  a.Ticker   = {% parameter symb %}
      and   a.calendardate <= getdate()
       order by calendardate desc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: symb {
    type: string
  }

  dimension: ticker {
    type: string
    sql: ${TABLE}.Ticker ;;
  }

  dimension: calendardate {
    type: date
    sql: ${TABLE}.calendardate ;;
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

  set: detail {
    fields: [
      ticker,
      calendardate,
      f_score,
      m_score,
      z_score,
      sloan_ratio
    ]
  }
}
