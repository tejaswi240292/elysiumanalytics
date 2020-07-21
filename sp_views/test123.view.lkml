view: test123 {
  derived_table: {
    sql:  select v.EVENT_DATE,
v.SESSION_START_TIME,
v.SESSION_END_TIME,
v.src_logonid,
'WINDOWS_SESSION' as type,
lower(v.src_username) as src_user_name,
null as dst_email_addr,
null as email_subject,
null as EMAIL_SIZE,
null as emailattachment_count,
null as SESSION_STATUS,
NULL AS src_ip,
NULL AS dst_ip,
NULL AS dst_port,
 null as host,
 null as event_id,
 null as app_id,
 null as risk_count,
 null as malware_name,
 null as action,
 null as msg ,
 null as web_category,
 null as dst_domain ,
 v.ASSIGNED_IPS ,
 null as OBJECT_NAME,
timediff(minutes, v.SESSION_START_TIME,v.SESSION_END_TIME) as duration_MI,
(duration_MI/60) as duration_Hr
from NP_SESSION_TRACKING_INFO v where {% condition datefilter %} EVENT_DATE {% endcondition %}

union all

select EVENT_TIME,
EVENT_TIME as SESSION_START_TIME,
EVENT_TIME as SESSION_END_TIME,
raw:"SubjectLogonId" :: varchar as SRC_LOGONID,
'FILE' as type,
lower(SRC_USER_NAME) as src_user_name,
null as dst_email_addr,
null as email_subject,
null as EMAIL_SIZE,
null as emailattachment_count,
null as SESSION_STATUS,
NULL AS src_ip,
NULL AS dst_ip,
NULL AS dst_port,
null as host,
 null as event_id,
 null as app_id,
 null as risk_count,
 null as malware_name,
 null as action,
 null as msg ,
 null as CAT_WEB_NAME,
 null as dst_domain ,
 null as ASSIGNED_IPS ,
 raw:ObjectName :: varchar as OBJECT_NAME,
timediff(minutes, SESSION_START_TIME,SESSION_END_TIME) as duration_MI,
(duration_MI/60) as duration_Hr
from  MS_WIN_SECURITYAUDITING_ODM
 where {% condition datefilter %} EVENT_TIME {% endcondition %}
and coalesce(SRC_LOGONID,'0x0') not in ('0x3e7','0x0','0x3e4','0x3e5')
and SRC_USER_NAME like '%.%'
and coalesce(OBJECT_NAME,'-') <> '-'  and raw:ObjectType :: varchar = 'File'
 and raw:ProcessName :: varchar like '%EXCEL.EXE%'
union all


 select event_time::date,min(EVENT_TIME) as SESSION_START_TIME, min(EVENT_TIME) as SESSION_END_TIME,null as src_logonid,
 'EMAIL' as type,lower(src_user_name) as src_user_name ,
 dst_email_addr,email_subject,EMAIL_SIZE,emailattachment_count,null as SESSION_STATUS ,
 NULL AS src_ip,NULL AS dst_ip,NULL AS dst_port, null as host,null as event_id,
 null as app_id,null as risk_count,null as malware_name,null as action,null as msg,
 null as CAT_WEB_NAME,null as dst_domain,null as ASSIGNED_IPS ,null as OBJECT_NAME,
timediff(minutes, SESSION_START_TIME,SESSION_END_TIME) as duration_MI,
(duration_MI/60) as duration_Hr
from MSEXCHANGEMESSAGETRACKING_ODM
 where
 {% condition datefilter %} EVENT_TIME {% endcondition %} and
 src_email_addr like '%sstech.us%' and
 event_name IN ('SEND','RECEIVE')
 group by src_user_name,dst_email_addr,email_subject,EMAIL_SIZE, emailattachment_count,event_time::Date
 union all
 select SESSION_START_DATETIME::date,SESSION_START_DATETIME ,SESSION_END_DATETIME ,null as src_logonid ,'VPN' as type ,
 split(lower(user_name),'@')[0]::String AS src_USER_NAME ,null as dst_email_addr,null as email_subject,null as EMAIL_SIZE,
 null as emailattachment_count,SESSION_STATUS,NULL AS src_ip,NULL AS dst_ip,NULL AS dst_port, null as host,null as event_id,
 null as app_id,null as risk_count,null as malware_name,null as action,null as msg ,
 null as CAT_WEB_NAME,null as dst_domain,null as ASSIGNED_IPS ,null as OBJECT_NAME,
timediff(minutes, SESSION_START_DATETIME,SESSION_END_DATETIME) as duration_MI,
(duration_MI/60) as duration_Hr
from watchguard_sessions
 where  {% condition datefilter %} SESSION_START_DATETIME {% endcondition %}

  union all
 select event_time::Date,min(EVENT_TIME) as SESSION_START_TIME, min(EVENT_TIME) as SESSION_END_TIME,null as src_logonid ,
 'IIS' as type,src_user_name,null as dst_email_addr,null as email_subject,null as EMAIL_SIZE,
 null as emailattachment_count,NULL AS SESSION_STATUS,
 src_ip,dst_ip,dst_port,
 null as host,null as event_id, null as app_id,null as risk_count,null as malware_name ,null as action,null as msg,
 null as web_category,null as dst_domain,null as ASSIGNED_IPS,null as OBJECT_NAME,
timediff(minutes, SESSION_START_TIME,SESSION_END_TIME) as duration_MI,
(duration_MI/60) as duration_Hr
 from iis_odm
 where {% condition datefilter %} EVENT_TIME {% endcondition %}

  group by src_ip,dst_ip,dst_port,src_user_name,event_time::Date

  union all
    select cast(min_event_time as date) as event_date, min_event_time as SESSION_START_TIME,max_event_time as SESSION_END_TIME,
  null as src_logonid ,
 'Streaming Media' as type, lower(src_username) as src_user_name,
 null as dst_email_addr,null as email_subject,null as EMAIL_SIZE,
 null as emailattachment_count,NULL AS SESSION_STATUS,
 src_ip,dst_ip,dst_port,null as host,event_id, null as app_id,
 null as risk_count,null as malware_name ,
 null as action,null as msg,CAT_WEB_NAME,DST_DOMAIN,null as ASSIGNED_IPS,null as OBJECT_NAME,timediff(minutes, SESSION_START_TIME,SESSION_END_TIME) as duration_MI,
(duration_MI/60) as duration_Hr
from (WITH
    WG AS (
        SELECT src_ip,  dst_ip, dst_port, proto, src_user_name,
        EVENT_ID, min(event_time) as min_event_time, max(event_time) AS max_event_time,CAT_WEB_NAME,DST_DOMAIN, count(*) as wgcount
        FROM WG_FW_NETWORKTRAFFIC_ODM
        WHERE   (CAT_WEB_NAME like 'Streaming%' or CAT_WEB_NAME like 'Internet%' or CAT_WEB_NAME like 'Entertain%') and
       {% condition datefilter %} EVENT_TIME {% endcondition %} and

      (SRC_IP ilike '192.168.%' OR SRC_IP ilike '10.%')

        GROUP BY src_ip, /*src_port,*/ dst_ip, dst_port, proto, src_user_name, EVENT_ID,CAT_WEB_NAME,DST_DOMAIN
        ORDER BY 1, 2, 3, 4, 5, 6, 7,8,9
    ),
    WIN AS (
       SELECT STV.VALUE::string AS src_ip, SRC_USERNAME, SRC_LOGONID, HOSTNAME, SESSION_START_TIME,
 SESSION_END_TIME, EVENT_DATE, timediff(minutes, SESSION_START_TIME,SESSION_END_TIME) as duration_MI, (duration_MI/60) as duration_Hr
        FROM NP_SESSION_TRACKING_INFO, LATERAL FLATTEN(ASSIGNED_IPS) STV
        WHERE {% condition datefilter %} EVENT_DATE {% endcondition %}

        ORDER BY SRC_IP, SESSION_START_TIME, SESSION_END_TIME
    )
SELECT WG.src_ip,WG.CAT_WEB_NAME, WG.DST_DOMAIN,WG.dst_ip, WG.dst_port, WG.proto, WG.src_user_name, WG.EVENT_ID, WG.min_event_time, WG.max_event_time, WG.wgcount, WIN.src_ip as ip, WIN.SRC_USERNAME, WIN.SRC_LOGONID, WIN.HOSTNAME, WIN.SESSION_START_TIME, WIN.SESSION_END_TIME, WIN.EVENT_DATE, WIN.DURATION_HR
FROM WG LEFT OUTER JOIN WIN
//FROM WG JOIN WIN
ON (WG.SRC_IP = WIN.SRC_IP) AND (WG.min_event_time >= WIN.SESSION_START_TIME) AND (WG.max_event_time <= WIN.SESSION_END_TIME)
//ORDER BY 1,3,2,4,5,6,7,8,9,10,11,12,13,14,15;
ORDER BY 1,2,3,4,6,7,8,5,9,10,11,12,13,14,15 )sst where src_username!='' ;;

  }

  filter: datefilter {
    type: date
  }


  dimension_group: session_start_time {
    type: time
    sql: ${TABLE}."SESSION_START_TIME" ;;
  }

  dimension_group: session_end_time {
    type: time
    sql: ${TABLE}."SESSION_END_TIME" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
  }

  dimension: SRC_LOGONID {
    type: string
    sql: ${TABLE}."SRC_LOGONID" ;;
    drill_fields: [OBJECT_NAME]
  }

  dimension: OBJECT_NAME {
    type: string
    sql: ${TABLE}."OBJECT_NAME" ;;
  }

  dimension: DST_EMAIL_ADDR {
    type: string
    sql: ${TABLE}."DST_EMAIL_ADDR" ;;
  }

  dimension: SRC_IP {
    type: string
    sql: ${TABLE}."SRC_IP" ;;
  }


  dimension: EMAIL_SUBJECT {
    type: string
    sql: ${TABLE}."EMAIL_SUBJECT" ;;
  }


  dimension: EMAIL_SIZE {
    type: string
    sql: ${TABLE}."EMAIL_SIZE" ;;
  }


  dimension: SESSION_STATUS {
    type: string
    sql: ${TABLE}."SESSION_STATUS" ;;
  }

  dimension: DST_DOMAIN {
    type: string
    sql: ${TABLE}."DST_DOMAIN" ;;
  }

  dimension: assigned_ips {
    type: string
    sql: ${TABLE}."ASSIGNED_IPS" ;;
  }


  dimension: WEB_CATEGORY {
    type: string
    sql: ${TABLE}."WEB_CATEGORY" ;;
  }

  dimension: src_user_name {
    type: string
    sql: ${TABLE}."SRC_USER_NAME" ;;
    link: {
      label: "Contact  Analyst"
      url: "mailto:tejaswi.palacharla@sstech.us"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/4/48/Outlook.com_icon.svg"
    }
  }



  dimension: duration_mi {
    type: number
    sql: ${TABLE}."DURATION_MI" ;;
  }

  dimension: duration_hr {
    type: number
    sql: ${TABLE}."DURATION_HR" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  dimension: status {
    sql: ${TABLE}.type ;;
    html:
      {% if type._value == 'EMAIL'%}
         <p><img src="https://i.postimg.cc/cH4KC3Qm/EMAIL.png" height=20 width=20> {{ rendered_value }}</p>
      {% elsif type._value == 'Streaming Media' %}
        <p><img src="https://i.postimg.cc/v82n1026/Streaming-Media.png" height=20 width=20> {{ rendered_value }}</p>
      {% elsif type._value == 'IIS' %}
        <p><img src="https://i.postimg.cc/jjhwRcJ2/IIS.png" height=20 width=20> {{ rendered_value }}</p>
      {% elsif type._value == 'VPN' %}
        <p><img src="https://i.postimg.cc/52LQRb4w/VPN.png" height=20 width=20> {{ rendered_value }}</p>
      {% elsif type._value == 'FILE' %}
        <p><img src="https://i.postimg.cc/7L747F4X/FILE.png" height=20 width=20> {{ rendered_value }}</p>
      {% else %}
        <p><img src="https://i.postimg.cc/mkg7vqXT/WINDOWS-SESSION.png" height=20 width=20> {{ rendered_value }}</p>
      {% endif %}
;;
  }


#   dimension: status {
#     sql: ${TABLE}.type ;;
#     html:
#       {% if type._value == 'EMAIL' or type._value == 'Complete' %}
#          <p><img src="http://findicons.com/files/icons/573/must_have/48/check.png" height=20 width=20>{{ rendered_value }}</p>
#       {% elsif type._value == 'Streaming Media' %}
#         <p><img src="http://findicons.com/files/icons/1681/siena/128/clock_blue.png" height=20 width=20>{{ rendered_value }}</p>
#       {% else %}
#         <p><img src="http://findicons.com/files/icons/719/crystal_clear_actions/64/cancel.png" height=20 width=20>{{ rendered_value }}</p>
#       {% endif %}
# ;;
#   }

  dimension: Details {
    type: string
    sql: concat('Session Start Time: ',${TABLE}.session_start_time,', ','Session End Time: ',${TABLE}.session_end_time,',  ','Src User Name: ',${TABLE}.src_user_name,', ','Type: ',${TABLE}.type) ;;



  }

  dimension: Details_Information {
    type: string
    sql: concat('AssignedIPs: ',coalesce(${TABLE}.ASSIGNED_IPS::varchar,'NULL'),', ','SRC_LOGONID: ',COALESCE(${TABLE}.SRC_LOGONID,'NULL'),', ','DST_EMAIL_ADDR: ',COALESCE(${TABLE}.DST_EMAIL_ADDR,'NULL'),',  ','EMAIL_SIZE: ',COALESCE(${TABLE}.EMAIL_SIZE,'NULL'),', ','SESSION_STATUS: ',COALESCE(${TABLE}.SESSION_STATUS,'NULL'),', ','DST_DOMAIN: ',COALESCE(${TABLE}.DST_DOMAIN,'NULL'),', ','WEB_CATEGORY: ',COALESCE(${TABLE}.WEB_CATEGORY,'NULL'),', ','SRC_IP: ',coalesce(${TABLE}.SRC_IP,'NULL')) ;;

  }


  set: detail {
    fields: [
      session_start_time_time,
      session_end_time_time,
      type,
      src_user_name,
      duration_mi,
      duration_hr
    ]
  }
}
