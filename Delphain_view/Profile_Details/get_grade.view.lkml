view: get_grade {
  derived_table: {
    sql: SELECT TOP (1) Symbol, calendardate, Grade, FinalScore
         from   [Key_Fundamentals].[dbo].K2O_US_Fundamentals_Grade
         where {% condition Symb %} Symbol {% endcondition %}
         and   Dimension = 'MRT'
         and   {% condition Datefilter %} calendardate {% endcondition %}
         order by calendardate desc
    ;;
  }

  filter: Symb {
    type: string
  }

  filter: Datefilter {
    type: date
  }

  dimension: Symbol {
    type: string
    sql: ${TABLE}.Symbol ;;
  }

  dimension_group: calendardate {
    type: time
    sql: ${TABLE}.calendardate ;;
  }

  dimension: Grade {
    type: string
    sql: ${TABLE}.Grade ;;
  }

  dimension: FinalScore_Score   {
    type: number
    sql: ${TABLE}.FinalScore ;;
  }


  set: detail {
    fields: [ Symbol,calendardate_date,Grade,FinalScore_Score ]
  }
}
