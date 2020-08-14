view: get_state_count {
  derived_table: {
    sql: SELECT Symbol,
       FromTran,
        COUNT(1) AS tot_cnt
FROM tbl_Market_Condition
where {% condition Symb %} Symbol {% endcondition %}
and {% condition CurrDate %} Mrk_Dte {% endcondition %}
and Trans_Flag = 'Y'
and  MAType = 'EMA'
GROUP BY Symbol,FromTran
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  filter: Symb {
    type: string
  }

  filter: CurrDate {
    type: date
  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.Symbol ;;
  }

  dimension: from_tran {
    type: string
    primary_key: yes
    sql: ${TABLE}.FromTran ;;
  }

  dimension: tot_cnt {
    type: number
    sql: ${TABLE}.tot_cnt ;;
  }

  set: detail {
    fields: [symbol, from_tran, tot_cnt]
  }
}
