view: get_investor_sold {
  derived_table: {
    sql: SELECT  ticker
        ,investorname
        ,securitytype
        ,calendardate
        ,UNITS
        ,'Sold' [Status]
        ,ShareDiff
        ,0OwnershipPerc
        ,0PrevOwnershipPerc
from [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData]
WHERE ticker = {% parameter Symbol %}
and  securitytype = 'SHR'
and investorname NOT IN (SELECT DISTINCT investorname FROM [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] WHERE ticker = {% parameter Symbol %} and  securitytype = 'SHR' AND calendardate = {% parameter dte %} )
AND calendardate = ( SELECT MAX(Qrt_Date) FROM [Key_Fundamentals].[dbo].tbl_Quarter_DATES WHERE Qrt_Date < {% parameter dte %})
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: Symbol {
    type: string
  }

  parameter: dte {
    type: date
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

  dimension_group: calendardate {
    type: time
    sql: ${TABLE}.calendardate ;;
  }

  dimension: units {
    type: number
    sql: ${TABLE}.UNITS ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
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
      calendardate_time,
      units,
      status,
      share_diff,
      ownership_perc,
      prev_ownership_perc
    ]
  }
}
