view: ChartDisplay {
  derived_table: {
    sql: SELECT [Date],[Open],High,Low,[Close],[TC/YC] TC
      from Stock_Quotes_Adj where Symbol = 'AAPL' and [Date] between '2007-01-01' and '2020-08-25'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: date
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
