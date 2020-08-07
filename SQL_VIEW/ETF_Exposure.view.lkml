view: ETF_Exposure {
  derived_table: {
    sql: SELECT * FROM (SELECT *,(SELECT top(1)[CLOSE] FROM [Key_Fundamentals].[dbo].EndofDay SQ where SQ.Ticker=Symbol1 and
        {% condition Datefilter %} Datadate {% endcondition %} order by Datadate desc) AS [Close] from
              (SELECT [Composite Ticker] Symbol1,[Composite Name] Name,
              CAST([Weighting] AS DECIMAL(18,4))*100 [Weighting],[Total Shares Held] TotalShares,[Market Value] MarketValue,[Currency],[MarketCap]
            FROM [Key_Fundamentals].[dbo].[US-Equity-Constituents] WHERE
          {% condition Symbol %} [Constituent Ticker] {% endcondition %} AND
          ISNULL( [Composite Ticker],'')<>'' ) a) b
          WHERE b.[Close] IS NOT NULL
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

  dimension: symbol1 {
    type: string
    sql: ${TABLE}.Symbol1 ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: weighting {
    type: number
    sql: ${TABLE}.Weighting ;;
  }

  dimension: total_shares {
    type: number
    sql: ${TABLE}.TotalShares ;;
  }

  dimension: market_value {
    type: string
    sql: ${TABLE}.MarketValue ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.Currency ;;
  }

  dimension: market_cap {
    type: string
    sql: ${TABLE}.MarketCap ;;
  }

  dimension: close {
    type: string
    sql: ${TABLE}."Close" ;;
  }

  set: detail {
    fields: [
      symbol1,
      name,
      weighting,
      total_shares,
      market_value,
      currency,
      market_cap,
      close
    ]
  }
}
