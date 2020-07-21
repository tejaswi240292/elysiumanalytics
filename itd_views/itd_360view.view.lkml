view: itd_360view {
   derived_table: {

    sql:
    select * from view360ip;;
  }



#   sql_table_name: view360ip  ;;


filter: user {
  type: string
}

filter: ip {
  type: string
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
    sql: ${TABLE}."EVENT_TIME1" ;;
    drill_fields: []


  }

  dimension: event_time {
    type: string
    sql: ${event_time_date} ;;
    drill_fields: []
    link:
    {
      label: "filter_date"
      url: "/dashboards/5?datefilter={{ value }}&User={{userid._value}}"
    }

  }


  dimension: event_time_day {
    type: string
    sql: ${timeofevent_date} ;;
    drill_fields: []
    link:
    {
      label: "Filter Date"
      url: "/dashboards/6?datefilter={{ value }}&Ip={{sourceip._value}}"
    }

  }










  dimension_group: timeofevent {
    type: time
    sql: ${TABLE}."TIMEOFEVENT" ;;
  }

  dimension: sourceip {
    type: string
    sql: ${TABLE}."SOURCEIP";;
    link:
    {
      label: "Go to 360 IP View"
      url: "/dashboards/6?Ip={{ value }}"
    }
    drill_fields: [sourceip]

  }

  dimension: userid {
    type: string
    sql: ${TABLE}."USERID";;
    drill_fields: [userid]
    link:
    {
    label: "Go to 360 User View"
    url: "/dashboards/5?User={{ value }}"
    }

    link: {
      label: "kibana Search"
      url: "https://{{ _user_attributes['search_ip'] }}/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-3d,to:now))&_a=(columns:!(_source),index:search_odm,interval:auto,query:(query:'src_user_name:{{ value }}'),sort:!(!(EVENT_TIME,desc)))"
    }

  }

  dimension: event_desc {
    type: string
    sql: ${TABLE}."EVENT_DESC" ;;
  }

  dimension: reportinghost {
    type: string
    sql: ${TABLE}."REPORTINGHOST" ;;
  }

  dimension: eventid {
    type: string
    sql: ${TABLE}."EVENTID" ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}."SUBJECT" ;;
  }

  dimension: src_type {
    type: string
    sql: ${TABLE}."SRC_TYPE" ;;
  }

  dimension: email_size {
    type: string
    sql: ${TABLE}."EMAIL_SIZE" ;;
  }

  dimension: in_bytes {
    type: string
    sql: ${TABLE}."IN_BYTES" ;;
  }

  dimension: out_bytes {
    type: string
    sql: ${TABLE}."OUT_BYTES" ;;
  }

  dimension: risk {
    type: string
    sql: ${TABLE}."RISK" ;;
  }

  dimension: alerts_description {
    type: string
    sql: ${TABLE}."ALERTS_DESCRIPTION" ;;
  }
  measure: Count_Of_Alerts_Description{
    type: count_distinct
    sql: ${alerts_description} ;;
    drill_fields: [detail*]
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}."HOSTNAME" ;;
  }

  dimension: email_avg_size_zscore {
    type: number
    sql: ${TABLE}."EMAIL_AVG_SIZE_ZSCORE" ;;

  }

  dimension: email_count_zscore {
    type: number
    sql: ${TABLE}."EMAIL_COUNT_ZSCORE" ;;

  }

  dimension: emails_size_zscore {
    type: number
    sql: ${TABLE}."EMAILS_SIZE_ZSCORE" ;;

  }

  dimension: ext_receiver_zscore {
    type: number
    sql: ${TABLE}."EXT_RECEIVER_ZSCORE" ;;

  }

  dimension: if_dwnld_zscore {
    type: number
    sql: ${TABLE}."IF_DWNLD_ZSCORE" ;;

  }

  dimension: if_upld_zscore {
    type: number
    sql: ${TABLE}."IF_UPLD_ZSCORE" ;;

  }

  dimension: failedlogin_zscore {
    type: number
    sql: ${TABLE}."FAILEDLOGIN_ZSCORE" ;;

  }

  dimension: fileactivity_zscore {
    type: number
    sql: ${TABLE}."FILEACTIVITY_ZSCORE" ;;

  }

  dimension: logins_zscore {
    type: number
    sql: ${TABLE}."LOGINS_ZSCORE" ;;

  }

  dimension: pri_zscore {
    type: number
    sql: ${TABLE}."PRI_ZSCORE" ;;

  }

  dimension: ps_zscore {
    type: number
    sql: ${TABLE}."PS_ZSCORE" ;;

  }


  dimension: status {
    sql: ${TABLE}.risk_score ;;
    html:
      {% if risk_score._value >= 100 %}
         <p><img src="https://i.postimg.cc/WzSxPC9q/phishing-icon.png" height=30 width=30></p>
      {% endif %}
;;
    link: {
      label: "Mitre Attack"
      url: "https://attack.mitre.org/beta/techniques/T1566/"
      icon_url: "https://i.postimg.cc/sxrsD2jk/download.png"
    }
  }

  dimension: anomaly_score {
    type: number
    sql: ${TABLE}."ANOMALY_SCORE" ;;
  }
  measure: Sum_of_Anomaly_Score {
    type: sum
    sql: ${anomaly_score} ;;
    drill_fields: [detail*]
  }

  dimension: risk_score {
    type: number
    sql: ${TABLE}."RISK_SCORE" ;;

  }
