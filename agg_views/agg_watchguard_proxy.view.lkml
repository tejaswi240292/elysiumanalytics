view: agg_watchguard_proxy {
    sql_table_name:  AGG_WATCHGUARD_PROXY
      ;;


  dimension_group: date {
    type: time
    sql: ${TABLE}."DATE" ;;
  }

  dimension: hour {
    type: number
    sql: ${TABLE}."HOUR" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: entity1 {
    type: string
    drill_fields: [detail*]
    sql: ${TABLE}."ENTITY1" ;;
  }

  dimension: entity2 {
    type: string
    sql: ${TABLE}."ENTITY2" ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}."COUNT" ;;
  }
measure: Sum_of_Count {
  type: sum
  sql: ${count} ;;
  drill_fields: [detail*]
}
measure: Count_of_Count {
  type: count_distinct
  sql: ${count} ;;
  drill_fields: [detail*]
}
  dimension: y {
    type: number
    sql: ${TABLE}."Y" ;;
  }

  dimension: m {
    type: number
    sql: ${TABLE}."M" ;;
  }

  dimension: d {
    type: number
    sql: ${TABLE}."D" ;;
  }

  set: detail {
    fields: [
      date_time,
      hour,
      source,
      type,
      entity1,
      entity2,
      count,
      y,
      m,
      d
    ]
  }
}
