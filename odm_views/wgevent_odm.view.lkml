view: wgevent_odm {
    sql_table_name:wgevent_odm
      ;;

dimension: MESSAGE_DESCRIPTION {
  type: string
  sql: case
   WHEN ${event_id} ='11000003' THEN 'Authentication server unavailable'
   WHEN ${event_id} ='11000004' THEN 'User authentication succeeded'
   WHEN ${event_id} ='11000005' THEN 'User authentication failed'
   WHEN ${event_id} ='11000006' THEN 'User unlock'
   WHEN ${event_id} ='11000007' THEN 'User lock'
   WHEN ${event_id} ='11000008' THEN 'BOVPN TLS client authentication failed'
   WHEN ${event_id} ='1100000C' THEN 'Authentication error'
   WHEN ${event_id} ='1100000D' THEN 'Authentication server unavailable'
   WHEN ${event_id} ='1100000E' THEN 'Unsupported RADIUS method'
   WHEN ${event_id} ='1100000F' THEN 'Groups maximum reached'
   WHEN ${event_id} ='11000010' THEN 'Firebox connected to SSO agent'
   WHEN ${event_id} ='11000011' THEN 'Firebox closed the connection'
   WHEN ${event_id} ='11000012' THEN 'Firebox failed to connect to the SSO agent'
   WHEN ${event_id} ='11000013' THEN 'Successful SSO agent failover'
   WHEN ${event_id} ='11000014' THEN 'Unsuccessful SSO failover'
   END;;
}


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
    type: string
    sql: ${TABLE}."EVENT_ID" ;;
  }

  dimension: capacity {
    type: string
    sql: ${TABLE}."CAPACITY" ;;
  }

  dimension: dvc_id {
    type: string
    sql: ${TABLE}."DVC_ID" ;;
  }

  dimension: src_if {
    type: string
    sql: ${TABLE}."SRC_IF" ;;
  }

  dimension: dst_ip {
    type: string
    sql: ${TABLE}."DST_IP" ;;
  }

  dimension: dst_port {
    type: string
    sql: ${TABLE}."DST_PORT" ;;
  }

  dimension: src_ip {
    type: string
    sql: ${TABLE}."SRC_IP" ;;
  }

  dimension: src_nat_ip {
    type: string
    sql: ${TABLE}."SRC_NAT_IP" ;;
  }

  dimension: src_port {
    type: string
    sql: ${TABLE}."SRC_PORT" ;;
  }

  dimension: dst_mac {
    type: string
    sql: ${TABLE}."DST_MAC" ;;
  }

  dimension: src_mac {
    type: string
    sql: ${TABLE}."SRC_MAC" ;;
  }

  dimension: msg {
    type: string
    sql: ${TABLE}."MSG" ;;
  }

  dimension: src_host {
    type: string
    sql: ${TABLE}."SRC_HOST" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."STATE" ;;
  }

  dimension: src_path {
    type: string
    sql: ${TABLE}."SRC_PATH" ;;
  }

  dimension: policy {
    type: string
    sql: ${TABLE}."POLICY" ;;
  }

  dimension: src_proxy_type {
    type: string
    sql: ${TABLE}."SRC_PROXY_TYPE" ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}."CODE" ;;
  }

  dimension: src_geo_city {
    type: string
    sql: ${TABLE}."SRC_GEO_CITY" ;;
  }

  dimension: src_geo_country {
    type: string
    sql: ${TABLE}."SRC_GEO_COUNTRY" ;;
  }

  dimension: src_geo_lat {
    type: string
    sql: ${TABLE}."SRC_GEO_LAT" ;;
  }

  dimension: src_geo_long {
    type: string
    sql: ${TABLE}."SRC_GEO_LONG" ;;
  }

  dimension: src_object_type {
    type: string
    sql: ${TABLE}."SRC_OBJECT_TYPE" ;;
  }

  dimension: src_user_name {
    type: string
    sql: ${TABLE}."SRC_USER_NAME" ;;
  }

  dimension: src_user_type {
    type: string
    sql: ${TABLE}."SRC_USER_TYPE" ;;
  }

  dimension: risk_desc {
    type: string
    sql: ${TABLE}."RISK_DESC" ;;
  }

  dimension: guid {
    type: string
    sql: ${TABLE}."GUID" ;;
  }

  dimension: rpt_host {
    type: string
    sql: ${TABLE}."RPT_HOST" ;;
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
      capacity,
      dvc_id,
      src_if,
      dst_ip,
      dst_port,
      src_ip,
      src_nat_ip,
      src_port,
      dst_mac,
      src_mac,
      msg,
      src_host,
      state,
      src_path,
      policy,
      src_proxy_type,
      code,
      src_geo_city,
      src_geo_country,
      src_geo_lat,
      src_geo_long,
      src_object_type,
      src_user_name,
      src_user_type,
      risk_desc,
      guid,
      rpt_host,
      raw
    ]
  }
}
