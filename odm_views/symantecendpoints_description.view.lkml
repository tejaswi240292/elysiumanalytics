view: symantecendpoints_description {
    sql_table_name:symantecendpoint_description
      ;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: event_id {
    type: number
    sql: ${TABLE}."EVENT_ID" ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}."EVENT_NAME" ;;
  }

  set: detail {
    fields: [event_id, event_name]
  }
}
