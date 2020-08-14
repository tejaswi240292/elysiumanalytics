view: get_daily_news {
  derived_table: {
    sql: SELECT top (20) [ID]
      ,[Symbol]
      ,[figi_ticker]
      ,[figi]
      ,CONVERT(date,[publication_date]) as [publication_date]
      ,[title]
      ,[summary]
      ,[url]
  FROM [Key_Fundamentals].[dbo].[Tbl_DailyNewsMaster]
  where [Symbol] = {% parameter Symb %}
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: Symb {
    type: string
  }

  dimension: id {
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.Symbol ;;
  }

  dimension: figi_ticker {
    type: string
    sql: ${TABLE}.figi_ticker ;;
  }

  dimension: figi {
    type: string
    sql: ${TABLE}.figi ;;
  }

  dimension_group: publication_date {
    type: time
    sql: ${TABLE}.publication_date ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}.summary ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  set: detail {
    fields: [
      id,
      symbol,
      figi_ticker,
      figi,
      publication_date_time,
      title,
      summary,
      url
    ]
  }
}
