view: get_investor {
  derived_table: {
    sql: SELECT DISTINCT C.investorname
               ,C.calendardate
               ,C.UNITS
               ,CASE WHEN ISNULL(C.UNITS,0) = 0 THEN 0 ELSE (((C.UNITS* 0.000001)/tzc.Free_float) *100)
                END OwnershipPerc
              ,CASE WHEN ISNULL(CUI.UNITS,0) = 0 THEN 0 ELSE (((CUI.UNITS* 0.000001)/tzc.Free_float) *100)
               END PrevOwnershipPerc
              ,ISNULL(C.ShareDiff,0)ShareDiff
              ,C.[Status]
              ,C.securitytype
FROM [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] C
INNER JOIN [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] CUI
ON C.ticker = CUI.ticker AND C.investorname = CUI.investorname
AND C.securitytype = CUI.securitytype

LEFT OUTER JOIN ( SELECT ticker,Free_float
                    FROM [Key_Master_Db_Dev].[dbo].[tbl_ZACKS_CP]
                  where ticker = 'AA') tzc
on C.ticker=tzc.ticker

WHERE {% condition symbol %} C.[ticker] {% endcondition %}
AND  C.securitytype = 'SHR'
AND CUI.calendardate = (SELECT MAX(Qrt_Date) FROM [Key_Fundamentals].[dbo].[tbl_Quarter_DATES] WHERE Qrt_Date < '20200603')
AND {% condition datefilter %} C.calendardate {% endcondition %}
AND {% condition Status %} C.[Status] {% endcondition %}
;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: Status {
    type: string
    allowed_value: {
      label: "Total"
      {value: "Sold"
       value: "New"
       value: "Incr"
       value: "Decr"
       value: "Hold"}}
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

  filter: symbol {
    type: string
  }

  filter: datefilter {
    type: date
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
