view: vw_wgtraffic_event_zd {
    sql_table_name:vw_wgtraffic_event_zd;;

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

  dimension: src_username {
    type: string
    sql: ${TABLE}."SRC_USERNAME" ;;
  }

  dimension: src_ip {
    type: string
    sql: ${TABLE}."SRC_IP" ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}."HOSTNAME" ;;
  }

  dimension: src_geo_city {
    type: string
    sql: ${TABLE}."SRC_GEO_CITY" ;;
  }

  dimension: src_geo_country {
    type: string
    sql: ${TABLE}."SRC_GEO_COUNTRY" ;;
  }

  dimension: src_geo_lat {
    type: string
    sql: ${TABLE}."SRC_GEO_LAT" ;;
  }

  dimension: src_geo_long {
    type: string
    sql: ${TABLE}."SRC_GEO_LONG" ;;
  }

  dimension: in_bytes {
    type: number
    sql: ${TABLE}."IN_BYTES" ;;
  }

  dimension: out_bytes {
    type: number
    sql: ${TABLE}."OUT_BYTES" ;;
  }

  dimension: dst_name {
    type: string
    sql: ${TABLE}."DST_NAME" ;;
  }

  dimension: risk {
    type: string
    sql: ${TABLE}."RISK" ;;
  }

  dimension: alerts_description {
    type: string
    sql: ${TABLE}."ALERTS_DESCRIPTION" ;;
  }

  dimension: entity_zscore {
    type: string
    sql: ${TABLE}."ENTITY_ZSCORE" ;;
  }

  dimension: user_zscore {
    type: string
    sql: ${TABLE}."USER_ZSCORE" ;;
  }

  dimension: pas_entity {
    type: number
    sql: ${TABLE}."PAS_ENTITY" ;;
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

  dimension: event_entity_score {
    type: number
    sql: ${TABLE}."EVENT_ENTITY_SCORE" ;;
  }

  dimension: event_user_anomaly_score {
    type: number
    sql: ${TABLE}."EVENT_USER_ANOMALY_SCORE" ;;
  }

  dimension: event_entity_anomaly_score {
    type: number
    sql: ${TABLE}."EVENT_ENTITY_ANOMALY_SCORE" ;;
  }

  set: detail {
    fields: [
      id,
      event_time_time,
      event_date,
      src_username,
      src_ip,
      hostname,
      src_geo_city,
      src_geo_country,
      src_geo_lat,
      src_geo_long,
      in_bytes,
      out_bytes,
      dst_name,
      risk,
      alerts_description,
      entity_zscore,
      user_zscore,
      pas_entity,
      pas_user,
      feature_category,
      event_user_score,
      event_entity_score,
      event_user_anomaly_score,
      event_entity_anomaly_score
    ]
  }
}
