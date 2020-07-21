view: watchguard_sessions {
     sql_table_name:watchguard_sessions
    ;;



  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: watchguard_host {
    type: string
    sql: ${TABLE}."WATCHGUARD_HOST" ;;
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}."USER_TYPE" ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}."USER_NAME" ;;
    link:
    {
      label: "filter_user"
      url: "/dashboards/73?User={{ value }}"
    }
  }



  dimension: ip_src_addr {
    type: string
    sql: ${TABLE}."IP_SRC_ADDR" ;;
  }

  dimension: ip_src_addr_nat {
    type: string
    sql: ${TABLE}."IP_SRC_ADDR_NAT" ;;
  }

  dimension: src_ip_geo_latitude {
    type: string
    sql: ${TABLE}."SRC_IP_GEO_LATITUDE" ;;
  }

  dimension: src_ip_geo_longitude {
    type: string
    sql: ${TABLE}."SRC_IP_GEO_LONGITUDE" ;;
  }

  dimension: deviating_distance {
    type: number
    sql: ${TABLE}."DEVIATING_DISTANCE" ;;
  }

  dimension: src_ip_geo_city {
    type: string
    sql: ${TABLE}."SRC_IP_GEO_CITY" ;;
  }

  dimension: src_ip_geo_country {
    type: string
    sql: ${TABLE}."SRC_IP_GEO_COUNTRY" ;;
  }

  dimension_group: session_start_datetime {
    type: time
    sql: ${TABLE}."SESSION_START_DATETIME" ;;
  }

  dimension: session_status {
    type: string
    sql: ${TABLE}."SESSION_STATUS" ;;
  }

  dimension_group: session_end_datetime {
    type: time
    sql: ${TABLE}."SESSION_END_DATETIME" ;;
  }

  dimension: session_end_type {
    type: string
    sql: ${TABLE}."SESSION_END_TYPE" ;;
  }

  dimension: src_location {
    type: location
    sql_latitude: ${src_ip_geo_latitude} ;;
    sql_longitude: ${src_ip_geo_longitude} ;;
  }

  set: detail {
    fields: [
      watchguard_host,
      user_type,
      user_name,
      ip_src_addr,
      ip_src_addr_nat,
      src_ip_geo_latitude,
      src_ip_geo_longitude,
      deviating_distance,
      src_ip_geo_city,
      src_ip_geo_country,
      session_start_datetime_time,
      session_status,
      session_end_datetime_time,
      session_end_type
    ]
  }
}
