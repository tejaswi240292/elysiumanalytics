view: itd_high_risk_score {
  # derived_table: {
  #   sql: select * from table(FN_ML_OVERALL_AGG('analyst1'))
  #     ;;
  # }
  sql_table_name: table(FN_ML_OVERALL_AGG('analyst1'))  ;;


  dimension: urgency{
    sql: CASE when ${risk_score} >=70 Then 'critical'
      when (${risk_score} <50 and ${risk_score} >70) then 'high'
      when (${risk_score} <50 and ${risk_score} >=5) then 'medium'
      when (${risk_score} <=5) then 'low' else 'unknown'
      end ;;
  }

  measure: count {
    type: count
    drill_fields: []
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

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
    link: {
      label: "Link To 360 View"
      url: "{% assign first_char = value | slice: 0 %}
      {% if first_char  == \"1\" %}
      /dashboards/6?Ip={{ value }}
      {% else %}
      /dashboards/5?User={{ value }}
      {% endif %}"
      icon_url: "https://www.google.com/s2/favicons?domain=https://www.looker.com"
    }
  }

  dimension: feature_agg {
    type: string
    sql: ${TABLE}."FEATURE_AGG" ;;
  }

  dimension: event_date_list {
    type: string
    sql: ${TABLE}."EVENT_DATE" ;;
  }

  dimension: risk_score_list {
    type: string
    sql: ${TABLE}."RISK_SCORE" ;;
  }

  dimension: zscore {
    type: string
    sql: ${TABLE}."ZSCORE" ;;
  }

  dimension: Time_Series_Aggregate {
    type: string
    sql: ${TABLE}."TS_AGG" ;;
  }



  dimension: total_alert_count {
    type: number
    sql: ${TABLE}."TOTAL_ALERT_COUNT" ;;
  }

  measure: max_of_total_alert_count {
    type: max
    sql: ${total_alert_count} ;;
    drill_fields: [detail*]
  }

  dimension: max_anomaly_score {
    type: number
    sql: ${TABLE}."MAX_ANOMALY_SCORE" ;;
  }

  measure:  max_of_anomoly_score{
    type: max
    sql: ${max_anomaly_score} ;;
    drill_fields: [detail*]
  }

  dimension: max_alert_score {
    type: number
    sql: ${TABLE}."MAX_ALERT_SCORE" ;;
    drill_fields: [detail*]
  }

  measure:  max_of_alert_score{
    type: max
    sql: ${max_alert_score};;
    drill_fields: [detail*]
  }

  dimension: risk_score {
    type: number
    sql: ${TABLE}."RISK_SCORE" ;;
    drill_fields: [detail*]

  }

  measure: max_of_risk_score {
    type: max
    sql: ${risk_score} ;;
    drill_fields: [detail*]
  }

  measure: max_risk_score {
    type: max
    sql: ${risk_score} ;;
    drill_fields: []
  }

  measure: sum_of_risk_score {
    type: sum
    sql: ${risk_score} ;;
    drill_fields: [detail*]
  }

  measure: count_distinct_risk_score {
    type: count_distinct
    sql: ${risk_score} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      analyst_name,
      event_date,
      type,
      name,
      feature_agg,
      zscore,
      Time_Series_Aggregate,
      total_alert_count,
      max_anomaly_score,
      max_alert_score,
      risk_score
    ]
  }
}
