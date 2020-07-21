view: wgevent_test {

    sql_table_name:wgevent_batch;;



  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: guid {
    type: string
    sql: ${TABLE}."GUID" ;;
  }

  dimension: timestamp {
    type: number
    sql: ${TABLE}."TIMESTAMP" ;;
  }

  dimension_group: event_time {
    type: time
    sql: ${TABLE}."EVENT_TIME" ;;
  }

  dimension: syslog_event_datetime {
    type: string
    sql: ${TABLE}."SYSLOG_EVENT_DATETIME" ;;
  }

  dimension: syslog_host {
    type: string
    sql: ${TABLE}."SYSLOG_HOST" ;;
  }

  dimension: leef_msgid {
    type: string
    sql: ${TABLE}."LEEF_MSGID" ;;
  }

  dimension: msg_parsed {
    type: string
    sql: ${TABLE}."MSG_PARSED" ;;
  }

  dimension: apt_message {
    type: string
    sql: ${TABLE}."APT_MESSAGE" ;;
  }

  dimension: capacity {
    type: string
    sql: ${TABLE}."CAPACITY" ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}."CLIENT_NAME" ;;
  }

  dimension: deviceid {
    type: string
    sql: ${TABLE}."DEVICEID" ;;
  }

  dimension: failure_count {
    type: number
    sql: ${TABLE}."FAILURE_COUNT" ;;
  }

  dimension: if_name {
    type: string
    sql: ${TABLE}."IF_NAME" ;;
  }

  dimension: inf_number {
    type: string
    sql: ${TABLE}."INF_NUMBER" ;;
  }

  dimension: ip_dst_addr {
    type: string
    sql: ${TABLE}."IP_DST_ADDR" ;;
  }

  dimension: ip_dst_port {
    type: string
    sql: ${TABLE}."IP_DST_PORT" ;;
  }

  dimension: ip_src_addr {
    type: string
    sql: ${TABLE}."IP_SRC_ADDR" ;;
    link: {
      label: "FILTER_INSIDE"
      url: "/dashboards/9?Sourceip={{ value | url_encode }}"
    }
  }

  dimension: ip_src_addr_nat {
    type: string
    sql: ${TABLE}."IP_SRC_ADDR_NAT" ;;
  }

  dimension: ip_src_port {
    type: string
    sql: ${TABLE}."IP_SRC_PORT" ;;
  }

  dimension: load {
    type: string
    sql: ${TABLE}."LOAD" ;;
  }

  dimension: lockout_type {
    type: string
    sql: ${TABLE}."LOCKOUT_TYPE" ;;
  }

  dimension: mac_dst {
    type: string
    sql: ${TABLE}."MAC_DST" ;;
  }

  dimension: mac_src {
    type: string
    sql: ${TABLE}."MAC_SRC" ;;
  }

  dimension: mask_length {
    type: number
    sql: ${TABLE}."MASK_LENGTH" ;;
  }

  dimension: md5_hash {
    type: string
    sql: ${TABLE}."MD5_HASH" ;;
  }

  dimension: msg {
    type: string
    sql: ${TABLE}."MSG" ;;
  }

  dimension: msg_host {
    type: string
    sql: ${TABLE}."MSG_HOST" ;;
  }

  dimension: msg_version1 {
    type: string
    sql: ${TABLE}."MSG_VERSION1" ;;
  }

  dimension: method {
    type: string
    sql: ${TABLE}."METHOD" ;;
  }

  dimension: mode {
    type: string
    sql: ${TABLE}."MODE" ;;
  }

  dimension: network_ip {
    type: string
    sql: ${TABLE}."NETWORK_IP" ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}."PATH" ;;
  }

  dimension: policy_name {
    type: string
    sql: ${TABLE}."POLICY_NAME" ;;
  }

  dimension: proxy_type {
    type: string
    sql: ${TABLE}."PROXY_TYPE" ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}."REASON" ;;
  }

  dimension: src_ip_geo_country {
    type: string
    sql: ${TABLE}."SRC_IP_GEO_COUNTRY" ;;
  }

  dimension: src_ip_geo_city {
    type: string
    sql: ${TABLE}."SRC_IP_GEO_CITY" ;;
  }

  dimension: src_ip_geo_dmacode {
    type: string
    sql: ${TABLE}."SRC_IP_GEO_DMACODE" ;;
  }

  dimension: src_ip_geo_latitude {
    type: string
    sql: ${TABLE}."SRC_IP_GEO_LATITUDE" ;;
  }

  dimension: src_ip_geo_longitude {
    type: string
    sql: ${TABLE}."SRC_IP_GEO_LONGITUDE" ;;
  }

  dimension: dst_ip_geo_country {
    type: string
    sql: ${TABLE}."DST_IP_GEO_COUNTRY" ;;
  }

  dimension: dst_ip_geo_city {
    type: string
    sql: ${TABLE}."DST_IP_GEO_CITY" ;;
  }

  dimension: dst_ip_geo_dmacode {
    type: string
    sql: ${TABLE}."DST_IP_GEO_DMACODE" ;;
  }

  dimension: dst_ip_geo_latitude {
    type: string
    sql: ${TABLE}."DST_IP_GEO_LATITUDE" ;;
  }

  dimension: dst_ip_geo_longitude {
    type: string
    sql: ${TABLE}."DST_IP_GEO_LONGITUDE" ;;
  }

  dimension: service {
    type: string
    sql: ${TABLE}."SERVICE" ;;
  }

  dimension: task_uuid {
    type: string
    sql: ${TABLE}."TASK_UUID" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}."USER_NAME" ;;
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}."USER_TYPE" ;;
  }

  dimension: is_alert {
    type: string
    sql: ${TABLE}."IS_ALERT" ;;
  }

  dimension: alerts {
    type: string
    sql: ${TABLE}."ALERTS" ;;
  }

  dimension: alerts_description {
    type: string
    sql: ${TABLE}."ALERTS_DESCRIPTION" ;;
  }

  dimension: processing_dttm {
    type: string
    sql: ${TABLE}."PROCESSING_DTTM" ;;
  }

  dimension: original_string {
    type: string
    sql: ${TABLE}."ORIGINAL_STRING" ;;
  }

  set: detail {
    fields: [
      guid,
      timestamp,
      event_time_time,
      syslog_event_datetime,
      syslog_host,
      leef_msgid,
      msg_parsed,
      apt_message,
      capacity,
      client_name,
      deviceid,
      failure_count,
      if_name,
      inf_number,
      ip_dst_addr,
      ip_dst_port,
      ip_src_addr,
      ip_src_addr_nat,
      ip_src_port,
      load,
      lockout_type,
      mac_dst,
      mac_src,
      mask_length,
      md5_hash,
      msg,
      msg_host,
      msg_version1,
      method,
      mode,
      network_ip,
      path,
      policy_name,
      proxy_type,
      reason,
      src_ip_geo_country,
      src_ip_geo_city,
      src_ip_geo_dmacode,
      src_ip_geo_latitude,
      src_ip_geo_longitude,
      dst_ip_geo_country,
      dst_ip_geo_city,
      dst_ip_geo_dmacode,
      dst_ip_geo_latitude,
      dst_ip_geo_longitude,
      service,
      task_uuid,
      type,
      user_name,
      user_type,
      is_alert,
      alerts,
      alerts_description,
      processing_dttm,
      original_string
    ]
  }
}
