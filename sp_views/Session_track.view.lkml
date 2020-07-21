view: Session_Track {
  derived_table: {
    sql:SELECT EVENT_DATE,STV.VALUE::string AS SRC_IP,lower(src_username) as SRC_USERNAME
FROM tenant5.enriched.session_tracking_validation, LATERAL FLATTEN(ASSIGNED_IPS) STV
where {% condition srcip %} src_ip {% endcondition %} and  {% condition datefilter %} EVENT_DATE::date {% endcondition %} and SRC_IP like '192%'
;;
}


filter: srcip {
  type: string
}

filter: datefilter {
  type: date
}
dimension: SRC_IP {
  type: string
  sql: ${TABLE}."SRC_IP" ;;
}

  dimension: SRC_USERNAME {
    type: string
    sql: ${TABLE}."SRC_USERNAME" ;;
  }
  dimension_group: EVENT_DATE {
    type: time
    sql: ${TABLE}."EVENT_DATE" ;;
  }
}
