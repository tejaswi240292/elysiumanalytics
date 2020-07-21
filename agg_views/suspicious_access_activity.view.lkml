view: suspicious_access_activity {
  derived_table: {
    sql: SELECT 'Anomaly Login Count Activity' AS ActionType, sum(count) FROM agg_windows WHERE EventID IN ('4624', '528') and {% condition datefilter %} DATE {% endcondition %}
      GROUP BY 1 HAVING sum(count) > 5
      UNION ALL
      SELECT 'Anomaly Login Sources Activity' AS ActionType, sum(count) FROM agg_windows where {% condition datefilter %} DATE {% endcondition %}
      GROUP BY 1 HAVING sum(count) > 1
      UNION ALL
      SELECT 'Anomaly Failed Login Count Activity' AS ActionType, sum(count) FROM agg_windows where EventID IN ('529', '530', '531', '532', '533', '534', '535', '536', '537', '539', '4625')
      and {% condition datefilter %} DATE {% endcondition %} GROUP BY 1 HAVING sum(count) > 3
       ;;
  }

  filter: datefilter {
    type: date
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: actiontype {
    type: string
    sql: ${TABLE}."ACTIONTYPE" ;;
  }

  dimension: sumcount {
    type: number
    sql: ${TABLE}."SUM(COUNT)" ;;
  }
measure: Sum_of_sumcount {
  type: sum
  sql: ${sumcount} ;;
  drill_fields: [detail*]
}
  set: detail {
    fields: [actiontype, sumcount]
  }
}
