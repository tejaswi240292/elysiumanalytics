view: dataview_odm {
  derived_table: {
    sql: select * from (
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
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, commit_time) / 3600.0 as diff from SYM_ES_ENDPOINTPROTECTIONCLIENT_ODM where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,commit_time as time,0 as diff from SYM_ES_ENDPOINTPROTECTIONCLIENT_ODM where {% condition datefilter %} commit_time {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'SYM_ES_ENDPOINTPROTECTIONCLIENT' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
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
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, commit_time) / 3600.0 as diff from MS_WIN_SYSMON_ODM where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,commit_time as time,0 as diff from MS_WIN_SYSMON_ODM where {% condition datefilter %} commit_time {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (

      select
      'MS_WIN_SYSMON' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
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
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, commit_time) / 3600.0 as diff from WG_FW_EVENTSALARMS_ODM where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,commit_time as time,0 as diff from WG_FW_EVENTSALARMS_ODM where {% condition datefilter %} commit_time {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'WG_FW_EVENTSALARMS' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
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
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, commit_time) / 3600.0 as diff from WG_FW_NETWORKTRAFFIC_ODM where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,commit_time as time,0 as diff from WG_FW_NETWORKTRAFFIC_ODM where {% condition datefilter %} commit_time {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'WG_FW_NETWORKTRAFFIC' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
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
      select 'event' as type,EVENT_TIME as time,DATEDIFF(second, EVENT_TIME, commit_time) / 3600.0 as diff from SYM_ES_NETWORKPROTECTION_ODM where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,commit_time as time,0 as diff from SYM_ES_NETWORKPROTECTION_ODM where {% condition datefilter %} commit_time {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'SYM_ES_NETWORKPROTECTION' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
      from table (GENERATOR(ROWCOUNT => 168))
      )
      select d.date_time, IFNULL(e.ingested_count,0) AS ingested_count, IFNULL(e.commited_count,0) AS commited_count,IFNULL(e.min_time,0) AS min_time,IFNULL(e.max_time,0) AS max_time,IFNULL(e.avg_time,0) AS avg_time,d.source_type
      from date_gen d
      left join evt_tbl e
      on d.date_time = e.start_time
      order by d.date_time desc) --> ppp

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
      select 'event' as type,event_time  as time,DATEDIFF(second, event_time , commit_time) / 3600.0 as diff from MS_WIN_SECURITYAUDITING_ODM where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,commit_time as time,0 as diff from MS_WIN_SECURITYAUDITING_ODM where {% condition datefilter %} commit_time {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'MS_WIN_SECURITYAUDITING' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
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
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, commit_time) / 3600.0 as diff from MS_WIN_SECURITYAUDITING_NETTRAFFIC_ODM where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,commit_time as time,0 as diff from MS_WIN_SECURITYAUDITING_NETTRAFFIC_ODM where {% condition datefilter %} commit_time {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'MS_WIN_SECURITYAUDITING_NETTRAFFIC' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
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
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, commit_time) / 3600.0 as diff from MS_EXCH_MESSAGETRACKING_ODM where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,commit_time as time,0 as diff from MS_EXCH_MESSAGETRACKING_ODM where {% condition datefilter %} commit_time {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'MS_EXCH_MESSAGETRACKING' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
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
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, commit_time) / 3600.0 as diff from MS_EXCH_CONNECTIVITY_ODM where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,commit_time as time,0 as diff from MS_EXCH_CONNECTIVITY_ODM where {% condition datefilter %} commit_time {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'MS_EXCH_CONNECTIVITY' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
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
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, commit_time) / 3600.0 as diff from MS_EXCH_AGENT_ODM where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,commit_time as time,0 as diff from MS_EXCH_AGENT_ODM where {% condition datefilter %} commit_time {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'MS_EXCH_AGENT' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
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
      select 'event' as type,event_time as time,DATEDIFF(second, event_time, commit_time) / 3600.0 as diff from MS_IIS_ACCESS_ODM where {% condition datefilter %} event_time {% endcondition %}
      union all
      select 'processing' as type,commit_time as time,0 as diff from MS_IIS_ACCESS_ODM where {% condition datefilter %} commit_time {% endcondition %})
      group by start_time
      ),
      DATE_GEN AS
      (
      select
      'MS_IIS_ACCESS' as source_type,dateadd(hour,'-' ||row_number() over (order by null),dateadd(hour, '+1', DATE_TRUNC('HOUR',to_timestamp_ntz(current_timestamp())))) as date_time
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
