view: bbtest {
  derived_table: {
    sql: select
      src_ip,
      dst_ip,
      dateadd(seconds, Sum(replace(replace(STV.VALUE::string,'"',''),'s','')) OVER( partition BY src_ip,dst_ip ORDER BY stv.index::int ROWS between  UNBOUNDED PRECEDING and current row ),first_event) as next_event_time,
      replace(replace(STV.VALUE,'"',''),'s','')::int as value,
      case when rlike(STV.VALUE::string,'s[0-9]+') = True then 'pattern' else 'notpattern' end as PATTERN,
      case when rlike(STV.VALUE::string,'s[0-9]+') = True then replace(replace(STV.VALUE,'"',''),'s','')::int else 0 end as pattern_1,
      case when rlike(STV.VALUE::string,'s[0-9]+') = False then replace(replace(STV.VALUE,'"',''),'s','')::int else 0 end as non_pattern

      from (
select FIRST_EVENT,SRC_IP,DST_IP,EPOCH_LIST,EPOCH_LIST_LEN,PATTERN,PATTERN_LEN,strtok_to_array(regexp_replace(epoch,apattern,fpattern),',') as test from (
select *,replace(replace(epoch_list::string,'[',''),']','') as epoch,replace(replace(PATTERN::string,'[','('),']',')') as apattern,replace(replace(replace(PATTERN::string,'[','s'),']',''),',',',s') as fpattern from BEACONING_ML_RESULT where pattern_len>2
and  {% condition srcip %} src_ip {% endcondition %}
and {% condition dstip %} dst_ip {% endcondition %} and
 {% condition datefilter %} first_event::date {% endcondition %}
)) sst,LATERAL FLATTEN(test) STV
 ;;
  }

  filter: srcip {
    type: string
  }

  filter: dstip {
    type: string
  }

  filter: datefilter {
    type: date
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

  dimension: value {
    type: number
    sql: ${TABLE}."VALUE" ;;
  }

  dimension: pattern {
    type: string
    sql: ${TABLE}."PATTERN" ;;
  }

  dimension: pattern_1 {
    type: number
    sql: ${TABLE}."PATTERN_1" ;;
  }

  dimension: non_pattern {
    type: number
    sql: ${TABLE}."NON_PATTERN" ;;
  }

  set: detail {
    fields: [
      src_ip,
      dst_ip,
      next_event_time_time,
      value,
      pattern
    ]
  }
}
