view: msexchangeagent_odm {
    sql_table_name: msexchangeagent_odm
      ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: dvc_vendor {
    type: string
    sql: ${TABLE}."DVC_VENDOR" ;;
  }

  dimension: dvc_product {
    type: string
    sql: ${TABLE}."DVC_PRODUCT" ;;
  }

  dimension: dvc_version {
    type: string
    sql: ${TABLE}."DVC_VERSION" ;;
  }

  dimension: src_type {
    type: string
    sql: ${TABLE}."SRC_TYPE" ;;
  }

  dimension_group: event_time {
    type: time
    sql: ${TABLE}."EVENT_TIME" ;;
  }

  dimension: parsing_time {
    type: number
    sql: ${TABLE}."PARSING_TIME" ;;
  }

  dimension_group: commit_time {
    type: time
    sql: ${TABLE}."COMMIT_TIME" ;;
  }

  dimension: dst_ip {
    type: string
    sql: ${TABLE}."DST_IP" ;;
  }

  dimension: dst_port {
    type: string
    sql: ${TABLE}."DST_PORT" ;;
  }

  dimension: src_ip {
    type: string
    sql: ${TABLE}."SRC_IP" ;;
  }

  dimension: src_port {
    type: string
    sql: ${TABLE}."SRC_PORT" ;;
  }

  dimension: src_object_name {
    type: string
    sql: ${TABLE}."SRC_OBJECT_NAME" ;;
  }

  dimension: src_object_id {
    type: string
    sql: ${TABLE}."SRC_OBJECT_ID" ;;
  }

  dimension: msg {
    type: string
    sql: ${TABLE}."MSG" ;;
  }

  dimension: src_host {
    type: string
    sql: ${TABLE}."SRC_HOST" ;;
  }

  dimension: dst_host {
    type: string
    sql: ${TABLE}."DST_HOST" ;;
  }

  dimension: dst_user_count {
    type: string
    sql: ${TABLE}."DST_USER_COUNT" ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}."CODE" ;;
  }

  dimension: dst_user_name {
    type: string
    sql: ${TABLE}."DST_USER_NAME" ;;
  }

  dimension: session {
    type: string
    sql: ${TABLE}."SESSION" ;;
  }

  dimension: risk_desc {
    type: string
    sql: ${TABLE}."RISK_DESC" ;;
  }

  dimension: guid {
    type: string
    sql: ${TABLE}."GUID" ;;
  }

  dimension: raw {
    type: string
    sql: ${TABLE}."RAW" ;;
  }

  set: detail {
    fields: [
      dvc_vendor,
      dvc_product,
      dvc_version,
      src_type,
      event_time_time,
      parsing_time,
      commit_time_time,
      dst_ip,
      dst_port,
      src_ip,
      src_port,
      src_object_name,
      src_object_id,
      msg,
      src_host,
      dst_host,
      dst_user_count,
      code,
      dst_user_name,
      session,
      risk_desc,
      guid,
      raw
    ]
  }
}
