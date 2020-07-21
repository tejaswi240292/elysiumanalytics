view: symantecendpoint_union_ad_host {
  derived_table: {
    sql: select host,event_time,src_name,event_type,status,
case when status = 'Up-to-date' then 'Up-to-date: Malware signatures updated within the last 24 hours'
     when status = 'Out-of-date' then 'Out-of-date : Malware signatures not updated within  last 48 hours'
     when status = 'Offline' then 'Offline: Malware signatures not updated within  last 7 Days'
     when status = 'Disabled' then 'Disabled: No scanner events received in the Source'
     when status = 'Not-installed' then 'Not-installed: No scanner events received in the Whole system'
     else 'Disabled: No scanner events received in the Source' end as statusd from
     (select  host,event_time,src_name,event_type,
      case when event_time>dateadd(day,-1,to_timestamp_ntz(current_timestamp())) then 'Up-to-date'
           when event_time<=dateadd(day,-1,to_timestamp_ntz(current_timestamp())) and event_time>dateadd(day,-2,to_timestamp_ntz(current_timestamp())) then  'Out-of-date'
           when event_time<=dateadd(day,-2,to_timestamp_ntz(current_timestamp())) and event_time>dateadd(day,-7,to_timestamp_ntz(current_timestamp())) then  'Offline'
           else  'Disabled' END as status from (select  host,max(event_time) as event_time ,src_name,event_type from SYMANTECENDPOINT_ODM where event_id =2
           group by host,src_name,event_type)sst)
           union all
 select distinct DNSHOSTNAME as hostname,'1970-01-01 00:00:01.000' as event_time ,'null' as source_name,'null' as event_type,
 'Not-installed','Not-installed: No scanner events received in the Whole system'
 from ACTIVEDIRECTORY_Hosts
 s where lower(DNSHOSTNAME) like '%sstechlaptop%' and DNSHOSTNAME not in  (select host from (SELECT distinct host from SYMANTECENDPOINT_ODM where event_id =2 )st)
;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: host {
    type: string
    sql: ${TABLE}."HOST" ;;
  }

  dimension_group: event_time {
    type: time
    sql: ${TABLE}."EVENT_TIME" ;;
  }

  dimension: src_name {
    type: string
    sql: ${TABLE}."SRC_NAME" ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}."EVENT_TYPE" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: statusd {
    type: string
    sql: ${TABLE}."STATUSD" ;;
  }

  set: detail {
    fields: [
      host,
      event_time_time,
      src_name,
      event_type,
      status,
      statusd
    ]
  }
}
