view: get_investor_new {
  derived_table: {
    sql: SELECT DISTINCT C.ticker
                ,C.investorname
                ,C.securitytype
                ,C.calendardate
                ,C.UNITS
                ,'New' [Status]
                ,ISNULL(C.ShareDiff,0)ShareDiff
                ,CASE WHEN ISNULL(C.UNITS,0) = 0 THEN 0 ELSE (((C.UNITS* 0.000001)/TZC.Free_float) *100) END OwnershipPerc
                ,0PrevOwnershipPerc

FROM [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] C
LEFT OUTER JOIN [Key_Master_Db_Dev].[dbo].[tbl_ZACKS_CP] TZC
ON C.ticker = TZC.ticker

WHERE C.ticker = {% parameter Symbol %}
and  c.securitytype = 'SHR'
and   C.calendardate = {% parameter dte %}
AND C.[Status] = 'New'
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
