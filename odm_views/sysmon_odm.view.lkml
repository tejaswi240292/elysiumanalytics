view: sysmon_odm {
    sql_table_name:sysmon_odm
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

  dimension: event_id {
    type: string
    sql: ${TABLE}."EVENT_ID" ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}."EVENT_TYPE" ;;
  }

  dimension: guid {
    type: string
    sql: ${TABLE}."GUID" ;;
  }

  dimension: src_user_name {
    type: string
    sql: ${TABLE}."SRC_USER_NAME" ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: image_name {
    type: string
    sql: ${TABLE}."IMAGE_NAME" ;;
  }

  dimension: proc_id {
    type: string
    sql: ${TABLE}."PROC_ID" ;;
  }

  dimension: cmd {
    type: string
    sql: ${TABLE}."CMD" ;;
  }

  dimension: src_host {
    type: string
    sql: ${TABLE}."SRC_HOST" ;;
  }

  dimension: src_ip {
    type: string
    sql: ${TABLE}."SRC_IP" ;;
  }

  dimension: src_ip6 {
    type: string
    sql: ${TABLE}."SRC_IP6" ;;
  }

  dimension: src_port {
    type: string
    sql: ${TABLE}."SRC_PORT" ;;
  }

  dimension: dst_host {
    type: string
    sql: ${TABLE}."DST_HOST" ;;
  }

  dimension: dst_ip {
    type: string
    sql: ${TABLE}."DST_IP" ;;
  }

  dimension: dst_ip6 {
    type: string
    sql: ${TABLE}."DST_IP6" ;;
  }

  dimension: dst_port {
    type: string
    sql: ${TABLE}."DST_PORT" ;;
  }

  dimension: dst_file_name {
    type: string
    sql: ${TABLE}."DST_FILE_NAME" ;;
  }

  dimension: proto {
    type: string
    sql: ${TABLE}."PROTO" ;;
  }

  dimension: dst_image_name {
    type: string
    sql: ${TABLE}."DST_IMAGE_NAME" ;;
  }

  dimension: risk_desc {
    type: string
    sql: ${TABLE}."RISK_DESC" ;;
  }

  dimension: parent_image_name {
    type: string
    sql: ${TABLE}."PARENT_IMAGE_NAME" ;;
  }

  dimension: parent_proc_id {
    type: string
    sql: ${TABLE}."PARENT_PROC_ID" ;;
  }

  dimension: parent_proc_guid {
    type: string
    sql: ${TABLE}."PARENT_PROC_GUID" ;;
  }

  dimension: parent_cmd {
    type: string
    sql: ${TABLE}."PARENT_CMD" ;;
  }

  dimension: host {
    type: string
    sql: ${TABLE}."HOST" ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}."DOMAIN" ;;
  }

  dimension: object_type {
    type: string
    sql: ${TABLE}."OBJECT_TYPE" ;;
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
      event_id,
      event_type,
      guid,
      src_user_name,
      user_id,
      image_name,
      proc_id,
      cmd,
      src_host,
      src_ip,
      src_ip6,
      src_port,
      dst_host,
      dst_ip,
      dst_ip6,
      dst_port,
      dst_file_name,
      proto,
      dst_image_name,
      risk_desc,
      parent_image_name,
      parent_proc_id,
      parent_proc_guid,
      parent_cmd,
      host,
      domain,
      object_type
    ]
  }
}
