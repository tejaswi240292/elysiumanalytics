view: windowsnxlog_odm {
    sql_table_name:windowsnxlog_odm
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

  dimension_group: parsing_time {
    type: time
    sql: ${TABLE}."PARSING_TIME" ;;
  }

  dimension_group: commit_time {
    type: time
    sql: ${TABLE}."COMMIT_TIME" ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}."EVENT_ID" ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}."EVENT_NAME" ;;
  }

  dimension: src_domain {
    type: string
    sql: ${TABLE}."SRC_DOMAIN" ;;
  }

  dimension: src_user_name {
    type: string
    sql: ${TABLE}."SRC_USER_NAME" ;;
  }

  dimension: src_session_id {
    type: string
    sql: ${TABLE}."SRC_SESSION_ID" ;;
  }

  dimension: src_user_id {
    type: string
    sql: ${TABLE}."SRC_USER_ID" ;;
  }

  dimension: logon_type {
    type: string
    sql: ${TABLE}."LOGON_TYPE" ;;
  }

  dimension: dst_domain {
    type: string
    sql: ${TABLE}."DST_DOMAIN" ;;
  }

  dimension: dst_user_name {
    type: string
    sql: ${TABLE}."DST_USER_NAME" ;;
  }

  dimension: dst_session_id {
    type: string
    sql: ${TABLE}."DST_SESSION_ID" ;;
  }

  dimension: dst_user_id {
    type: string
    sql: ${TABLE}."DST_USER_ID" ;;
  }

  dimension: new_user_name {
    type: string
    sql: ${TABLE}."NEW_USER_NAME" ;;
  }

  dimension: src_object_name {
    type: string
    sql: ${TABLE}."SRC_OBJECT_NAME" ;;
  }

  dimension: src_object_type {
    type: string
    sql: ${TABLE}."SRC_OBJECT_TYPE" ;;
  }

  dimension: src_proc_id {
    type: string
    sql: ${TABLE}."SRC_PROC_ID" ;;
  }

  dimension: src_proc_name {
    type: string
    sql: ${TABLE}."SRC_PROC_NAME" ;;
  }

  dimension: new_proc_name {
    type: string
    sql: ${TABLE}."NEW_PROC_NAME" ;;
  }

  dimension: src_ip {
    type: string
    sql: ${TABLE}."SRC_IP" ;;
  }

  dimension: src_port {
    type: string
    sql: ${TABLE}."SRC_PORT" ;;
  }

  dimension: qry {
    type: string
    sql: ${TABLE}."QRY" ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}."CODE" ;;
  }

  dimension: flags {
    type: string
    sql: ${TABLE}."FLAGS" ;;
  }

  dimension: risk_desc {
    type: string
    sql: ${TABLE}."RISK_DESC" ;;
  }

  dimension: src_geo_country {
    type: string
    sql: ${TABLE}."SRC_GEO_COUNTRY" ;;
  }

  dimension: src_geo_city {
    type: string
    sql: ${TABLE}."SRC_GEO_CITY" ;;
  }

  dimension: src_geo_lat {
    type: string
    sql: ${TABLE}."SRC_GEO_LAT" ;;
  }

  dimension: src_geo_long {
    type: string
    sql: ${TABLE}."SRC_GEO_LONG" ;;
  }

  dimension: guid {
    type: string
    sql: ${TABLE}."GUID" ;;
  }

  dimension: parent_proc_name {
    type: string
    sql: ${TABLE}."PARENT_PROC_NAME" ;;
  }

  dimension: host {
    type: string
    sql: ${TABLE}."HOST" ;;
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
      parsing_time_time,
      commit_time_time,
      event_id,
      event_name,
      src_domain,
      src_user_name,
      src_session_id,
      src_user_id,
      logon_type,
      dst_domain,
      dst_user_name,
      dst_session_id,
      dst_user_id,
      new_user_name,
      src_object_name,
      src_object_type,
      src_proc_id,
      src_proc_name,
      new_proc_name,
      src_ip,
      src_port,
      qry,
      code,
      flags,
      risk_desc,
      src_geo_country,
      src_geo_city,
      src_geo_lat,
      src_geo_long,
      guid,
      parent_proc_name,
      host,
      raw
    ]
  }
}
