view: get_avg_days_percent {
  derived_table: {
    sql: SELECT TOP(1) Symbol,
              Mrk_Dte,
              AVG_ST1,
              AVG_ST2,
              AVG_ST3,
              AVG_ST4,
              AVG_ST5,
              AVG_ST6,
              AVG_ST7,
              AVG_ST8,
              AVGMOV_R_ST1,
              AVGMOV_R_ST2,
              AVGMOV_R_ST3,
              AVGMOV_R_ST4,
              AVGMOV_R_ST5,
              AVGMOV_R_ST6,
              AVGMOV_R_ST7,
              AVGMOV_R_ST8,
            AVGMOV_W_ST1,
            AVGMOV_W_ST2,
            AVGMOV_W_ST3,
            AVGMOV_W_ST4,
            AVGMOV_W_ST5,
            AVGMOV_W_ST6,
            AVGMOV_W_ST7,
            AVGMOV_W_ST8
  FROM tbl_State_Analysis
  WHERE Mrk_Dte <= '20200620'
  AND {% condition Symb %} Symbol {% endcondition %}
  Order by Mrk_Dte DESC
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  filter: Symb {
    type: string
  }

  filter: datefilter {
    type: date
  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.Symbol ;;
  }

  dimension: mrk_dte {
    type: date
    primary_key: yes
    sql: ${TABLE}.Mrk_Dte ;;
  }

  dimension: avg_st1 {
    type: number
    sql: ${TABLE}.AVG_ST1 ;;
  }

  dimension: avg_st2 {
    type: number
    sql: ${TABLE}.AVG_ST2 ;;
  }

  dimension: avg_st3 {
    type: number
    sql: ${TABLE}.AVG_ST3 ;;
  }

  dimension: avg_st4 {
    type: number
    sql: ${TABLE}.AVG_ST4 ;;
  }

  dimension: avg_st5 {
    type: number
    sql: ${TABLE}.AVG_ST5 ;;
  }

  dimension: avg_st6 {
    type: number
    sql: ${TABLE}.AVG_ST6 ;;
  }

  dimension: avg_st7 {
    type: number
    sql: ${TABLE}.AVG_ST7 ;;
  }

  dimension: avg_st8 {
    type: number
    sql: ${TABLE}.AVG_ST8 ;;
  }

  dimension: avgmov_r_st1 {
    type: number
    sql: ${TABLE}.AVGMOV_R_ST1 ;;
  }

  dimension: avgmov_r_st2 {
    type: number
    sql: ${TABLE}.AVGMOV_R_ST2 ;;
  }

  dimension: avgmov_r_st3 {
    type: number
    sql: ${TABLE}.AVGMOV_R_ST3 ;;
  }

  dimension: avgmov_r_st4 {
    type: number
    sql: ${TABLE}.AVGMOV_R_ST4 ;;
  }

  dimension: avgmov_r_st5 {
    type: number
    sql: ${TABLE}.AVGMOV_R_ST5 ;;
  }

  dimension: avgmov_r_st6 {
    type: number
    sql: ${TABLE}.AVGMOV_R_ST6 ;;
  }

  dimension: avgmov_r_st7 {
    type: number
    sql: ${TABLE}.AVGMOV_R_ST7 ;;
  }

  dimension: avgmov_r_st8 {
    type: number
    sql: ${TABLE}.AVGMOV_R_ST8 ;;
  }

  dimension: avgmov_w_st1 {
    type: number
    sql: ${TABLE}.AVGMOV_W_ST1 ;;
  }

  dimension: avgmov_w_st2 {
    type: number
    sql: ${TABLE}.AVGMOV_W_ST2 ;;
  }

  dimension: avgmov_w_st3 {
    type: number
    sql: ${TABLE}.AVGMOV_W_ST3 ;;
  }

  dimension: avgmov_w_st4 {
    type: number
    sql: ${TABLE}.AVGMOV_W_ST4 ;;
  }

  dimension: avgmov_w_st5 {
    type: number
    sql: ${TABLE}.AVGMOV_W_ST5 ;;
  }

  dimension: avgmov_w_st6 {
    type: number
    sql: ${TABLE}.AVGMOV_W_ST6 ;;
  }

  dimension: avgmov_w_st7 {
    type: number
    sql: ${TABLE}.AVGMOV_W_ST7 ;;
  }

  dimension: avgmov_w_st8 {
    type: number
    sql: ${TABLE}.AVGMOV_W_ST8 ;;
  }

  set: detail {
    fields: [
      symbol,
      mrk_dte,
      avg_st1,
      avg_st2,
      avg_st3,
      avg_st4,
      avg_st5,
      avg_st6,
      avg_st7,
      avg_st8,
      avgmov_r_st1,
      avgmov_r_st2,
      avgmov_r_st3,
      avgmov_r_st4,
      avgmov_r_st5,
      avgmov_r_st6,
      avgmov_r_st7,
      avgmov_r_st8,
      avgmov_w_st1,
      avgmov_w_st2,
      avgmov_w_st3,
      avgmov_w_st4,
      avgmov_w_st5,
      avgmov_w_st6,
      avgmov_w_st7,
      avgmov_w_st8
    ]
  }
}
