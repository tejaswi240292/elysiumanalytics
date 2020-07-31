view: test_view {
  derived_table: {
    sql: SELECT Symbol,[Date],[Close]

            FROM (SELECT Symbol, [Date],[Close], ROW_NUMBER() OVER (PARTITION BY Symbol,YEAR([Date]), Month([Date]) ORDER BY [Date] ) 'RowRank'
                  FROM Stock_Quotes_Adj
                  WHERE [Date]>='20170720' AND [Date]<='20200720' AND Symbol = 'AAPL'  )sub
            WHERE RowRank = 1
             ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.Symbol ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.Date ;;
  }

  dimension: close {
    type: number
    sql: ${TABLE}."Close" ;;
  }

  set: detail {
    fields: [symbol, date, close]
  }
}
