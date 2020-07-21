view: domaintest180 {
  derived_table: {
    sql: select event_time1::Date as event_date,userid,dst_name,count(*) as count from view360ip
      where {% condition datefilter %} event_time1 {% endcondition %}
      group by event_time1::Date ,userid ,dst_name
       ;;

      }

filter: datefilter {
  type: date
}

  dimension: event_date {
    type: date
    sql: ${TABLE}."EVENT_DATE" ;;
  }

  dimension: userid {
    type: string
    sql: ${TABLE}."USERID" ;;
  }

  dimension: dst_name {
    type: string
    sql: ${TABLE}."DST_NAME" ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}."COUNT" ;;
  }

  set: detail {
    fields: [event_date, userid, dst_name, count]
  }
}
