view: wh_usage_report{
    sql_table_name: WH_USAGE_REPORT
      ;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: usage_date {
    type: date
    sql: ${TABLE}."USAGE_DATE" ;;
  }

  dimension: warehouse_name {
    type: string
    sql: ${TABLE}."WAREHOUSE_NAME" ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}."USER_NAME" ;;
  }

  dimension: credits_by_user {
    type: number
    sql: ${TABLE}."CREDITS_BY_USER" ;;
  }

  set: detail {
    fields: [usage_date, warehouse_name, user_name, credits_by_user]
  }
}
