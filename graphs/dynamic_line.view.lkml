view: dynamic_line {
  derived_table: {
    sql: SELECT [Date], [Open],High,Low,[Close],[TC/YC] TC
      from Stock_Quotes_Adj
      where Symbol = 'AAPL'
      and [Date] between '20200601' and '20200601'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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
