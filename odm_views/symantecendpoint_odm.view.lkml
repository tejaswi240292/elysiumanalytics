view: symantecendpoint_odm {
    sql_table_name:symantecendpoint_odm
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

  dimension: parsing_time {
    type: number
    sql: ${TABLE}."PARSING_TIME" ;;
  }

  dimension_group: event_time {
    type: time
    sql: ${TABLE}."EVENT_TIME" ;;
  }

  dimension: commit_time {
    type: string
    sql: ${TABLE}."COMMIT_TIME" ;;
  }

  dimension: host {
    type: string
    sql: ${TABLE}."HOST" ;;
  }

  dimension: event_id {
    type: number
    sql: ${TABLE}."EVENT_ID" ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}."EVENT_TYPE" ;;
  }

  dimension: flags {
    type: string
    sql: ${TABLE}."FLAGS" ;;
  }

  dimension: src_name {
    type: string
    sql: ${TABLE}."SRC_NAME" ;;
  }

  dimension: proc_id {
    type: number
    sql: ${TABLE}."PROC_ID" ;;
  }

  dimension: msg {
    type: string
    sql: ${TABLE}."MSG" ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}."SIZE" ;;
  }

  dimension: file_path {
    type: string
    sql: ${TABLE}."FILE_PATH" ;;
  }

  dimension: guid {
    type: string
    sql: ${TABLE}."GUID" ;;
  }

  dimension: app_id {
    type: string
    sql: ${TABLE}."APP_ID" ;;
  }

  dimension: app_value {
    type: number
    sql: ${TABLE}."APP_VALUE" ;;
  }

  dimension: risk_count {
    type: number
    sql: ${TABLE}."RISK_COUNT" ;;
  }

  dimension: in_file_count {
    type: number
    sql: ${TABLE}."IN_FILE_COUNT" ;;
  }

  dimension: omitted_file_count {
    type: number
    sql: ${TABLE}."OMITTED_FILE_COUNT" ;;
  }

  dimension: skipped_file_count {
    type: number
    sql: ${TABLE}."SKIPPED_FILE_COUNT" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: malware_name {
    type: string
    sql: ${TABLE}."MALWARE_NAME" ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}."ACTION" ;;
  }

  dimension: risk_desc {
    type: string
    sql: ${TABLE}."RISK_DESC" ;;
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
      parsing_time,
      event_time_time,
      commit_time,
      host,
      event_id,
      event_type,
      flags,
      src_name,
      proc_id,
      msg,
      size,
      file_path,
      guid,
      app_id,
      app_value,
      risk_count,
      in_file_count,
      omitted_file_count,
      skipped_file_count,
      status,
      malware_name,
      action,
      risk_desc,
      raw
    ]
  }
}
