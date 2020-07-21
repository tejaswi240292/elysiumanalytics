view: vw_profile_alert_events_corrected {
    sql_table_name: VW_PROFILE_ALERT_EVENTS_CORRECTED
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

  dimension_group: processing_dttm {
    type: time
    sql: ${TABLE}."PROCESSING_DTTM" ;;
  }

  dimension: source_nm {
    type: string
    sql: ${TABLE}."SOURCE_NM" ;;
  }

  dimension: src_username {
    type: string
    sql: ${TABLE}."SRC_USERNAME" ;;
  }

  dimension: src_ip {
    type: string
    sql: ${TABLE}."SRC_IP" ;;
  }

  dimension: dst_ip {
    type: string
    sql: ${TABLE}."DST_IP" ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}."HOSTNAME" ;;
  }

  dimension: alert_type {
    type: string
    sql: ${TABLE}."ALERT_TYPE" ;;
  }

  dimension: alert_desc {
    type: string
    sql: ${TABLE}."ALERT_DESC" ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}."LATITUDE" ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}."LONGITUDE" ;;
  }

  dimension: parent_alert_id {
    type: string
    sql: ${TABLE}."PARENT_ALERT_ID" ;;
  }

  dimension: alert_abbr_nm {
    type: string
    sql: ${TABLE}."ALERT_ABBR_NM" ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}."latitude" ;;
    sql_longitude: ${TABLE}."longitude" ;;
  }

  set: detail {
    fields: [
      id,
      event_time_time,
      processing_dttm_time,
      source_nm,
      src_username,
      src_ip,
      dst_ip,
      hostname,
      alert_type,
      alert_desc,
      latitude,
      longitude,
      parent_alert_id,
      alert_abbr_nm,
      location
    ]
  }
}
