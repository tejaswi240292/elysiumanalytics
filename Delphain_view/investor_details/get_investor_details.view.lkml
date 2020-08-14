view: get_investor_details {
  sql_table_name: Get_INVSTOR_DETAILS({% parameter symbol %},{% parameter currdte %},{% parameter status %})
       ;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }
  parameter: symbol {
    type: string

  }
    parameter: currdte {
      type: date

  }

  parameter: status {
    type: string
    allowed_value: {
      label: "Total"
      value: "Total"
      }
    allowed_value: {
      label: "New"
      value: "New"}
    allowed_value: {
      label: "Sold Out"
      value: "Sold"}
    allowed_value: {
      label: "Increment"
      value: "Incr"}
    allowed_value: {
      label: "Decreased"
      value: "Decr"}
  }

  dimension: ticker {
    type: string
    sql: ${TABLE}.ticker ;;
  }

  dimension: investorname {
    type: string
    sql: ${TABLE}.investorname ;;
  }

  dimension: securitytype {
    type: string
    sql: ${TABLE}.securitytype ;;
  }

  dimension: calendardate {
    type: date
    sql: ${TABLE}.calendardate ;;
  }

  dimension: units {
    type: number
    sql: ${TABLE}.UNITS ;;
  }

  dimension: status_op {
    type: string
    sql: ${TABLE}.Status_OP ;;
  }

  dimension: share_diff {
    type: number
    sql: ${TABLE}.ShareDiff ;;
  }

  dimension: ownership_perc {
    type: number
    sql: ${TABLE}.OwnershipPerc ;;
  }

  dimension: prev_ownership_perc {
    type: number
    sql: ${TABLE}.PrevOwnershipPerc ;;
  }

  set: detail {
    fields: [
      ticker,
      investorname,
      securitytype,
      calendardate,
      units,
      status_op,
      share_diff,
      ownership_perc,
      prev_ownership_perc
    ]
  }
}
