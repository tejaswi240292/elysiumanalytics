view: ueba_outliers_ueba {
    sql_table_name:  ueba_outliers_ueba
      ;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: event_date {
    type: date
    sql: ${TABLE}."EVENT_DATE" ;;
  }

  dimension: event_date_list {
    type: string
    sql:  ${TABLE}."EVENT_DATE"  ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: x {
    type: number
    sql: ${TABLE}."X" ;;
  }

  dimension: y {
    type: number
    sql: ${TABLE}."Y" ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}."SCORE" ;;
  }

  dimension: score_list {
    type: string
    sql:  ${TABLE}."SCORE"  ;;
  }

  dimension: report_name {
    type: string
    sql: ${TABLE}."REPORT_NAME" ;;
    link: {
      label: "UEBA DASHBOARD"
      url: "{% if value  == 'Bot-Attack' %}
      /dashboards/76
      {% elsif value == 'VPN-Conenctions' %}
      /dashboards/41
      {% elsif value == 'Bandwidth-Usage-by-Size' %}
      /dashboards/77
      {% elsif value == 'Bandwidth-Usage-by-Count' %}
      /dashboards/72
      {% elsif value == 'Endpoint-Indicators-of-Compromise' %}
      /dashboards/79
      {% elsif value  == 'File-Downloads' %}
      /dashboards/78
      {% elsif value  == 'High-Volume-File-Access' %}
      /dashboards/81
      {% elsif value  == 'Privileged-Account-Usage' %}
      /dashboards/82
      {% else %}
      /dashboards/83
      {% endif %}"

    }
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  set: detail {
    fields: [
      event_date,
      id,
      x,
      y,
      score,
      report_name,
      type
    ]
  }
}
