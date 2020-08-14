view: get_misc_values {
  derived_table: {
    sql: SELECT Symb,
       Dte,
       marketshare,
       beta
FROM [dbo].[Get_USD_vals]
(  {%parameter sym%}
, {%parameter date%})
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: sym {
    type: string
  }

  parameter: date {
    type: date
  }

  dimension: symb {
    type: string
    sql: ${TABLE}.Symb ;;
  }

  dimension: dte {
    type: date
    sql: ${TABLE}.Dte ;;
  }

  dimension: marketshare {
    type: number
    sql: ${TABLE}.marketshare ;;
  }

  dimension: beta {
    type: number
    sql: ${TABLE}.beta ;;
  }

  set: detail {
    fields: [symb, dte, marketshare, beta]
  }
}
