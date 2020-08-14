view: get_investor_new {
  derived_table: {
    sql: SELECT DISTINCT C.investorname
               ,C.calendardate
               ,C.UNITS
               ,CASE WHEN ISNULL(C.UNITS,0) = 0 THEN 0 ELSE (((C.UNITS* 0.000001)/tzc.Free_float) *100)
                END OwnershipPerc
               ,0PrevOwnershipPerc
              ,ISNULL(C.ShareDiff,0)ShareDiff
              ,C.[Status],C.securitytype

FROM [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] C
LEFT OUTER JOIN ( SELECT ticker,Free_float
                    FROM [Key_Master_Db_Dev].[dbo].[tbl_ZACKS_CP]
                  where ticker = 'AA') tzc
on c.ticker=tzc.ticker
WHERE C.ticker = 'AA'
and  c.securitytype = 'SHR'
and   C.calendardate = '20200605'
AND C.[Status] = COALESCE('New',C.[STATUS])
ORDER BY C.UNITS DESC
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: investorname {
    type: string
    sql: ${TABLE}.investorname ;;
  }

  dimension_group: calendardate {
    type: time
    sql: ${TABLE}.calendardate ;;
  }

  dimension: units {
    type: number
    sql: ${TABLE}.UNITS ;;
  }

  dimension: ownership_perc {
    type: number
    sql: ${TABLE}.OwnershipPerc ;;
  }

  dimension: prev_ownership_perc {
    type: number
    sql: ${TABLE}.PrevOwnershipPerc ;;
  }

  dimension: share_diff {
    type: number
    sql: ${TABLE}.ShareDiff ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: securitytype {
    type: string
    sql: ${TABLE}.securitytype ;;
  }

  set: detail {
    fields: [
      investorname,
      calendardate_time,
      units,
      ownership_perc,
      prev_ownership_perc,
      share_diff,
      status,
      securitytype
    ]
  }
}
