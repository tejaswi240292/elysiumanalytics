view: Events {
  derived_table: {
    sql: SELECT Ticker,DataDate [Date],Dividend,Split FROM [Key_Fundamentals]..EndOfDay
      WHERE {% condition Symbol %} Ticker {% endcondition %}
      and  {% condition Datefilter %} DataDate {% endcondition %}
       ;;
  }

  filter: Symbol {
    type: string
  }

  filter: Datefilter {
    type: date
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: date
    sql: ${TABLE}.Date ;;
  }

  dimension: dividend {
    type: number
    sql: ${TABLE}.Dividend ;;
  }

  dimension: split {
    type: string
    sql: ${TABLE}.Split ;;
  }

  set: detail {
    fields: [date, dividend, split]
  }
}
