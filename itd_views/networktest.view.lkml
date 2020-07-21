view: networktest {
  derived_table: {
    sql: select event_date,lower(src_username) as src_username,hostname,
    session_start_time,session_end_time,src_logonid,assigned_ips,
    eventid_with_same_src_logonid,src_logonid_evt_count,eventid_with_same_tgt_logonid,
    TGT_LOGONID_EVT_COUNT,LOGON_START_TIME,linked_loginid,
    ELEVATED_TOKEN,parent_logon_type,session_log from NP_SESSION_TRACKING_INFO
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: event_date {
    type: date
    sql: ${TABLE}."EVENT_DATE" ;;
  }

  dimension: src_username {
    type: string
    sql: ${TABLE}."SRC_USERNAME" ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}."HOSTNAME" ;;
  }

  dimension_group: session_start_time {
    type: time
    sql: ${TABLE}."SESSION_START_TIME" ;;
  }

  dimension_group: session_end_time {
    type: time
    sql: ${TABLE}."SESSION_END_TIME" ;;
  }

  dimension: src_logonid {
    type: string
    sql: ${TABLE}."SRC_LOGONID" ;;
    link: {
      label: "FILTER LOGONID"
      url: "/dashboards/34?LOGONID={{ value | url_encode }}"
    }

  }

  dimension: assigned_ips {
    type: string
    sql: ${TABLE}."ASSIGNED_IPS" ;;
  }

  dimension: eventid_with_same_src_logonid {
    type: string
    sql: ${TABLE}."EVENTID_WITH_SAME_SRC_LOGONID" ;;
  }

  dimension: src_logonid_evt_count {
    type: number
    sql: ${TABLE}."SRC_LOGONID_EVT_COUNT" ;;
  }

  dimension: eventid_with_same_tgt_logonid {
    type: string
    sql: ${TABLE}."EVENTID_WITH_SAME_TGT_LOGONID" ;;
  }

  dimension: tgt_logonid_evt_count {
    type: number
    sql: ${TABLE}."TGT_LOGONID_EVT_COUNT" ;;
  }

  dimension_group: logon_start_time {
    type: time
    sql: ${TABLE}."LOGON_START_TIME" ;;
  }

  dimension: linked_loginid {
    type: string
    sql: ${TABLE}."LINKED_LOGINID" ;;
  }

  dimension: elevated_token {
    type: string
    sql: ${TABLE}."ELEVATED_TOKEN" ;;
  }

  dimension: parent_logon_type {
    type: string
    sql: ${TABLE}."PARENT_LOGON_TYPE" ;;
  }

  dimension: session_log {
    type: string
    sql: ${TABLE}."SESSION_LOG" ;;
  }

  set: detail {
    fields: [
      event_date,
      src_username,
      hostname,
      session_start_time_time,
      session_end_time_time,
      src_logonid,
      assigned_ips,
      eventid_with_same_src_logonid,
      src_logonid_evt_count,
      eventid_with_same_tgt_logonid,
      tgt_logonid_evt_count,
      logon_start_time_time,
      linked_loginid,
      elevated_token,
      parent_logon_type,
      session_log
    ]
  }
}
