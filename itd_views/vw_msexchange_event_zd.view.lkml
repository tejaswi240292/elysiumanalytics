view: vw_msexchange_event_zd {
    sql_table_name:vw_msexchange_event_zd
      ;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: event_time {
    type: time
    sql: ${TABLE}."EVENT_TIME" ;;
  }

  dimension: event_date {
    type: date
    sql: ${TABLE}."EVENT_DATE" ;;
  }

  dimension: sender {
    type: string
    sql: ${TABLE}."SENDER" ;;
  }

  dimension: src_ip {
    type: string
    sql: ${TABLE}."SRC_IP" ;;
  }

  dimension: email_size {
    type: string
    sql: ${TABLE}."EMAIL_SIZE" ;;
  }

  dimension: receiver {
    type: string
    sql: ${TABLE}."RECEIVER" ;;
  }

  dimension: msg {
    type: string
    sql: ${TABLE}."MSG" ;;
  }

  dimension: risk {
    type: string
    sql: ${TABLE}."RISK" ;;
  }

  dimension: alerts_description {
    type: string
    sql: ${TABLE}."ALERTS_DESCRIPTION" ;;
  }

  dimension: user_zscore {
    type: string
    sql: ${TABLE}."USER_ZSCORE" ;;
  }

  dimension: pas_user {
    type: number
    sql: ${TABLE}."PAS_USER" ;;
  }

  dimension: feature_category {
    type: string
    sql: ${TABLE}."FEATURE_CATEGORY" ;;
  }

  dimension: event_user_score {
    type: number
    sql: ${TABLE}."EVENT_USER_SCORE" ;;
  }

  dimension: event_user_anomaly_score {
    type: number
    sql: ${TABLE}."EVENT_USER_ANOMALY_SCORE" ;;
  }

  set: detail {
    fields: [
      id,
      event_time_time,
      event_date,
      sender,
      src_ip,
      email_size,
      receiver,
      msg,
      risk,
      alerts_description,
      user_zscore,
      pas_user,
      feature_category,
      event_user_score,
      event_user_anomaly_score
    ]
  }
}
