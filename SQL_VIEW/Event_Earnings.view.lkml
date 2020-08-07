view: Event_Earnings {
  derived_table: {
    sql: SELECT calendardate,EPS_MEAN_EST,EPS_ACT,Code FROM
      (SELECT Convert(DATE,[DATE],120) calendardate,EPS_MEAN_EST,EPS_ACT,Code  FROM [ZacksEarningSurpriseZES-1])ZacksEarnings
      WHERE {% condition Symbol %} Code {% endcondition %} and  {% condition Datefilter %} calendardate {% endcondition %}
       ;;
  }

  filter: Symbol {
    type: string
  }

  filter: Datefilter {
    type: date
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: calendardate {
    type: date
    sql: ${TABLE}.calendardate ;;
  }

  dimension: eps_mean_est {
    type: string
    sql: ${TABLE}.EPS_MEAN_EST ;;
  }

  dimension: eps_act {
    type: string
    sql: ${TABLE}.EPS_ACT ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.Code ;;
  }

  set: detail {
    fields: [calendardate, eps_mean_est, eps_act, code]
  }
}
