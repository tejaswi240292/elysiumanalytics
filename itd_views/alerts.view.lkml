view: alerts_view {
  derived_table: {
    sql: select id,event_time,source_nm,src_username,src_ip,dst_ip,hostname,alert_type,alert_abbr_nm,alert_desc,processing_dttm,PARENT_ALERT_ID,LATITUDE,longitude,
      case when alert_type in ('UALk','ULMuH','NwESe','UA10Lk1Hh','UnPsDc','ApThNt') then '5'
           when alert_type in ('UPrAcEc','UAcNwCo','UAcNwCt') then '4'
           when alert_type in ('UAdScEnGlG','URmScEnGlG','MwDcWe','UAcMuW') then '3'
           when alert_type in ('AuLgCs','UAcNwDeP','UAcNwSoP') then '2'
           when alert_type in ('NwWnU','GlNwCt') then '1' else '3'
      end as severity from vw_profile_alert_events_corrected wHERE id = PARENT_ALERT_ID and alert_type <> 'NwPAcGl' and alert_type <> 'UAcMuW' and alert_type <> 'CpFi' and {% condition datefilter %} event_time {% endcondition %}
      union all
      select id,event_date,source_nm,name,null as src_ip,null as dst_ip,null as hostname,alert_type,alert_type,alert_type as alert_desc,null as processing_dttm,id as PARENT_ALERT_ID,'null' as LATITUDE,'null' as longitude,'5' as severity from ml_alerts where type='user' AND id = PARENT_ALERT_ID and {% condition datefilter %} event_date {% endcondition %}
      union all
      select id,event_date,source_nm,null,name as src_ip,null as dst_ip,null as hostname,alert_type,alert_type,alert_type as alert_desc,null as processing_dttm,id as PARENT_ALERT_ID,'null' as LATITUDE,'null' as longitude,'5' as severity from ml_alerts where type='entity' and id = PARENT_ALERT_ID and {% condition datefilter %} event_date {% endcondition %}
       ;;
  }

  filter: datefilter {
    type: date
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: event_time {
    type: time
    sql: ${TABLE}."EVENT_TIME" ;;
  }

  dimension: event_date {
    type: date
    sql: ${event_time_date} ;;
  }

  dimension: source_nm {
    type: string
    sql: ${TABLE}."SOURCE_NM" ;;
  }

  dimension: src_username {
    type: string
    sql: ${TABLE}."SRC_USERNAME" ;;
  }

  dimension: src_ip {
    type: string
    sql: ${TABLE}."SRC_IP" ;;
    link: {
      label: "drill inside"
      url: "/dashboards/9?Sourceip={{value}}"
    }
  }

  dimension: dst_ip {
    type: string
    sql: ${TABLE}."DST_IP" ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}."HOSTNAME" ;;
  }

  dimension: alert_type {
    type: string
    sql: ${TABLE}."ALERT_TYPE" ;;
  }

  dimension: alert_abbr_nm {
    type: string
    sql: ${TABLE}."ALERT_ABBR_NM" ;;

    link:
    {
      label: "Filter By Alert Name"
      url: "/dashboards/95?alert_name={{ value }}"
    }
  }

  dimension: alert_desc {
    type: string
    sql: ${TABLE}."ALERT_DESC" ;;
  }

  dimension_group: processing_dttm {
    type: time
    sql: ${TABLE}."PROCESSING_DTTM" ;;
  }

  dimension: parent_alert_id {
    type: string
    sql: ${TABLE}."PARENT_ALERT_ID" ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}."LATITUDE" ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}."LONGITUDE" ;;
  }

  dimension: severity {
    type: string
    sql: ${TABLE}."SEVERITY" ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude};;
  }

  set: detail {
    fields: [
      id,
      event_time_time,
      source_nm,
      src_username,
      src_ip,
      dst_ip,
      hostname,
      alert_type,
      alert_abbr_nm,
      alert_desc,
      processing_dttm_time,
      parent_alert_id,
      latitude,
      longitude,
      severity,
      location
    ]
  }
}
