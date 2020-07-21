view: dataview {
  derived_table: {
    sql: select * from (
      WITH
      EVT_TBL AS
      (
      select
        time_slice(time,1,'HOUR','START') AS start_time,
        IFNULL(sum(case when type = 'event' then 1 else 0 end),0) as ingested_count,
        IFNULL(sum(case when type = 'processing' then 1 else 0 end),0) as commited_count,
        IFNULL(avg(diff),0) as avg_time,IFNULL(min(diff),0) as min_time,IFNULL(max(diff),0) as max_time
        from
      (
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, processing_dttm) / 3600.0 as diff from azfn_windowsnxlog_batch where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,processing_dttm as time,0 as diff from azfn_windowsnxlog_batch where {% condition datefilter %} processing_dttm {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (

      select 'windowsnxlog' as source_type,
      dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
      from table (GENERATOR(ROWCOUNT => 168))
      )
      select d.date_time, COALESCE(e.ingested_count,0) AS ingested_count, COALESCE(e.commited_count,0) AS commited_count,COALESCE(e.min_time,0) AS min_time,COALESCE(e.max_time,0) AS max_time,COALESCE(e.avg_time,0) AS avg_time,d.source_type
      from date_gen d
      left join evt_tbl e
      on d.date_time = e.start_time
      order by d.date_time desc)

      union all
      select * from (
      WITH
      EVT_TBL AS
      (
      select
        time_slice(time,1,'HOUR','START') AS start_time,
        sum(case when type = 'event' then 1 else 0 end) as ingested_count,
        sum(case when type = 'processing' then 1 else 0 end) as commited_count,
        avg(diff) as avg_time,min(diff) as min_time,max(diff) as max_time
        from
      (
      select 'event' as type,TIMEOFEXTRACTION as time,DATEDIFF(second, TIMEOFEXTRACTION, processing_dttm) / 3600.0 as diff from ACTIVEDIRECTORY_HOSTS where {% condition datefilter %} TIMEOFEXTRACTION {% endcondition %}
      union all
      select 'processing' as type,processing_dttm as time,0 as diff from ACTIVEDIRECTORY_HOSTS where {% condition datefilter %} processing_dttm {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'activedirectory_hosts' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
      from table (GENERATOR(ROWCOUNT => 168))
      )
      select d.date_time, IFNULL(e.ingested_count,0) AS ingested_count, IFNULL(e.commited_count,0) AS commited_count,IFNULL(e.min_time,0) AS min_time,IFNULL(e.max_time,0) AS max_time,IFNULL(e.avg_time,0) AS avg_time,d.source_type
      from date_gen d
      left join evt_tbl e
      on d.date_time = e.start_time
      order by d.date_time desc)

      union all
      select * from (
      WITH
      EVT_TBL AS
      (
      select
        time_slice(time,1,'HOUR','START') AS start_time,
        sum(case when type = 'event' then 1 else 0 end) as ingested_count,
        sum(case when type = 'processing' then 1 else 0 end) as commited_count,
        avg(diff) as avg_time,min(diff) as min_time,max(diff) as max_time
        from
      (
      select 'event' as type,TIMEOFEXTRACTION  as time,DATEDIFF(second, TIMEOFEXTRACTION , processing_dttm) / 3600.0 as diff from ACTIVEDIRECTORY_USERS where {% condition datefilter %} TIMEOFEXTRACTION {% endcondition %}
      union all
      select 'processing' as type,processing_dttm as time,0 as diff from ACTIVEDIRECTORY_USERS where {% condition datefilter %} processing_dttm {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'activedirectory_users' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
      from table (GENERATOR(ROWCOUNT => 168))
      )
      select d.date_time, IFNULL(e.ingested_count,0) AS ingested_count, IFNULL(e.commited_count,0) AS commited_count,IFNULL(e.min_time,0) AS min_time,IFNULL(e.max_time,0) AS max_time,IFNULL(e.avg_time,0) AS avg_time,d.source_type
      from date_gen d
      left join evt_tbl e
      on d.date_time = e.start_time
      order by d.date_time desc)

      union all
      select * from (
      WITH
      EVT_TBL AS
      (
      select
        time_slice(time,1,'HOUR','START') AS start_time,
        sum(case when type = 'event' then 1 else 0 end) as ingested_count,
        sum(case when type = 'processing' then 1 else 0 end) as commited_count,
        avg(diff) as avg_time,min(diff) as min_time,max(diff) as max_time
        from
      (
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, processing_dttm) / 3600.0 as diff from iis_batch where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,processing_dttm as time,0 as diff from iis_batch where {% condition datefilter %} processing_dttm {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'iis' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
      from table (GENERATOR(ROWCOUNT => 168))
      )
      select d.date_time, IFNULL(e.ingested_count,0) AS ingested_count, IFNULL(e.commited_count,0) AS commited_count,IFNULL(e.min_time,0) AS min_time,IFNULL(e.max_time,0) AS max_time,IFNULL(e.avg_time,0) AS avg_time,d.source_type
      from date_gen d
      left join evt_tbl e
      on d.date_time = e.start_time
      order by d.date_time desc)

      union all
      select * from (
      WITH
      EVT_TBL AS
      (
      select
        time_slice(time,1,'HOUR','START') AS start_time,
        sum(case when type = 'event' then 1 else 0 end) as ingested_count,
        sum(case when type = 'processing' then 1 else 0 end) as commited_count,
        avg(diff) as avg_time,min(diff) as min_time,max(diff) as max_time
        from
      (
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, processing_dttm) / 3600.0 as diff from MSEXCHANGE_CONNECTIVITY_BATCH where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,processing_dttm as time,0 as diff from MSEXCHANGE_CONNECTIVITY_BATCH where {% condition datefilter %} processing_dttm {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'msexchange_connectivity' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
      from table (GENERATOR(ROWCOUNT => 168))
      )
      select d.date_time, IFNULL(e.ingested_count,0) AS ingested_count, IFNULL(e.commited_count,0) AS commited_count,IFNULL(e.min_time,0) AS min_time,IFNULL(e.max_time,0) AS max_time,IFNULL(e.avg_time,0) AS avg_time,d.source_type
      from date_gen d
      left join evt_tbl e
      on d.date_time = e.start_time
      order by d.date_time desc)

      union all

      select * from (
      WITH
      EVT_TBL AS
      (
      select
        time_slice(time,1,'HOUR','START') AS start_time,
        sum(case when type = 'event' then 1 else 0 end) as ingested_count,
        sum(case when type = 'processing' then 1 else 0 end) as commited_count,
        avg(diff) as avg_time,min(diff) as min_time,max(diff) as max_time
        from
      (
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, processing_dttm) / 3600.0 as diff from msexchange_batch where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,processing_dttm as time,0 as diff from msexchange_batch where {% condition datefilter %} processing_dttm {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'msexchange' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
      from table (GENERATOR(ROWCOUNT => 168))
      )
      select d.date_time, IFNULL(e.ingested_count,0) AS ingested_count, IFNULL(e.commited_count,0) AS commited_count,IFNULL(e.min_time,0) AS min_time,IFNULL(e.max_time,0) AS max_time,IFNULL(e.avg_time,0) AS avg_time,d.source_type
      from date_gen d
      left join evt_tbl e
      on d.date_time = e.start_time
      order by d.date_time desc)

      union all

      select * from (
      WITH
      EVT_TBL AS
      (
      select
        time_slice(time,1,'HOUR','START') AS start_time,
        sum(case when type = 'event' then 1 else 0 end) as ingested_count,
        sum(case when type = 'processing' then 1 else 0 end) as commited_count,
        avg(diff) as avg_time,min(diff) as min_time,max(diff) as max_time
        from
      (
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, commit_time) / 3600.0 as diff from symantecendpoint_odm where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,commit_time as time,0 as diff from symantecendpoint_odm where {% condition datefilter %} commit_time {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'symantecendpoint' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
      from table (GENERATOR(ROWCOUNT => 168))
      )
      select d.date_time, IFNULL(e.ingested_count,0) AS ingested_count, IFNULL(e.commited_count,0) AS commited_count,IFNULL(e.min_time,0) AS min_time,IFNULL(e.max_time,0) AS max_time,IFNULL(e.avg_time,0) AS avg_time,d.source_type
      from date_gen d
      left join evt_tbl e
      on d.date_time = e.start_time
      order by d.date_time desc)


      union all
      select * from (
      WITH
      EVT_TBL AS
      (
      select
        time_slice(time,1,'HOUR','START') AS start_time,
        sum(case when type = 'event' then 1 else 0 end) as ingested_count,
        sum(case when type = 'processing' then 1 else 0 end) as commited_count,
        avg(diff) as avg_time,min(diff) as min_time,max(diff) as max_time
        from
      (
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, processing_dttm) / 3600.0 as diff from sysmon_batch where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,processing_dttm as time,0 as diff from sysmon_batch where {% condition datefilter %} processing_dttm {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (

      select
      'sysmon' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
      from table (GENERATOR(ROWCOUNT => 168))
      )
      select d.date_time, IFNULL(e.ingested_count,0) AS ingested_count, IFNULL(e.commited_count,0) AS commited_count,IFNULL(e.min_time,0) AS min_time,IFNULL(e.max_time,0) AS max_time,IFNULL(e.avg_time,0) AS avg_time,d.source_type
      from date_gen d
      left join evt_tbl e
      on d.date_time = e.start_time
      order by d.date_time desc)

      union all

      select * from (
      WITH
      EVT_TBL AS
      (
      select
        time_slice(time,1,'HOUR','START') AS start_time,
        sum(case when type = 'event' then 1 else 0 end) as ingested_count,
        sum(case when type = 'processing' then 1 else 0 end) as commited_count,
        avg(diff) as avg_time,min(diff) as min_time,max(diff) as max_time
        from
      (
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, processing_dttm) / 3600.0 as diff from WGEVENT_BATCH where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,processing_dttm as time,0 as diff from WGEVENT_BATCH where {% condition datefilter %} processing_dttm {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'wgevent' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
      from table (GENERATOR(ROWCOUNT => 168))
      )
      select d.date_time, IFNULL(e.ingested_count,0) AS ingested_count, IFNULL(e.commited_count,0) AS commited_count,IFNULL(e.min_time,0) AS min_time,IFNULL(e.max_time,0) AS max_time,IFNULL(e.avg_time,0) AS avg_time,d.source_type
      from date_gen d
      left join evt_tbl e
      on d.date_time = e.start_time
      order by d.date_time desc)

      union all

      select * from (
      WITH
      EVT_TBL AS
      (
      select
        time_slice(time,1,'HOUR','START') AS start_time,
        sum(case when type = 'event' then 1 else 0 end) as ingested_count,
        sum(case when type = 'processing' then 1 else 0 end) as commited_count,
        avg(diff) as avg_time,min(diff) as min_time,max(diff) as max_time
        from
      (
      select 'event' as type,FIRST_SWITCHED as time,DATEDIFF(second, FIRST_SWITCHED, processing_dttm) / 3600.0 as diff from WGNETFLOW_BATCH where {% condition datefilter %} FIRST_SWITCHED {% endcondition %}
      union all
      select 'processing' as type,processing_dttm as time,0 as diff from WGNETFLOW_BATCH where {% condition datefilter %} processing_dttm {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'wgnetflow' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
      from table (GENERATOR(ROWCOUNT => 168))
      )
      select d.date_time, IFNULL(e.ingested_count,0) AS ingested_count, IFNULL(e.commited_count,0) AS commited_count,IFNULL(e.min_time,0) AS min_time,IFNULL(e.max_time,0) AS max_time,IFNULL(e.avg_time,0) AS avg_time,d.source_type
      from date_gen d
      left join evt_tbl e
      on d.date_time = e.start_time
      order by d.date_time desc)

      union  all

      select * from (
      WITH
      EVT_TBL AS
      (
      select
        time_slice(time,1,'HOUR','START') AS start_time,
        sum(case when type = 'event' then 1 else 0 end) as ingested_count,
        sum(case when type = 'processing' then 1 else 0 end) as commited_count,
        avg(diff) as avg_time,min(diff) as min_time,max(diff) as max_time
        from
      (
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, processing_dttm) / 3600.0 as diff from wgtraffic_batch where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,processing_dttm as time,0 as diff from wgtraffic_batch where {% condition datefilter %} processing_dttm {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'wgtraffic' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
      from table (GENERATOR(ROWCOUNT => 168))
      )
      select d.date_time, IFNULL(e.ingested_count,0) AS ingested_count, IFNULL(e.commited_count,0) AS commited_count,IFNULL(e.min_time,0) AS min_time,IFNULL(e.max_time,0) AS max_time,IFNULL(e.avg_time,0) AS avg_time,d.source_type
      from date_gen d
      left join evt_tbl e
      on d.date_time = e.start_time
      order by d.date_time desc)


      union all

      select * from (
      WITH
      EVT_TBL AS
      (
      select
        time_slice(time,1,'HOUR','START') AS start_time,
        sum(case when type = 'event' then 1 else 0 end) as ingested_count,
        sum(case when type = 'processing' then 1 else 0 end) as commited_count,
        avg(diff) as avg_time,min(diff) as min_time,max(diff) as max_time
        from
      (
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, commit_time) / 3600.0 as diff from MSEXCHANGEAGENT_odm where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,commit_time as time,0 as diff from MSEXCHANGEAGENT_odm where {% condition datefilter %} commit_time {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'msexchangeagent' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
      from table (GENERATOR(ROWCOUNT => 168))
      )
      select d.date_time, IFNULL(e.ingested_count,0) AS ingested_count, IFNULL(e.commited_count,0) AS commited_count,IFNULL(e.min_time,0) AS min_time,IFNULL(e.max_time,0) AS max_time,IFNULL(e.avg_time,0) AS avg_time,d.source_type
      from date_gen d
      left join evt_tbl e
      on d.date_time = e.start_time
      order by d.date_time desc)

      union all

      select * from (
      WITH
      EVT_TBL AS
      (
      select
        time_slice(time,1,'HOUR','START') AS start_time,
        sum(case when type = 'event' then 1 else 0 end) as ingested_count,
        sum(case when type = 'processing' then 1 else 0 end) as commited_count,
        avg(diff) as avg_time,min(diff) as min_time,max(diff) as max_time
        from
      (
      select 'event' as type,EVENT_TIME as time,DATEDIFF(second, EVENT_TIME, commit_time) / 3600.0 as diff from SYMANTECNETWORK_odm where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,commit_time as time,0 as diff from SYMANTECNETWORK_odm where {% condition datefilter %} commit_time {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'symantecnetwork' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
      from table (GENERATOR(ROWCOUNT => 168))
      )
      select d.date_time, IFNULL(e.ingested_count,0) AS ingested_count, IFNULL(e.commited_count,0) AS commited_count,IFNULL(e.min_time,0) AS min_time,IFNULL(e.max_time,0) AS max_time,IFNULL(e.avg_time,0) AS avg_time,d.source_type
      from date_gen d
      left join evt_tbl e
      on d.date_time = e.start_time
      order by d.date_time desc)
       ;;
  }
  filter: datefilter {
    type: date
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: date_time {
    type: time
    sql: ${TABLE}."DATE_TIME" ;;
  }

  dimension: ingested_count {
    type: number
    sql: ${TABLE}."INGESTED_COUNT" ;;
  }
  measure: Sum_of_ingested_count {
    type: sum
    sql: ${ingested_count} ;;
    drill_fields: [detail*]

  }
  dimension: commited_count {
    type: number
    sql: ${TABLE}."COMMITED_COUNT" ;;
  }

  dimension: min_time {
    type: number
    sql: ${TABLE}."MIN_TIME" ;;
  }

  dimension: max_time {
    type: number
    sql: ${TABLE}."MAX_TIME" ;;
  }

  dimension: source_type {
    type: string
    sql: ${TABLE}."SOURCE_TYPE" ;;
  }

  dimension: avg_time {
    type: number
    sql: ${TABLE}."AVG_TIME" ;;
  }

  set: detail {
    fields: [
      date_time_time,
      ingested_count,
      commited_count,
      min_time,
      max_time,
      avg_time,
      source_type
    ]
  }
}
