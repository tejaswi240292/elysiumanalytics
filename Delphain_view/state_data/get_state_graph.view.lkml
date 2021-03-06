view: get_state_graph {
  derived_table: {
    sql: SELECT [Date]
      ,[Open]
       ,High
       ,Low
       ,[Close]
        ,[TC/YC] TC
from Stock_Quotes_Adj
where Symbol = {% parameter symbol %}
and [Date] between '20200101' and  {% parameter dte %}
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: symbol {
    type: string
  }

  parameter: dte {
    type: date
  }

  dimension: date {
    type: date_time
    sql: ${TABLE}.Date ;;
  }

  dimension: open {
    type: number
    sql: ${TABLE}."Open" ;;
  }

  dimension: high {
    type: number
    sql: ${TABLE}.High ;;
  }

  dimension: low {
    type: number
    sql: ${TABLE}.Low ;;
  }

  dimension: close {
    type: number
    sql: ${TABLE}."Close" ;;
  }

  dimension: tc {
    type: number
    sql: ${TABLE}.TC ;;
  }

  measure: High {
    type: sum
    sql: ${TABLE}.High ;;
    html:
    <ul>
    <li> High: {{ rendered_value }} </li>
    </ul> ;;
  }

  set: detail {
    fields: [
      date,
      open,
      high,
      low,
      close,
      tc
    ]
  }
}
