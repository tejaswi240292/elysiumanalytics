view: wgtrafficandsession {
  derived_table: {
    sql: select cast(min_event_time as date) as event_date, min_event_time as SESSION_START_TIME,max_event_time as SESSION_END_TIME,
        lower(src_username) as src_user_name, src_ip,dst_ip,dst_port,event_id,CAT_WEB_NAME,DST_DOMAIN,in_bytes,out_bytes,service,msg  from (WITH
          WG AS (
              SELECT src_ip,  dst_ip, dst_port, proto, src_user_name,raw:service as service,
              EVENT_ID, min(event_time) as min_event_time, max(event_time) AS max_event_time,CAT_WEB_NAME,DST_DOMAIN,msg,sum(in_bytes) as in_bytes,sum(out_bytes) as out_bytes, count(*) as wgcount
              FROM WG_FW_NETWORKTRAFFIC_ODM
              WHERE
             {% condition datefilter %} EVENT_TIME {% endcondition %} and
              //AND DISPOSITION <> '2'  //Disposition is not 'Denied'
             // AND
            (SRC_IP ilike '192.168.%' OR SRC_IP ilike '10.%')
              //AND SRC_IP = '192.168.110.235'
              GROUP BY src_ip, /*src_port,*/ dst_ip, dst_port,msg, proto, src_user_name, EVENT_ID,CAT_WEB_NAME,DST_DOMAIN,raw:service
              ORDER BY 1, 2, 3, 4, 5, 6, 7,8,9,10
          ),
          WIN AS (
             SELECT STV.VALUE::string AS src_ip, SRC_USERNAME, SRC_LOGONID, HOSTNAME, SESSION_START_TIME,
       SESSION_END_TIME, EVENT_DATE, timediff(minutes, SESSION_START_TIME,SESSION_END_TIME) as duration_MI, (duration_MI/60) as duration_Hr
              FROM NP_SESSION_TRACKING_INFO, LATERAL FLATTEN(ASSIGNED_IPS) STV
              WHERE {% condition datefilter %} EVENT_DATE {% endcondition %}
               //and coalesce(ELEVATED_TOKEN,'NULL') <> 'Yes'
              ORDER BY SRC_IP, SESSION_START_TIME, SESSION_END_TIME
          )
      SELECT WG.src_ip,WG.msg,WG.CAT_WEB_NAME, WG.DST_DOMAIN,WG.dst_ip,WG.service, WG.dst_port, WG.proto, WG.src_user_name, WG.EVENT_ID, WG.min_event_time, WG.max_event_time, WG.wgcount, WIN.src_ip as ip, WIN.SRC_USERNAME, WIN.SRC_LOGONID, WIN.HOSTNAME, WIN.SESSION_START_TIME, WIN.SESSION_END_TIME, WIN.EVENT_DATE, WIN.DURATION_HR,WG.in_bytes,WG.out_bytes
      FROM WG LEFT OUTER JOIN WIN
      //FROM WG JOIN WIN
      ON (WG.SRC_IP = WIN.SRC_IP) AND (WG.min_event_time >= WIN.SESSION_START_TIME) AND (WG.max_event_time <= WIN.SESSION_END_TIME)
      //ORDER BY 1,3,2,4,5,6,7,8,9,10,11,12,13,14,15;
      ORDER BY 1,2,3,4,6,7,8,5,9,10,11,12,13,14,15 )sst where src_username!=''
       ;;
  }

  filter: datefilter {
    type: date
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: event_date {
    type: date
    sql: ${TABLE}."EVENT_DATE" ;;
  }

  dimension_group: session_start_time {
    type: time
    sql: ${TABLE}."SESSION_START_TIME" ;;
  }

  dimension_group: session_end_time {
    type: time
    sql: ${TABLE}."SESSION_END_TIME" ;;
  }

  dimension: src_user_name {
    type: string
    sql: ${TABLE}."SRC_USER_NAME" ;;
  }

  dimension: service {
    type: string
    sql: ${TABLE}."SERVICE" ;;
  }

  dimension: src_ip {
    type: string
    sql: ${TABLE}."SRC_IP" ;;
  }

  dimension: dst_ip {
    type: string
    sql: ${TABLE}."DST_IP" ;;
  }

  dimension: msg {
    type: string
    sql: ${TABLE}."MSG" ;;
  }

  dimension: dst_port {
    type: number
    sql: ${TABLE}."DST_PORT" ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}."EVENT_ID" ;;
  }

  dimension: cat_web_name {
    type: string
    sql: ${TABLE}."CAT_WEB_NAME" ;;
  }

  dimension: dst_domain {
    type: string
    sql: ${TABLE}."DST_DOMAIN" ;;
  }

  dimension: in_bytes {
    type: number
    sql: ${TABLE}."IN_BYTES" ;;
  }

  dimension: out_bytes {
    type: number
    sql: ${TABLE}."OUT_BYTES" ;;
  }

  set: detail {
    fields: [
      event_date,
      session_start_time_time,
      session_end_time_time,
      src_user_name,
      src_ip,
      dst_ip,
      dst_port,
      event_id,
      cat_web_name,
      dst_domain,
      in_bytes,
      out_bytes
    ]
  }
}
