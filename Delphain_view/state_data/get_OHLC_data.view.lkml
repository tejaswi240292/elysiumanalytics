view: get_OHLC_data {
  derived_table: {
    sql: SELECT sqa.Symbol
        ,sqa.[Date]
        ,cast(Datediff(s, '1970-01-01',sqa.[Date]) AS bigint)*1000 as milliseconds
        ,sqa.[Open]
        ,sqa.[High]
        ,sqa.[Low]
        ,sqa.[Close]
        ,sqa.[TC/YC] TC
     ,Cast(RIGHT(tmc.[State],1) as INT) as CurrState
from Stock_Quotes_Adj sqa
left outer join tbl_Market_Condition tmc
on sqa.Symbol=tmc.Symbol
and sqa.[Date] = tmc.Mrk_Dte
and tmc.Trans_Flag= 'Y'
where sqa.Symbol = {% parameter symbol %}
and sqa.[Date] between '20200101' and  {% parameter dte %}
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: symbol {
    type: string
  }

  parameter: dte {
    type: date
  }

  dimension: Symbol {
    type: string
    sql: ${TABLE}.Symbol ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.Date ;;
  }

  dimension: Milliseconds {
    type: number
    sql: ${TABLE}.milliseconds ;;
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

  dimension: curr_state {
    type: number
    sql: ${TABLE}.CurrState ;;
  }

  set: detail {
    fields: [
      Symbol,
      date,
      Milliseconds,
      open,
      high,
      low,
      close,
      tc,
      curr_state
    ]
  }
}
