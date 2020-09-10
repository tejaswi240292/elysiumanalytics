view: get_top_stocks {
  derived_table: {
    sql: SELECT *
      FROM
      (select curr.Symbol
            ,curr.[Date]     as Curr_Date
            ,prev.[Date]     as Prev_Date
            ,curr.[Close]    as Curr_Close
            ,prev.[Close]    as Prev_Close
            ,((curr.[Close]-prev.[Close])/curr.[Close])*100 as Percent_Change
            ,row_number () over (partition by curr.Symbol order by prev.[Date] desc ) as prev_day
      from
      (select*
      from Stock_Quotes_Adj
      where year([Date])=2020) curr
      left outer join
      (select a.*,b.*
      from Stock_Quotes_Adj a,
      Market_OpenDates b
      where MarketDate = [Date]
      and year([Date])=2020
      ) prev
      on  curr.Symbol=prev.Symbol
      and curr.[Date]>prev.[Date]
      JOIN
           (select symbol
            from
            (select symbol,[Date],[Close],row_number() over (partition by [Date] order by [Close] desc ) close_rank
            from Stock_Quotes_Adj
            where [Date]='20200722'
            and symbol not in ('SPX','NDX')) a
            where close_rank <=10) TOP_STOCKS
      ON curr.Symbol=TOP_STOCKS.Symbol
      where  curr.[Date]= '20200722'
       ) a
       WHERE a.prev_day = 1
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

  dimension: curr_date {
    type: date
    sql: ${TABLE}.Curr_Date ;;
  }

  dimension: prev_date {
    type: date
    sql: ${TABLE}.Prev_Date ;;
  }

  dimension: curr_close {
    type: number
    sql: ${TABLE}.Curr_Close ;;
  }

  dimension: prev_close {
    type: number
    sql: ${TABLE}.Prev_Close ;;
  }

  dimension: percent_change {
    type: number
    sql: ${TABLE}.Percent_Change ;;
  }

  dimension: prev_day {
    type: number
    sql: ${TABLE}.prev_day ;;
  }

  set: detail {
    fields: [
      symbol,
      curr_date,
      prev_date,
      curr_close,
      prev_close,
      percent_change,
      prev_day
    ]
  }
}
