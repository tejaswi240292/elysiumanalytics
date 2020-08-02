view: get_analyst_rating {
  derived_table: {
    sql: SELECT 'Strong Buys' State ,ISNULL(cast(rating_cnt_strong_buys as int),0) Cnts FROM tbl_ZACKS_CP WHERE {% condition Symbol %} ticker {% endcondition %}
      UNION ALL SELECT 'Buys',ISNULL(cast(rating_cnt_buys as int),0) FROM tbl_ZACKS_CP WHERE {% condition Symbol %} ticker {% endcondition %}
      UNION ALL SELECT 'Holds',ISNULL(cast(rating_cnt_holds as int),0) FROM tbl_ZACKS_CP WHERE {% condition Symbol %} ticker {% endcondition %}
      UNION ALL SELECT 'Sells',ISNULL(cast(rating_cnt_sells as int),0) FROM tbl_ZACKS_CP WHERE {% condition Symbol %} ticker {% endcondition %}
      UNION ALL SELECT 'Strong Sells',ISNULL(cast(rating_cnt_strong_sells as int),0) FROM tbl_ZACKS_CP WHERE {% condition Symbol %} ticker {% endcondition %}
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  filter: Symbol {
    type: string
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: cnts {
    type: number
    sql: ${TABLE}.Cnts ;;
  }

  set: detail {
    fields: [state, cnts]
  }
}
