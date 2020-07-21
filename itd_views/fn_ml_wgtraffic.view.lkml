view: fn_ml_wgtraffic {

    sql_table_name: TABLE(Fn_ml_analyst_fb('wgtraffic', 'analyst1', 'both'))
      ;;

  dimension: source  {
    type: string
    sql: 'wgtraffic' ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: analyst_name {
    type: string
    sql: ${TABLE}."ANALYST_NAME" ;;
  }

  dimension: event_date {
    type: date
    sql: ${TABLE}."EVENT_DATE" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}."USER_NAME" ;;
  }

  dimension: feature_val {
    type: string
    sql: ${TABLE}."FEATURE_VAL" ;;
  }

  dimension: alert_agg {
    type: string
    sql: ${TABLE}."ALERT_AGG" ;;
  }

  dimension: ts_agg {
    type: string
    sql: ${TABLE}."TS_AGG" ;;
  }

  dimension: adj_zscore {
    type: string
    sql: ${TABLE}."ADJ_ZSCORE" ;;
  }

  dimension: adj_anomaly_score {
    type: number
    sql: ${TABLE}."ADJ_ANOMALY_SCORE" ;;
  }

  set: detail {
    fields: [
      analyst_name,
      event_date,
      type,
      user_name,
      feature_val,
      alert_agg,
      ts_agg,
      adj_zscore,
      adj_anomaly_score
    ]
  }
}
