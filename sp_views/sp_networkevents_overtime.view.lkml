view: sp_networkevents_overtime {
  derived_table: {
    sql: select eventdate, type, type_count from (
      select eventdate, type, count(type) type_count from (
      select distinct name,cast(EVENT_DATE as date) as eventdate,'exchange' as type from msexchange_ml_score_batch
      union all
      select distinct id,cast(event_date as date) as eventdate,'outliers' as type from ueba_outliers_ueba
      union all
      select distinct name,cast(EVENT_DATE as date) as eventdate,'access' as type from windowsnxlog_ml_score_batch
      union all
      select distinct name,cast(EVENT_DATE as date) as eventdate,'network' as type from wgtraffic_ml_score_batch) as data
      group by eventdate, type) grouped
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: eventdate {
    type: date
    sql: ${TABLE}."EVENTDATE" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: type_count {
    type: number
    sql: ${TABLE}."TYPE_COUNT" ;;
  }
  measure: sum_of_type_count {
    type: sum
    sql: ${type_count} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [eventdate, type, type_count]
  }
}
