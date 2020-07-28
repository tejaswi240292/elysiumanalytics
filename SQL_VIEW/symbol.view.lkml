view: symbol {
  derived_table: {
    sql: select [stock symbol] from Stock_Symbols
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: stock_symbol {
    type: string
    label: "stock symbol"
    sql: ${TABLE}."stock symbol" ;;
  }

  set: detail {
    fields: [stock_symbol]
  }
}
