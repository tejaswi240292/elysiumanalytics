view: iis_odm {
    sql_table_name:iis_odm
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

  dimension: src_ip {
    type: string
    sql: ${TABLE}."SRC_IP" ;;
  }

  dimension: dst_ip {
    type: string
    sql: ${TABLE}."DST_IP" ;;
  }

  dimension: dst_port {
    type: string
    sql: ${TABLE}."DST_PORT" ;;
  }

  dimension: qry {
    type: string
    sql: ${TABLE}."QRY" ;;
  }

  dimension: src_user_name {
    type: string
    sql: ${TABLE}."SRC_USER_NAME" ;;
  }

  dimension: dst_host {
    type: string
    sql: ${TABLE}."DST_HOST" ;;
  }

  dimension: out_bytes {
    type: string
    sql: ${TABLE}."OUT_BYTES" ;;
  }

  dimension: in_bytes {
    type: string
    sql: ${TABLE}."IN_BYTES" ;;
  }

  dimension: src_geo_id {
    type: string
    sql: ${TABLE}."SRC_GEO_ID" ;;
  }

  dimension: src_geo_country {
    type: string
    sql: ${TABLE}."SRC_GEO_COUNTRY" ;;
  }

  dimension: src_geo_code {
    type: string
    sql: ${TABLE}."SRC_GEO_CODE" ;;
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

  dimension: rpt_host {
    type: string
    sql: ${TABLE}."RPT_HOST" ;;
  }

  dimension: guid {
    type: string
    sql: ${TABLE}."GUID" ;;
  }

  dimension: http_status {
    type: string
    sql: ${TABLE}."HTTP_STATUS" ;;
  }

  dimension: http_method {
    type: string
    sql: ${TABLE}."HTTP_METHOD" ;;
  }

  dimension: http_path {
    type: string
    sql: ${TABLE}."HTTP_PATH" ;;
  }

  dimension: http_useragent {
    type: string
    sql: ${TABLE}."HTTP_USERAGENT" ;;
  }

  dimension: http_domain {
    type: string
    sql: ${TABLE}."HTTP_DOMAIN" ;;
  }

  dimension: http_version {
    type: string
    sql: ${TABLE}."HTTP_VERSION" ;;
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
      src_ip,
      dst_ip,
      dst_port,
      qry,
      src_user_name,
      dst_host,
      out_bytes,
      in_bytes,
      src_geo_id,
      src_geo_country,
      src_geo_code,
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
      rpt_host,
      guid,
      http_status,
      http_method,
      http_path,
      http_useragent,
      http_domain,
      http_version,
      raw
    ]
  }
}
