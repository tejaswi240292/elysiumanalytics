view: msexchangemessagetracking_odm {
    sql_table_name: msexchangemessagetracking_odm
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

  dimension: event_name {
    type: string
    sql: ${TABLE}."EVENT_NAME" ;;
  }

  dimension: dst_host {
    type: string
    sql: ${TABLE}."DST_HOST" ;;
  }

  dimension: dst_ip {
    type: string
    sql: ${TABLE}."DST_IP" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: src_user_name {
    type: string
    sql: ${TABLE}."SRC_USER_NAME" ;;
  }

  dimension: src_domain {
    type: string
    sql: ${TABLE}."SRC_DOMAIN" ;;
  }

  dimension: src_host {
    type: string
    sql: ${TABLE}."SRC_HOST" ;;
  }

  dimension: src_ip {
    type: string
    sql: ${TABLE}."SRC_IP" ;;
  }

  dimension: src_object_type {
    type: string
    sql: ${TABLE}."SRC_OBJECT_TYPE" ;;
  }

  dimension: email_subject {
    type: string
    sql: ${TABLE}."EMAIL_SUBJECT" ;;
  }

  dimension: risk_desc {
    type: string
    sql: ${TABLE}."RISK_DESC" ;;
  }

  dimension: direction {
    type: string
    sql: ${TABLE}."DIRECTION" ;;
  }

  dimension: src_geo_country {
    type: string
    sql: ${TABLE}."SRC_GEO_COUNTRY" ;;
  }

  dimension: src_geo_city {
    type: string
    sql: ${TABLE}."SRC_GEO_CITY" ;;
  }

  dimension: src_geo_code {
    type: string
    sql: ${TABLE}."SRC_GEO_CODE" ;;
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

  dimension: src_geo_id {
    type: string
    sql: ${TABLE}."SRC_GEO_ID" ;;
  }

  dimension: email_size {
    type: string
    sql: ${TABLE}."EMAIL_SIZE" ;;
  }

  dimension: emailattachment_count {
    type: string
    sql: ${TABLE}."EMAILATTACHMENT_COUNT" ;;
  }

  dimension: dst_email_count {
    type: string
    sql: ${TABLE}."DST_EMAIL_COUNT" ;;
  }

  dimension: dst_email_addr {
    type: string
    sql: ${TABLE}."DST_EMAIL_ADDR" ;;
  }

  dimension: src_email_addr {
    type: string
    sql: ${TABLE}."SRC_EMAIL_ADDR" ;;
  }

  dimension: email_id {
    type: string
    sql: ${TABLE}."EMAIL_ID" ;;
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
      event_name,
      dst_host,
      dst_ip,
      status,
      src_user_name,
      src_domain,
      src_host,
      src_ip,
      src_object_type,
      email_subject,
      risk_desc,
      direction,
      src_geo_country,
      src_geo_city,
      src_geo_code,
      src_geo_lat,
      src_geo_long,
      guid,
      src_geo_id,
      email_size,
      emailattachment_count,
      dst_email_count,
      dst_email_addr,
      src_email_addr,
      email_id,
      raw
    ]
  }
}