measure: Sum_of_Risk_Score {
  type: sum
  sql: ${risk_score} ;;
  drill_fields: [detail*]
}
  dimension: event_user_anomaly_score {
    type: number
    sql: ${TABLE}."EVENT_USER_ANOMALY_SCORE" ;;
  }
measure: Sum_of_Event_User_Anomaly_Score{
  type: sum
  sql: ${event_user_anomaly_score} ;;
  drill_fields: [detail*]
}
  dimension: event_entity_anomaly_score {
    type: number
    sql: ${TABLE}."EVENT_ENTITY_ANOMALY_SCORE" ;;
      }

  dimension: dst_name {
    type: string
    sql: ${TABLE}."DST_NAME" ;;
    html:
    {% if value != 'NA' AND value != blank  %}
    <p style="color: red; font-size: 100%">{{ rendered_value }}</p>
    {% else %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>
    {% endif %};;
    case_sensitive: no

  }

  dimension: urllnkdin_zscore {
    type: number
    sql: ${TABLE}."URLLNKDIN_ZSCORE" ;;
  }

  dimension: email_avg_size_ts {
    type: number
    sql: ${TABLE}."EMAIL_AVG_SIZE_TS" ;;
  }

  dimension: email_count_ts {
    type: number
    sql: ${TABLE}."EMAIL_COUNT_TS" ;;
  }

  dimension: emails_size_ts {
    type: number
    sql: ${TABLE}."EMAILS_SIZE_TS" ;;
  }

  dimension: ext_receiver_ts {
    type: number
    sql: ${TABLE}."EXT_RECEIVER_TS" ;;
  }

  dimension: if_dwnld_ts {
    type: number
    sql: ${TABLE}."IF_DWNLD_TS" ;;
  }
measure: Sum_of_if_dwnld_ts{
  type: sum
  sql: ${if_dwnld_ts} ;;
  drill_fields: [detail*]
}
  dimension: if_upld_ts {
    type: number
    sql: ${TABLE}."IF_UPLD_TS" ;;
  }

  dimension: failedlogin_ts {
    type: number
    sql: ${TABLE}."FAILEDLOGIN_TS" ;;
  }

  dimension: fileactivity_ts {
    type: number
    sql: ${TABLE}."FILEACTIVITY_TS" ;;
  }

  dimension: logins_ts {
    type: number
    sql: ${TABLE}."LOGINS_TS" ;;
  }

  dimension: pri_ts {
    type: number
    sql: ${TABLE}."PRI_TS" ;;
  }

  dimension: ps_ts {
    type: number
    sql: ${TABLE}."PS_TS" ;;
  }

  dimension: urllnkdin_ts {
    type: number
    sql: ${TABLE}."URLLNKDIN_TS" ;;
  }

  dimension: email_avg_size_val {
    type: number
    sql: ${TABLE}."EMAIL_AVG_SIZE_VAL" ;;
  }

  dimension: email_count_val {
    type: number
    sql: ${TABLE}."EMAIL_COUNT_VAL" ;;
  }

  dimension: emails_size_val {
    type: number
    sql: ${TABLE}."EMAILS_SIZE_VAL" ;;
  }

  dimension: ext_receiver_val {
    type: number
    sql: ${TABLE}."EXT_RECEIVER_VAL" ;;
  }

  dimension: if_dwnld_val {
    type: number
    sql: ${TABLE}."IF_DWNLD_VAL" ;;
  }
  measure: Sum_of_if_dwnld_val {
    type: sum
    sql: ${if_dwnld_val} ;;
    drill_fields: [detail*]
  }

  dimension: if_upld_val {
    type: number
    sql: ${TABLE}."IF_UPLD_VAL" ;;
  }

  dimension: failedlogin_val {
    type: number
    sql: ${TABLE}."FAILEDLOGIN_VAL" ;;
  }

  dimension: fileactivity_val {
    type: number
    sql: ${TABLE}."FILEACTIVITY_VAL" ;;
  }

  dimension: logins_val {
    type: number
    sql: ${TABLE}."LOGINS_VAL" ;;
  }

  dimension: pri_val {
    type: number
    sql: ${TABLE}."PRI_VAL" ;;
  }

  dimension: ps_val {
    type: number
    sql: ${TABLE}."PS_VAL" ;;
  }

  dimension: urllnkdin_val {
    type: number
    sql: ${TABLE}."URLLNKDIN_VAL" ;;
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

  dimension: displayname {
    type: string
    sql: ${TABLE}."DISPLAYNAME" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: emailaddress {
    type: string
    sql: ${TABLE}."EMAILADDRESS" ;;
  }

  dimension: qry {
    type: string
    sql: ${TABLE}."QRY" ;;
  }

  dimension: raw {
    type: string
    sql: ${TABLE}."RAW" ;;
  }

  dimension: row_n {
    type: number
    sql: ${TABLE}."ROW_N" ;;
  }

  dimension: src_location {
    type: location
    sql_latitude: ${src_geo_lat};;
    sql_longitude: ${src_geo_long} ;;
  }

  measure: critical{
    type: sum
    sql: CASE when ${event_user_anomaly_score} >=4000 Then 1 end  ;;
    drill_fields: [detail*]

  }

  measure: high{
    type: sum
    sql: CASE when ${event_user_anomaly_score} >=1000 Then 1 end  ;;
    drill_fields: [detail*]

  }


  measure: medium{
    type: sum
    sql: CASE when ${event_user_anomaly_score} >=300 Then 1 end ;;
    drill_fields: [detail*]

  }

  measure: low{
    type: sum
    sql: CASE when ${event_user_anomaly_score} >=150 Then 1 end  ;;
    drill_fields: [detail*]
  }

  measure: all{
    type: sum
    sql: CASE when ${event_user_anomaly_score} >=0 Then 1 end  ;;


  }



  dimension: entity_urgency{
    sql: CASE when ${event_entity_anomaly_score} >=1000 Then 'critical'
      when (${event_entity_anomaly_score} <1000 and ${event_entity_anomaly_score} >500) then 'high'
      when (${event_entity_anomaly_score} <500 and ${event_entity_anomaly_score} >=200) then 'medium'
      when (${event_entity_anomaly_score} <=200) then 'low' else 'unknown'
      end ;;

    link:
    {
      label: "Filter By Urgency"
      url: "/dashboards/6?Urgency={{ value }}&Ip={{sourceip._value}}"
    }
  }


  set: detail {
    fields: [
      id,
      event_time_time,
      timeofevent_time,
      sourceip,
      userid,
      event_desc,
      reportinghost,
      eventid,
      subject,
      src_type,
      email_size,
      in_bytes,
      out_bytes,
      risk,
      alerts_description,
      hostname,
      email_avg_size_zscore,
      email_count_zscore,
      emails_size_zscore,
      ext_receiver_zscore,
      if_dwnld_zscore,
      if_upld_zscore,
      failedlogin_zscore,
      fileactivity_zscore,
      logins_zscore,
      pri_zscore,
      ps_zscore,
      anomaly_score,
      risk_score,
      event_user_anomaly_score,
      event_entity_anomaly_score,
      dst_name,
      urllnkdin_zscore,
      email_avg_size_ts,
      email_count_ts,
      emails_size_ts,
      ext_receiver_ts,
      if_dwnld_ts,
      if_upld_ts,
      failedlogin_ts,
      fileactivity_ts,
      logins_ts,
      pri_ts,
      ps_ts,
      urllnkdin_ts,
      email_avg_size_val,
      email_count_val,
      emails_size_val,
      ext_receiver_val,
      if_dwnld_val,
      if_upld_val,
      failedlogin_val,
      fileactivity_val,
      logins_val,
      pri_val,
      ps_val,
      urllnkdin_val,
      src_geo_city,
      src_geo_lat,
      src_geo_long,
      displayname,
      description,
      emailaddress,
      row_n
    ]
  }
}
