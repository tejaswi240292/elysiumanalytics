view: get_OHLCA_data {
  derived_table: {
    sql: SELECT   sqa.Symbol
        ,sqa.[Date]
        ,cast(Datediff(s, '1970-01-01',sqa.[Date]) AS bigint)*1000 as dte_milliseconds
        ,tmc.last_entry_date
        ,cast(Datediff(s, '1970-01-01',tmc.last_entry_date) AS bigint)*1000 as lst_dte_milliseconds
        ,sqa.[Open]
        ,sqa.[High]
        ,sqa.[Low]
        ,sqa.[Close]
        ,sqa.[TC/YC] TC

from Stock_Quotes_Adj sqa
left outer join
(SELECT TOP(1) Symbol
              ,Mrk_Dte  as last_entry_date
 FROM tbl_Market_condition
 WHERE Trans_Flag= 'Y'
 and Mrk_Dte <= {% parameter dte %}
 and    Symbol   = {% parameter symbol %}
 ORDER BY Mrk_Dte DESC) tmc
 on sqa.Symbol=tmc.Symbol
 where sqa.Symbol = {% parameter symbol %}
and sqa.[Date] >= tmc.last_entry_date
and sqa.[Date] <= {% parameter dte %}
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

  dimension: dte_milliseconds {
    type: number
    sql: ${TABLE}.dte_milliseconds ;;
  }

  dimension: last_entry_date {
    type: date
    sql: ${TABLE}.last_entry_date ;;
  }

  dimension: lst_dte_milliseconds {
    type: number
    sql: ${TABLE}.lst_dte_milliseconds ;;
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
      Symbol,
      date,
      dte_milliseconds,
      last_entry_date,
      lst_dte_milliseconds,
      open,
      high,
      low,
      close,
      tc
    ]
  }
}
