view: symantecnetwork_odm {
    sql_table_name: symantecnetwork_odm
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

  dimension: commit_time {
    type: string
    sql: ${TABLE}."COMMIT_TIME" ;;
  }

  dimension: event_id {
    type: number
    sql: ${TABLE}."EVENT_ID" ;;
  }

  dimension: host {
    type: string
    sql: ${TABLE}."HOST" ;;
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

  dimension: guid {
    type: string
    sql: ${TABLE}."GUID" ;;
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
      event_time_time,
      parsing_time,
      commit_time,
      event_id,
      host,
      src_name,
      proc_id,
      msg,
      guid,
      risk_desc,
      raw
    ]
  }
}
