view: msexchangeconnectivity_odm {
    sql_table_name:msexchangeconnectivity_odm
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

  dimension: session {
    type: string
    sql: ${TABLE}."SESSION" ;;
  }

  dimension: dst_object_type {
    type: string
    sql: ${TABLE}."DST_OBJECT_TYPE" ;;
  }

  dimension: src_object_type {
    type: string
    sql: ${TABLE}."SRC_OBJECT_TYPE" ;;
  }

  dimension: direction {
    type: string
    sql: ${TABLE}."DIRECTION" ;;
  }

  dimension: risk_desc {
    type: string
    sql: ${TABLE}."RISK_DESC" ;;
  }

  dimension: event_desc {
    type: string
    sql: ${TABLE}."EVENT_DESC" ;;
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
      session,
      dst_object_type,
      src_object_type,
      direction,
      risk_desc,
      event_desc,
      raw
    ]
  }
}
