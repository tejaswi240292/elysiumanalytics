view: statistical_data_view {
  derived_table: {
    sql: select
      name,
    EVENT_DATE,
      min(t.first_seen) as first_seen,
      max(t.last_seen) as last_seen,
      max(t.last_seen_privelege_total) as last_seen_privelege_total,
      sum(t.total_bytes_uploaded) as total_bytes_uploaded,
      sum(t.total_distinct_domains) as total_distinct_domains,
      sum(t.total_bytes_downloaded) as total_bytes_downloaded,
      sum(t.succesfull_logins) as succesfull_logins,
      sum(t.failed_logins) as failed_logins,
      sum(t.no_of_files_accessed) as no_of_files_accessed,
      sum(t.no_of_emails) as no_of_emails,
      sum(t.total_email_size) as total_email_size,
      sum(t.total_rdp_server_count) as total_rdp_server_count,
      sum(t.no_of_sessions) as no_of_sessions,
      avg(t.total_bytes_uploaded) as mean_data_uploaded_eachday,
      avg(t.total_bytes_downloaded) as mean_data_downloaded_eachday,
      coalesce(sum(case when t.event_date > dateadd('day',-3,current_date) then t.total_bytes_uploaded end) ,0) as data_uploaded_in_last_3days,
    coalesce(sum(t.event_count),0) as activity_count,
    a.DISPLAYNAME,
    a.DESCRIPTION,
    a.EMAILADDRESS,
    a.city,
    a.country
from
(select lower(split(entity:name,'@')[0] :: string) as name,
     event_time :: date as event_date,
       min(event_time) as first_seen,
       max(event_time) as last_seen,
       null as last_seen_privelege_total,
     sum(coalesce(feature_agg:upld_bytes,0)) as  total_bytes_uploaded,
     sum(coalesce(feature_agg:distinct_domain_count,0)) as total_distinct_domains,
     sum(coalesce(feature_agg:dwnld_bytes,0)) as total_bytes_downloaded,
     0 as succesfull_logins,
     0 as failed_logins,
     0 as no_of_files_accessed,
     0 as no_of_emails,
     0 as total_email_size,
     0 as total_rdp_server_count,
     0 as no_of_sessions,
       sum(coalesce(feature_agg:total_events,0)) as event_count
     from wgtraffic_agg where type='user' group by 1,2
union all
select lower(split(entity:name,'@')[0] :: string) as name,
     event_time :: date as event_date,
       min(event_time) as first_seen,
       max(event_time) as last_seen,
       max(case when coalesce(feature_agg:privelege_total,0) > 0 then event_time end ) as last_seen_privelege_total,
     0 as total_bytes_uploaded,
     0 as total_distinct_domains,
     0 as total_bytes_downloaded,
     sum(coalesce(feature_agg:logins_count,0)) as  succesfull_logins,
     sum(coalesce(feature_agg:failedlogin_count,0)) as failed_logins,
     sum(coalesce(feature_agg:fileactivity_count,0)) as no_of_files_accessed,
     0 as no_of_emails,
     0 as total_email_size,
     0 as total_rdp_server_count,
     0 as no_of_sessions,
       sum(coalesce(feature_agg:total_events,0)) as event_count
     from windowsnxlog_agg where type='user' group by 1,2
union all
select lower(split(entity:name,'@')[0] :: string) as name,
     event_time :: date as event_date,
       min(event_time) as first_seen,
       max(event_time) as last_seen,
       null as last_seen_privelege_total,
     0 as total_bytes_uploaded,
     0 as total_distinct_domains,
     0 as total_bytes_downloaded,
     0 as succesfull_logins,
     0 as failed_logins,
     0 as no_of_files_accessed,
     sum(coalesce(feature_agg:email_count,0)) as  no_of_emails,
     sum(coalesce(feature_agg:email_size,0)) as total_email_size,
     0 as total_rdp_server_count,
     0 as no_of_sessions,
       sum(coalesce(feature_agg:total_events,0)) as event_count
     from msexchange_agg where   type='user' group by 1,2
union all
select lower(split(entity:name,'@')[0] :: string) as name,
     event_time :: date as event_date,
        min(event_time) as first_seen,
        max(event_time) as last_seen,
        null as last_seen_privelege_total,
    0 as total_bytes_uploaded,
    0 as total_distinct_domains,
    0 as total_bytes_downloaded,
    0 as succesfull_logins,
    0 as failed_logins,
    0 as no_of_files_accessed,
    0 as no_of_emails,
    0 as total_email_size,
    sum(coalesce(feature_agg:rdp_server_count,0)) as total_rdp_server_count,
    0 as no_of_sessions,
        sum(coalesce(feature_agg:total_events,0)) as event_count
    from sysmon_agg where type='user' group by 1,2
union all
select lower(split(entity:name,'@')[0] :: string) as name,
     event_time :: date as event_date,
        min(event_time) as first_seen,
        max(event_time) as last_seen,
        null as last_seen_privelege_total,
    0 as total_bytes_uploaded,
    0 as total_distinct_domains,
    0 as total_bytes_downloaded,
    0 as succesfull_logins,
    0 as failed_logins,
    0 as no_of_files_accessed,
    0 as no_of_emails,
    0 as total_email_size,
    0 as total_rdp_server_count,
    sum(coalesce(feature_agg:no_of_sessions,0)) as no_of_sessions,
        0 as event_count
    from wgevent_agg where type='user' group by 1,2)t

    left join

    (select * from (select lower(SAMACCOUNTNAME) as namea,
    DISPLAYNAME,
    DESCRIPTION,
    EMAILADDRESS,
    city,
    country,
    ROW_NUMBER() over ( partition by SAMACCOUNTNAME order by WHENCHANGED desc) as row_n
          from ACTIVEDIRECTORY_USERS where   DESCRIPTION!='') where row_n=1) a

    on a.namea=t.name where not name ilike any ('%xerox%' ,'MicrosoftExchange%','umfd%','dwm%','%sql%') and not contains(name,'+')  and name not in (select name from ENTITY_BLACKLIST_LOOKUP)
    group by t.name,t.event_date,a.DISPLAYNAME,a.DESCRIPTION,a.EMAILADDRESS,a.city, a.country
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: event_date {
    type: date
    sql: ${TABLE}."EVENT_DATE" ;;
  }

  dimension_group: first_seen {
    type: time
    sql: ${TABLE}."FIRST_SEEN" ;;
  }

  dimension_group: last_seen {
    type: time
    sql: ${TABLE}."LAST_SEEN" ;;
  }

  dimension_group: last_seen_privelege_total {
    type: time
    sql: ${TABLE}."LAST_SEEN_PRIVELEGE_TOTAL" ;;
  }

  dimension: total_bytes_uploaded {
    type: number
    sql: ${TABLE}."TOTAL_BYTES_UPLOADED" ;;
  }

  dimension: total_distinct_domains {
    type: number
    sql: ${TABLE}."TOTAL_DISTINCT_DOMAINS" ;;
  }

  dimension: total_bytes_downloaded {
    type: number
    sql: ${TABLE}."TOTAL_BYTES_DOWNLOADED" ;;
  }
dimension: bandwidth1 {
  type: number
  sql:${TABLE}.total_bytes_downloaded+${TABLE}.total_bytes_uploaded;;
}
measure: sum_of_bandwidth {
  type: sum
  sql: ${bandwidth1} ;;
  drill_fields: [detail*]
}
  dimension: succesfull_logins {
    type: number
    sql: ${TABLE}."SUCCESFULL_LOGINS" ;;
  }

  dimension: failed_logins {
    type: number
    sql: ${TABLE}."FAILED_LOGINS" ;;
  }

  dimension: no_of_files_accessed {
    type: number
    sql: ${TABLE}."NO_OF_FILES_ACCESSED" ;;
  }

  dimension: no_of_emails {
    type: number
    sql: ${TABLE}."NO_OF_EMAILS" ;;
  }

  dimension: total_email_size {
    type: number
    sql: ${TABLE}."TOTAL_EMAIL_SIZE" ;;
  }

  dimension: total_rdp_server_count {
    type: number
    sql: ${TABLE}."TOTAL_RDP_SERVER_COUNT" ;;
  }

  dimension: no_of_sessions {
    type: number
    sql: ${TABLE}."NO_OF_SESSIONS" ;;
  }

  dimension: mean_data_uploaded_eachday {
    type: number
    sql: ${TABLE}."MEAN_DATA_UPLOADED_EACHDAY" ;;
  }

  dimension: mean_data_downloaded_eachday {
    type: number
    sql: ${TABLE}."MEAN_DATA_DOWNLOADED_EACHDAY" ;;
  }

  dimension: data_uploaded_in_last_3_days {
    type: number
    sql: ${TABLE}."DATA_UPLOADED_IN_LAST_3DAYS" ;;
  }

  dimension: activity_count {
    type: number
    sql: ${TABLE}."ACTIVITY_COUNT" ;;
      }
measure: Sum_Of_Activity_Count{
  type: sum
  sql: ${activity_count} ;;
  drill_fields: [detail*]

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

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}."COUNTRY" ;;
  }

  set: detail {
    fields: [
      name,
      event_date,
      first_seen_time,
      last_seen_time,
      last_seen_privelege_total_time,
      total_bytes_uploaded,
      total_distinct_domains,
      total_bytes_downloaded,
      succesfull_logins,
      failed_logins,
      no_of_files_accessed,
      no_of_emails,
      total_email_size,
      total_rdp_server_count,
      no_of_sessions,
      mean_data_uploaded_eachday,
      mean_data_downloaded_eachday,
      data_uploaded_in_last_3_days,
      activity_count,
      displayname,
      description,
      emailaddress,
      city,
      country
    ]
  }
}
