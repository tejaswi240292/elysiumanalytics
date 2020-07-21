view: itd_anomoly_user_entity {
  derived_table: {
    sql:SELECT adj_zscore :: string AS zscore,
               user_name,
               adj_anomaly_score,
               'windowsnxlog'   AS source,
               event_date,
               TYPE
        FROM   TABLE(Fn_ml_analyst_fb('windowsnxlog', 'analyst1', 'both'))
        where
        ADJ_ANOMALY_SCORE>=50
        UNION ALL
        SELECT adj_zscore :: string AS zscore,
               user_name,
               adj_anomaly_score,
               'wgtraffic'      AS source,
               event_date,
               TYPE
        FROM   TABLE(Fn_ml_analyst_fb('wgtraffic', 'analyst1', 'both'))
        where
        ADJ_ANOMALY_SCORE>=50
        UNION ALL
        SELECT adj_zscore :: string AS zscore,
               user_name,
               adj_anomaly_score,
               'msexchange'     AS source,
               event_date,
               TYPE
        FROM   TABLE(Fn_ml_analyst_fb('msexchange', 'analyst1', 'both'))
        where
        ADJ_ANOMALY_SCORE>=50;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_unique_adj_anomaly_score {
    type: count_distinct
    sql: ${adj_anomaly_score} ;;
  }

  dimension: zscore {
    type: string
    sql: ${TABLE}."ZSCORE" ;;
  }

  dimension: user_Or_IP {
    type: string
    sql: ${TABLE}."USER_NAME" ;;
  }

  dimension: adj_anomaly_score {
    type: number
    sql: ${TABLE}."ADJ_ANOMALY_SCORE" ;;
  }

  measure: distinct_adj {
    type: count_distinct
    sql: ${adj_anomaly_score} ;;
    drill_fields: [detail*]
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

  dimension: event_date {
    type: date
    sql: ${TABLE}."EVENT_DATE" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  set: detail {
    fields: [
      zscore,
      user_Or_IP,
      adj_anomaly_score,
      source,
      event_date,
      type
    ]
  }
}
