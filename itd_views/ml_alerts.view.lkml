view: ml_alerts {
    sql_table_name: ML_ALERTS
      ;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: event_date {
    type: date
    sql: ${TABLE}."EVENT_DATE" ;;
  }

  dimension: source_nm {
    type: string
    sql: ${TABLE}."SOURCE_NM" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: alert_type {
    type: string
    sql: ${TABLE}."ALERT_TYPE" ;;
  }

  dimension: alert_identifier {
    type: string
    sql: ${TABLE}."ALERT_IDENTIFIER" ;;
  }

  set: detail {
    fields: [
      id,
      event_date,
      source_nm,
      type,
      name,
      alert_type,
      alert_identifier
    ]
  }
}
