view: get_investor_sold {
  derived_table: {
    sql: SELECT investorname,
       UNITS,
       'Sold' [Status],
       securitytype
from [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData]
WHERE ticker = 'AA'
and  securitytype = 'SHR'
AND investorname NOT IN (SELECT DISTINCT investorname FROM [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData]
                         WHERE  ticker = 'AA' and  securitytype = 'SHR'
                          AND calendardate = '20200603' )
AND calendardate =  (SELECT MAX(Qrt_Date) FROM [Key_Fundamentals].[dbo].tbl_Quarter_DATES WHERE Qrt_Date < '20200603')
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

  dimension: units {
    type: number
    sql: ${TABLE}.UNITS ;;
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
    fields: [investorname, units, status, securitytype]
  }
}
