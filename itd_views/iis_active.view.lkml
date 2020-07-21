view: iis_active {
  derived_table: {
    sql: select case when src_user_name is null then 'Anonymous' else src_user_name end  src_user_name,session_start,session_end,Occurence,Device,Device_version from
      (select src_user_name,
      min(event_time) as session_start,
      max(event_time) as session_end,
      count(distinct (event_time)) as Occurence,
      case when position('/', http_useragent) = 0 then http_useragent else
      substring (http_useragent,0,position('/', http_useragent)-1) end as Device,
      case when position('/', http_useragent) = 0 then http_useragent else
      substring (http_useragent,position('/', http_useragent)+1,
      length(http_useragent)) end as Device_Version
      from iis_odm where {% condition datefilter %} event_time {% endcondition %} and  {% condition User %} src_user_name {% endcondition %}
      group by
      src_user_name,
      http_useragent ) sst
       ;;
  }

  filter: datefilter {
    type: date
  }
  filter: User {
    type: string
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: src_user_name {
    type: string
    sql: ${TABLE}."SRC_USER_NAME" ;;
    link:
    {
      label: "filter_user"
      url: "/dashboards/37?User={{ value }}"
    }
  }

  dimension_group: session_start {
    type: time
    sql: ${TABLE}."SESSION_START" ;;
  }

  dimension_group: session_end {
    type: time
    sql: ${TABLE}."SESSION_END" ;;
  }

  dimension: occurence {
    type: number
    sql: ${TABLE}."OCCURENCE" ;;
  }

measure: Count_of_sessions{
  type: sum
  sql: ${occurence} ;;
  drill_fields: [detail*]

}
  dimension: device {
    type: string
    sql: ${TABLE}."DEVICE" ;;
  }

  dimension: device_version {
    type: string
    sql: ${TABLE}."DEVICE_VERSION" ;;
  }

  set: detail {
    fields: [
      src_user_name,
      session_start_time,
      session_end_time,
      occurence,
      device,
      device_version
    ]
  }
}
