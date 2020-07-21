view: beaconing12 {
  derived_table: {
    sql: select
      src_ip,
      dst_ip,
      dateadd(seconds, Sum(STV.VALUE::string) OVER( partition BY src_ip,dst_ip ORDER BY stv.index::int ROWS between  UNBOUNDED PRECEDING and current row ),first_event) as next_event_time,
      STV.VALUE::int AS duration from beaconing_ml_result,LATERAL FLATTEN(epoch_list) STV
      where pattern_len>=2  order by stv.index::int
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: src_ip {
    type: string
    sql: ${TABLE}."SRC_IP" ;;
  }

  dimension: dst_ip {
    type: string
    sql: ${TABLE}."DST_IP" ;;
  }

  dimension_group: next_event_time {
    type: time
    sql: ${TABLE}."NEXT_EVENT_TIME" ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}."DURATION" ;;
  }



  set: detail {
    fields: [src_ip, dst_ip, next_event_time_time, duration]
  }
}
