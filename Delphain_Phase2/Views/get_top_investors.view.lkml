view: get_top_investors {
  derived_table: {
    sql: SELECT DISTINCT TOP(10)  C.investorname
      ,C.calendardate
      ,C.UNITS
          ,CASE WHEN ISNULL(C.UNITS,0) = 0 THEN 0 ELSE (((C.UNITS* 0.000001)/Free_float) *100) END OwnershipPerc

          ,ISNULL(C.ShareDiff,0)ShareDiff
          ,C.[Status]
          ,C.securitytype
          ,C.value
          , 0.0 TotalOwnPerc
          ,0.0 TotalPrevOwnPerc
          , 0 TotalshareDiff
          ,0 TotalVal
          , 0 NumIncr
          , 0 NumDecr
          FROM [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] C

          inner join [Key_Master_Db_Dev].[dbo].[tbl_ZACKS_CP] tzc
          ON C.ticker = tzc.ticker
          WHERE C.ticker = {% parameter symb %}
          and  C.securitytype = 'SHR'
          and   C.calendardate = '20200331'
          ORDER BY OwnershipPerc DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: symb {
    type: string
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

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  dimension: total_own_perc {
    type: number
    sql: ${TABLE}.TotalOwnPerc ;;
  }

  dimension: total_prev_own_perc {
    type: number
    sql: ${TABLE}.TotalPrevOwnPerc ;;
  }

  dimension: totalshare_diff {
    type: number
    sql: ${TABLE}.TotalshareDiff ;;
  }

  dimension: total_val {
    type: number
    sql: ${TABLE}.TotalVal ;;
  }

  dimension: num_incr {
    type: number
    sql: ${TABLE}.NumIncr ;;
  }

  dimension: num_decr {
    type: number
    sql: ${TABLE}.NumDecr ;;
  }

  set: detail {
    fields: [
      investorname,
      calendardate_time,
      units,
      ownership_perc,
      share_diff,
      status,
      securitytype,
      value,
      total_own_perc,
      total_prev_own_perc,
      totalshare_diff,
      total_val,
      num_incr,
      num_decr
    ]
  }
}
