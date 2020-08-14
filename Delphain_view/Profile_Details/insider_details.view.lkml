view: insider_details {
  derived_table: {
    sql: SELECT top(1) Ticker,Datadate, [CLOSE] FROM [Key_Fundamentals].[dbo].EndofDay SQ
    where {% condition Symbol %} Ticker {% endcondition %} and  {% condition Datefilter %} Datadate {% endcondition %}
    order by Datadate desc
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  filter: Symbol {
    type: string
  }

  filter: Datefilter {
    type: date
  }


  dimension: ticker {
    type: string
    sql: ${TABLE}.Ticker ;;
  }

  dimension_group: datadate {
    type: time
    sql: ${TABLE}.Datadate ;;
  }

  dimension: close {
    type: string
    sql: ${TABLE}."CLOSE" ;;
  }

  set: detail {
    fields: [ticker,close]
  }
}
