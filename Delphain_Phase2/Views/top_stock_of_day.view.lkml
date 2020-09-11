view: top_stock_of_day {
  derived_table: {
    sql: select distinct symbol from Stock_Quotes_Adj where symbol not in ('SPX','NDX') and [Date]='20200722'
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.symbol ;;
  }

  set: detail {
    fields: [symbol]
  }
}
