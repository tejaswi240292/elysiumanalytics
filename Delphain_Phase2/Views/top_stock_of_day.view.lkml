view: top_stock_of_day {
  derived_table: {
    sql: select top 1 symbol from Stock_Quotes_Adj where symbol not in ('SPX','NDX','AMZN') and [Date]='20200722' order by [Close] desc
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
