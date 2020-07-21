view: wgnetflow_odm {
    sql_table_name:wgnetflow_odm
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

  dimension_group: commit_time {
    type: time
    sql: ${TABLE}."COMMIT_TIME" ;;
  }

  dimension: guid {
    type: string
    sql: ${TABLE}."GUID" ;;
  }

  dimension: direction {
    type: number
    sql: ${TABLE}."DIRECTION" ;;
  }

  dimension: flags {
    type: number
    sql: ${TABLE}."FLAGS" ;;
  }

  dimension: proto {
    type: string
    sql: ${TABLE}."PROTO" ;;
  }

  dimension: src_mac {
    type: string
    sql: ${TABLE}."SRC_MAC" ;;
  }

  dimension: src_ip {
    type: string
    sql: ${TABLE}."SRC_IP" ;;
  }

  dimension: src_port {
    type: string
    sql: ${TABLE}."SRC_PORT" ;;
  }

  dimension: dst_mac {
    type: string
    sql: ${TABLE}."DST_MAC" ;;
  }

  dimension: dst_ip {
    type: string
    sql: ${TABLE}."DST_IP" ;;
  }

  dimension: dst_port {
    type: string
    sql: ${TABLE}."DST_PORT" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: in_count {
    type: number
    sql: ${TABLE}."IN_COUNT" ;;
  }

  dimension: in_bytes {
    type: number
    sql: ${TABLE}."IN_BYTES" ;;
  }

  dimension: src_geo_id {
    type: string
    sql: ${TABLE}."SRC_GEO_ID" ;;
  }

  dimension: src_geo_code {
    type: string
    sql: ${TABLE}."SRC_GEO_CODE" ;;
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

  dimension: dst_geo_id {
    type: string
    sql: ${TABLE}."DST_GEO_ID" ;;
  }

  dimension: dst_geo_code {
    type: string
    sql: ${TABLE}."DST_GEO_CODE" ;;
  }

  dimension: dst_geo_country {
    type: string
    sql: ${TABLE}."DST_GEO_COUNTRY" ;;
  }

  dimension: dst_geo_city {
    type: string
    sql: ${TABLE}."DST_GEO_CITY" ;;
  }

  dimension: dst_geo_lat {
    type: string
    sql: ${TABLE}."DST_GEO_LAT" ;;
  }

  dimension: dst_geo_long {
    type: string
    sql: ${TABLE}."DST_GEO_LONG" ;;
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
      commit_time_time,
      guid,
      direction,
      flags,
      proto,
      src_mac,
      src_ip,
      src_port,
      dst_mac,
      dst_ip,
      dst_port,
      type,
      in_count,
      in_bytes,
      src_geo_id,
      src_geo_code,
      src_geo_country,
      src_geo_city,
      src_geo_lat,
      src_geo_long,
      dst_geo_id,
      dst_geo_code,
      dst_geo_country,
      dst_geo_city,
      dst_geo_lat,
      dst_geo_long,
      risk_desc,
      raw
    ]
  }
}
