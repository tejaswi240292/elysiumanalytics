view: wgtraffic_ml_score_batch {
    sql_table_name:wgtraffic_ml_score_batch
      ;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: event_date {
    type: date
    sql: ${TABLE}."EVENT_DATE" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: feature_agg {
    type: string
    sql: ${TABLE}."FEATURE_AGG" ;;
  }

  dimension: alert_agg {
    type: string
    sql: ${TABLE}."ALERT_AGG" ;;
  }

  dimension: ts_agg {
    type: string
    sql: ${TABLE}."TS_AGG" ;;
  }

  dimension: zscore {
    type: string
    sql: ${TABLE}."ZSCORE" ;;
  }

  dimension: pas_kmeans {
    type: number
    sql: ${TABLE}."PAS_KMEANS" ;;
  }

  dimension: pas_isolation {
    type: number
    sql: ${TABLE}."PAS_ISOLATION" ;;
  }

  dimension: pas_svm {
    type: number
    sql: ${TABLE}."PAS_SVM" ;;
  }

  dimension: pas {
    type: number
    sql: ${TABLE}."PAS" ;;
  }

  dimension: execution_timestamp {
    type: number
    sql: ${TABLE}."EXECUTION_TIMESTAMP" ;;
  }

  set: detail {
    fields: [
      event_date,
      name,
      type,
      feature_agg,
      alert_agg,
      ts_agg,
      zscore,
      pas_kmeans,
      pas_isolation,
      pas_svm,
      pas,
      execution_timestamp
    ]
  }
}
