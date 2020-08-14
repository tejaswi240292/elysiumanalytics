view: get_share_earnings_dividends {
  derived_table: {
    sql: SELECT cast([eps_act_fr0] as NUMERIC(18,4)) as'For Year Ending 1' ,
       cast([eps_mean_est_fr1] as  NUMERIC(18,4)) 'For Year Ending 2' ,
       cast([eps_mean_est_fr2] as  NUMERIC(18,4)) 'For Year Ending 3' ,
        DATEADD(Month,-12,CAST ([per_end_date_fr1] AS DATE)) as 'Year Ending 1',
       [per_end_date_fr1] as 'Year Ending 2',
       [per_end_date_fr2] as 'Year Ending 3' ,
       CAST(iad AS NUMERIC(18,4)) as 'Annual Dividend'
       FROM tbl_ZACKS_CP CP
       INNER JOIN Stock_Symbols SS
       ON CP.ticker=SS.[stock Symbol]
       WHERE Ticker={% parameter symb %}
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: symb {
    type: string
  }

  dimension: for_year_ending_1 {
    type: number
    label: "For Year Ending 1"
    sql: ${TABLE}."For Year Ending 1" ;;
  }

  dimension: for_year_ending_2 {
    type: number
    label: "For Year Ending 2"
    sql: ${TABLE}."For Year Ending 2" ;;
  }

  dimension: for_year_ending_3 {
    type: number
    label: "For Year Ending 3"
    sql: ${TABLE}."For Year Ending 3" ;;
  }

  dimension: year_ending_1 {
    type: date
    label: "Year Ending 1"
    sql: ${TABLE}."Year Ending 1" ;;
  }

  dimension: year_ending_2 {
    type: string
    label: "Year Ending 2"
    sql: ${TABLE}."Year Ending 2" ;;
  }

  dimension: year_ending_3 {
    type: string
    label: "Year Ending 3"
    sql: ${TABLE}."Year Ending 3" ;;
  }

  dimension: annual_dividend {
    type: number
    label: "Annual Dividend"
    sql: ${TABLE}."Annual Dividend" ;;
  }

  set: detail {
    fields: [
      for_year_ending_1,
      for_year_ending_2,
      for_year_ending_3,
      year_ending_1,
      year_ending_2,
      year_ending_3,
      annual_dividend
    ]
  }
}
