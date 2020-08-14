view: get_score {
derived_table: {
  sql: SELECT TOP (1) Ticker , calendardate , fScore,mScore,zScore from [Key_Fundamentals].[dbo].[K2O_Fundamentals_Score]
       where {% condition Symbol %} Ticker {% endcondition %} and  {% condition Datefilter %} calendardate {% endcondition %}
       order by calendardate desc
    ;;
}

filter: Symbol {
  type: string
}

filter: Datefilter {
  type: date
}

dimension: Ticker {
    type: string
    sql: ${TABLE}.Ticker ;;
}

dimension_group: calendardate {
    type: time
    sql: ${TABLE}.calendardate ;;
}

dimension: Piotroski_F_Score {
  type: number
  sql: ${TABLE}.fScore ;;
}

dimension: Beneish_M_Score   {
  type: number
  sql: ${TABLE}.mScore ;;
}

dimension: Altman_Z_Score {
  type: number
  sql: ${TABLE}.zScore ;;
}

set: detail {
  fields: [ Piotroski_F_Score , Beneish_M_Score, Altman_Z_Score ]
}
}
