view: get_investor_decreased {
  derived_table: {
    sql: SELECT    DISTINCT C.ticker
          ,C.investorname
          ,C.securitytype
          ,C.calendardate
          ,C.UNITS
          ,'Decreased' as status
          ,ISNULL(C.ShareDiff,0)ShareDiff
          ,CASE WHEN ISNULL(C.UNITS,0) = 0 THEN 0 ELSE (((C.UNITS* 0.000001)/TZC.Free_float) *100) END OwnershipPerc
          ,CASE WHEN ISNULL(CUI.UNITS,0) = 0 THEN 0 ELSE (((CUI.UNITS* 0.000001)/TZC.Free_float) *100) END PrevOwnershipPerc

        FROM [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] C
        INNER JOIN [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] CUI
        ON C.ticker = CUI.ticker
        AND C.investorname = CUI.investorname
        AND C.securitytype = CUI.securitytype

        LEFT OUTER JOIN [Key_Master_Db_Dev].[dbo].[tbl_ZACKS_CP] TZC
        ON C.ticker = TZC.ticker

        WHERE C.ticker       = {% parameter Symbol %}
        and c.securitytype   = 'SHR'
        AND C.calendardate   = CUI.calendardate
        and C.calendardate   = (SELECT MAX(Qrt_Date) FROM [Key_Fundamentals].[dbo].tbl_Quarter_DATES WHERE Qrt_Date < {% parameter dte %})
        AND C.[Status]       = 'Decr'
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
    sql: ${TABLE}.status ;;
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
