view: wgtraffic_odm {

    sql_table_name:wgtraffic_odm
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
  measure: Count_Of_event_time_time {
    type: count_distinct
    sql: ${event_time_time} ;;
    drill_fields: [detail*]
  }

  dimension: parsing_time {
    type: number
    sql: ${TABLE}."PARSING_TIME" ;;
  }

  dimension: commit_time {
    type: string
    sql: ${TABLE}."COMMIT_TIME" ;;
  }

  dimension: proto {
    type: string
    sql: ${TABLE}."PROTO" ;;
  }

  dimension: flags {
    type: string
    sql: ${TABLE}."FLAGS" ;;
  }

  dimension: qry {
    type: string
    sql: ${TABLE}."QRY" ;;
  }

  dimension: rpt_host {
    type: string
    sql: ${TABLE}."RPT_HOST" ;;
  }

  dimension: src_user_name {
    type: string
    sql: ${TABLE}."SRC_USER_NAME" ;;
  }

  dimension: src_ip {
    type: string
    sql: ${TABLE}."SRC_IP" ;;
    link: {
      label: "FILTER WITH IP&PORT"
      url: "/dashboards/102?Ip={{ value }}&Port={{ wgtraffic_odm.dst_port._value }}"
    }
  }

  dimension: src_port {
    type: string
    sql: ${TABLE}."SRC_PORT" ;;
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

  dimension: in_bytes {
    type: number
    sql: ${TABLE}."IN_BYTES" ;;
  }
  measure: Sum_of_in_bytes {
    type: sum
    sql: ${in_bytes} ;;
    drill_fields: [detail*]
  }

  dimension: out_bytes {
    type: number
    sql: ${TABLE}."OUT_BYTES" ;;
  }
measure: Sum_of_Out_bytes {
  type: sum
  sql: ${out_bytes} ;;
  drill_fields: [detail*]
}
  dimension: dst_ip {
    type: string
    sql: ${TABLE}."DST_IP" ;;
  }

  dimension: dst_port {
    type: string
    sql: ${TABLE}."DST_PORT" ;;
  }

  dimension: dst_domain {
    type: string
    sql: ${TABLE}."DST_DOMAIN" ;;
  }

  dimension: dst_user_name {
    type: string
    sql: ${TABLE}."DST_USER_NAME" ;;
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

  dimension: msg {
    type: string
    sql: ${TABLE}."MSG" ;;
  }

  dimension: risk_desc {
    type: string
    sql: ${TABLE}."RISK_DESC" ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}."EVENT_ID" ;;
  }

  dimension: src_if {
    type: string
    sql: ${TABLE}."SRC_IF" ;;
  }

  dimension: dst_if {
    type: string
    sql: ${TABLE}."DST_IF" ;;
  }

  dimension: duration {
    type: string
    sql: ${TABLE}."DURATION" ;;
  }

  dimension: http_method {
    type: string
    sql: ${TABLE}."HTTP_METHOD" ;;
  }

  dimension: guid {
    type: string
    sql: ${TABLE}."GUID" ;;
  }

  dimension: direction {
    type: string
    sql: ${TABLE}."DIRECTION" ;;
  }

  dimension: raw {
    type: string
    sql: ${TABLE}."RAW" ;;
  }

  dimension: web_category {
    type: string
    sql: ${TABLE}."WEB_CATEGORY" ;;
  }

  dimension: service {
    type: string
    sql: ${TABLE}."SERVICE" ;;
  }

  dimension: src_location{
    type: location
    sql_latitude: ${src_geo_lat} ;;
    sql_longitude: ${src_geo_long} ;;
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
      proto,
      flags,
      qry,
      rpt_host,
      src_user_name,
      src_ip,
      src_port,
      src_geo_country,
      src_geo_city,
      src_geo_lat,
      src_geo_long,
      in_bytes,
      out_bytes,
      dst_ip,
      dst_port,
      dst_domain,
      dst_user_name,
      dst_geo_country,
      dst_geo_city,
      dst_geo_lat,
      dst_geo_long,
      msg,
      risk_desc,
      event_id,
      src_if,
      dst_if,
      duration,
      http_method,
      guid,
      direction,
      raw,
      web_category,
      service
    ]
  }
}
