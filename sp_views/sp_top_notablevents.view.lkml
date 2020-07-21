view: sp_top_notablevents {
  derived_table: {
    sql: select report_name as name, listagg(event_date,',') dates, listagg(score,',') scores, max(score) total from ueba_outliers_ueba
      where {% condition time_period_filter %} event_date {% endcondition %} group by report_name order by  max(score) desc
       ;;
  }
  filter: time_period_filter {
    type: date
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
    drill_fields: [detail*]
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

  dimension: dates {
    type: string
    sql: ${TABLE}."DATES" ;;
  }

  dimension: scores {
    type: string
    sql: ${TABLE}."SCORES" ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}."TOTAL" ;;
  }

  set: detail {
    fields: [name, dates, scores, total]
  }
}
