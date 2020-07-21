view: windows_account_and_group_information {
  derived_table: {
    sql: SELECT '' AS ActionType, eventid, count, type FROM agg_windows
      WHERE entity2 NOT IN (
      SELECT entity2 FROM agg_windows AS AGG
      WHERE eventid IN ('528', '540', '4624') and {% condition datefilter %} DATE {% endcondition %} GROUP BY entity2)

      ;;
  }

  filter: datefilter {
    type: date
  }

  dimension: actiontype {
    type: string
    sql: ${TABLE}."ACTIONTYPE" ;;
  }

  dimension: eventid {
    type: string
    sql: ${TABLE}."EVENTID" ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}."COUNT" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  set: detail {
    fields: [actiontype, eventid, count, type]
  }
}
