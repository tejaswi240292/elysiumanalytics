view: heatmaptest {
  derived_table: {
    sql: select * from
      (select
      coalesce(wgtraffic.event_time,msexchange.event_time,windowsnxlog.event_time) as event_time,
      coalesce(wgtraffic.type,msexchange.type,windowsnxlog.type) as type,
      coalesce(wgtraffic.entity:name :: string,msexchange.entity:name :: string,windowsnxlog.entity:name :: string) as name,
      coalesce(wgtraffic.feature_agg:if_dwnld_count,0) ::bigint if_dwnld_count,
      coalesce(windowsnxlog.feature_agg:logins_count,0) ::bigint logins_count,
      coalesce(msexchange.feature_agg:email_size,0) ::bigint email_size,
      coalesce(windowsnxlog.feature_agg:failedlogin_count,0) ::bigint failedlogin_count,
      coalesce(windowsnxlog.feature_agg:fileactivity_count,0) ::bigint fileactivity_count,
      coalesce(windowsnxlog.feature_agg:ps_count,0) ::bigint ps_count,coalesce(windowsnxlog.feature_agg:pri_count,0) ::bigint pri_count,
      coalesce(wgtraffic.feature_agg:dwnld_bytes,0) ::bigint dwnld_bytes,coalesce(wgtraffic.feature_agg:if_upld_count,0) ::bigint if_upld_count,
      coalesce(wgtraffic.feature_agg:upld_bytes,0) ::bigint upld_bytes
      from
      (select event_time,entity:name :: string as name from msexchange_agg
      union
      select event_time,entity:name :: string as name from windowsnxlog_agg
      union
      select event_time,entity:name :: string as name from wgtraffic_agg)mstr
      left join(select * from wgtraffic_agg) wgtraffic on mstr.name = wgtraffic.entity:name :: string and mstr.event_time = wgtraffic.event_time
      left join(select * from msexchange_agg) msexchange on mstr.name = msexchange.entity:name :: string and mstr.event_time = msexchange.event_time
      left join(select * from windowsnxlog_agg ) windowsnxlog on mstr.name = windowsnxlog.entity:name :: string
      and mstr.event_time = windowsnxlog.event_time) sst
       ;;

  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: event_time {
    type: time
    sql: ${TABLE}."EVENT_TIME" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: if_dwnld_count {
    type: number
    sql: ${TABLE}."IF_DWNLD_COUNT" ;;
  }

  dimension: logins_count {
    type: number
    sql: ${TABLE}."LOGINS_COUNT" ;;
  }

  dimension: email_size {
    type: number
    sql: ${TABLE}."EMAIL_SIZE" ;;
  }

  dimension: failedlogin_count {
    type: number
    sql: ${TABLE}."FAILEDLOGIN_COUNT" ;;
  }

  dimension: fileactivity_count {
    type: number
    sql: ${TABLE}."FILEACTIVITY_COUNT" ;;
  }

  dimension: ps_count {
    type: number
    sql: ${TABLE}."PS_COUNT" ;;
  }

  dimension: pri_count {
    type: number
    sql: ${TABLE}."PRI_COUNT" ;;
  }

  dimension: dwnld_bytes {
    type: number
    sql: ${TABLE}."DWNLD_BYTES" ;;
  }

  dimension: if_upld_count {
    type: number
    sql: ${TABLE}."IF_UPLD_COUNT" ;;
  }

  dimension: upld_bytes {
    type: number
    sql: ${TABLE}."UPLD_BYTES" ;;
  }

  set: detail {
    fields: [
      event_time_time,
      type,
      name,
      if_dwnld_count,
      logins_count,
      email_size,
      failedlogin_count,
      fileactivity_count,
      ps_count,
      pri_count,
      dwnld_bytes,
      if_upld_count,
      upld_bytes
    ]
  }
}
