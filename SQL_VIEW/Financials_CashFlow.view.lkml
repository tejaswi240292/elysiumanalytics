view: Financials_Cashflow {
  derived_table: {
    sql: SELECT * FROM
          (SELECT DISTINCT Top(10)[ReportPeriod]  Period
          ,'##' [OperatingAct]
           ,[dimension]
                  ,Ticker
                  ,'Annual' as Frequency
          ,(CASE WHEN  ABS(NETINC)>= 1000000000 THEN CAST((NETINC /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NETINC/1000000) AS DECIMAL(18,2)) END) NETINC
          ,(CASE WHEN  ABS(DEPAMOR)>= 1000000000 THEN CAST((DEPAMOR /1000000000) AS DECIMAL(18,2))
            ELSE CAST((DEPAMOR /1000000) AS DECIMAL(18,2)) END) DEPAMOR
          ,(CASE WHEN  ABS(SBCOMP)>= 1000000000 THEN CAST((SBCOMP /1000000000) AS DECIMAL(18,2))
            ELSE CAST((SBCOMP/1000000) AS DECIMAL(18,2)) END) SBCOMP
          ,(CASE WHEN  ABS(NCFO)>= 1000000000 THEN CAST((NCFO /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFO /1000000) AS DECIMAL(18,2)) END) NCFO
          ,'##' InvActivities
          ,(CASE WHEN  ABS(CAPEX)>= 1000000000 THEN CAST((CAPEX /1000000000) AS DECIMAL(18,2))
            ELSE CAST((CAPEX /1000000) AS DECIMAL(18,2)) END) CAPEX
          ,(CASE WHEN  ABS(NCFI)>= 1000000000 THEN CAST((NCFI /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFI /1000000)  AS DECIMAL(18,2)) END) NCFI
          ,'##' FinActivities
          ,(CASE WHEN  ABS(NCFDIV)>= 1000000000 THEN CAST((NCFDIV /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFDIV /1000000) AS DECIMAL(18,2)) END) NCFDIV
          ,(CASE WHEN  ABS(NCFCOMMON)>= 1000000000 THEN CAST((NCFCOMMON /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFCOMMON /1000000) AS DECIMAL(18,2))  END) NCFCOMMON
          ,(CASE WHEN  ABS(NCFDEBT)>= 1000000000 THEN CAST((NCFDEBT /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFDEBT /1000000) AS DECIMAL(18,2)) END) NCFDEBT
          ,(CASE WHEN  ABS(NCFF)>= 1000000000 THEN CAST((NCFF /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFF /1000000) AS DECIMAL(18,2)) END) NCFF
          , (CASE WHEN  ABS(NCFX)>= 1000000000 THEN CAST((NCFX /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFX /1000000) AS DECIMAL(18,2)) END) NCFX
          , (CASE WHEN  ABS(NCF)>= 1000000000 THEN CAST((NCF /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCF /1000000) AS DECIMAL(18,2)) END) NCF
          ,'##' TotalCashFlow
            ,(CASE WHEN  ABS(FCF)>= 1000000000 THEN CAST((FCF /1000000000) AS DECIMAL(18,2))
            ELSE CAST((FCF/1000000)  AS DECIMAL(18,2)) END) FCF
          FROM [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag]
          WHERE ID IN(SELECT ID  FROM (SELECT ROW_NUMBER() OVER (PARTITION BY [Ticker],CalendarDate ORDER BY [ReportPeriod] DESC ) AS RowNo,ID
             FROM [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag]  WHERE {% condition Symbol %} Ticker {% endcondition %} AND [dimension]='ARY' AND {% condition Datefilter %} ReportPeriod {% endcondition %} ) a WHERE RowNo=1)
          ORDER BY [ReportPeriod] DESC
          UNION ALL

          SELECT DISTINCT Top(10)[ReportPeriod]  Period
          ,'##' [OperatingAct]
           ,[dimension]
                  ,Ticker
                  ,'Quarterly' as Frequency
          ,(CASE WHEN  ABS(NETINC)>= 1000000000 THEN CAST((NETINC /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NETINC/1000000) AS DECIMAL(18,2)) END) NETINC
          ,(CASE WHEN  ABS(DEPAMOR)>= 1000000000 THEN CAST((DEPAMOR /1000000000) AS DECIMAL(18,2))
            ELSE CAST((DEPAMOR /1000000) AS DECIMAL(18,2)) END) DEPAMOR
          ,(CASE WHEN  ABS(SBCOMP)>= 1000000000 THEN CAST((SBCOMP /1000000000) AS DECIMAL(18,2))
            ELSE CAST((SBCOMP/1000000) AS DECIMAL(18,2)) END) SBCOMP
          ,(CASE WHEN  ABS(NCFO)>= 1000000000 THEN CAST((NCFO /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFO /1000000) AS DECIMAL(18,2)) END) NCFO
          ,'##' InvActivities
          ,(CASE WHEN  ABS(CAPEX)>= 1000000000 THEN CAST((CAPEX /1000000000) AS DECIMAL(18,2))
            ELSE CAST((CAPEX /1000000) AS DECIMAL(18,2)) END) CAPEX
          ,(CASE WHEN  ABS(NCFI)>= 1000000000 THEN CAST((NCFI /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFI /1000000)  AS DECIMAL(18,2)) END) NCFI
          ,'##' FinActivities
          ,(CASE WHEN  ABS(NCFDIV)>= 1000000000 THEN CAST((NCFDIV /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFDIV /1000000) AS DECIMAL(18,2)) END) NCFDIV
          ,(CASE WHEN  ABS(NCFCOMMON)>= 1000000000 THEN CAST((NCFCOMMON /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFCOMMON /1000000) AS DECIMAL(18,2))  END) NCFCOMMON
          ,(CASE WHEN  ABS(NCFDEBT)>= 1000000000 THEN CAST((NCFDEBT /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFDEBT /1000000) AS DECIMAL(18,2)) END) NCFDEBT
          ,(CASE WHEN  ABS(NCFF)>= 1000000000 THEN CAST((NCFF /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFF /1000000) AS DECIMAL(18,2)) END) NCFF
          , (CASE WHEN  ABS(NCFX)>= 1000000000 THEN CAST((NCFX /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFX /1000000) AS DECIMAL(18,2)) END) NCFX
          , (CASE WHEN  ABS(NCF)>= 1000000000 THEN CAST((NCF /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCF /1000000) AS DECIMAL(18,2)) END) NCF
          ,'##' TotalCashFlow
            ,(CASE WHEN  ABS(FCF)>= 1000000000 THEN CAST((FCF /1000000000) AS DECIMAL(18,2))
            ELSE CAST((FCF/1000000)  AS DECIMAL(18,2)) END) FCF
          FROM [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag]
          WHERE ID IN(SELECT ID  FROM (SELECT ROW_NUMBER() OVER (PARTITION BY [Ticker],CalendarDate ORDER BY [ReportPeriod] DESC ) AS RowNo,ID
             FROM [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag]  WHERE {% condition Symbol %} Ticker {% endcondition %} AND [dimension]='ARQ' AND {% condition Datefilter %} ReportPeriod {% endcondition %} ) a WHERE RowNo=1)
          ORDER BY [ReportPeriod] DESC

          UNION ALL

          SELECT DISTINCT Top(10)[ReportPeriod]  Period
          ,'##' [OperatingAct]
           ,[dimension]
                  ,Ticker
                  ,'TTM' as Frequency
          ,(CASE WHEN  ABS(NETINC)>= 1000000000 THEN CAST((NETINC /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NETINC/1000000) AS DECIMAL(18,2)) END) NETINC
          ,(CASE WHEN  ABS(DEPAMOR)>= 1000000000 THEN CAST((DEPAMOR /1000000000) AS DECIMAL(18,2))
            ELSE CAST((DEPAMOR /1000000) AS DECIMAL(18,2)) END) DEPAMOR
          ,(CASE WHEN  ABS(SBCOMP)>= 1000000000 THEN CAST((SBCOMP /1000000000) AS DECIMAL(18,2))
            ELSE CAST((SBCOMP/1000000) AS DECIMAL(18,2)) END) SBCOMP
          ,(CASE WHEN  ABS(NCFO)>= 1000000000 THEN CAST((NCFO /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFO /1000000) AS DECIMAL(18,2)) END) NCFO
          ,'##' InvActivities
          ,(CASE WHEN  ABS(CAPEX)>= 1000000000 THEN CAST((CAPEX /1000000000) AS DECIMAL(18,2))
            ELSE CAST((CAPEX /1000000) AS DECIMAL(18,2)) END) CAPEX
          ,(CASE WHEN  ABS(NCFI)>= 1000000000 THEN CAST((NCFI /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFI /1000000)  AS DECIMAL(18,2)) END) NCFI
          ,'##' FinActivities
          ,(CASE WHEN  ABS(NCFDIV)>= 1000000000 THEN CAST((NCFDIV /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFDIV /1000000) AS DECIMAL(18,2)) END) NCFDIV
          ,(CASE WHEN  ABS(NCFCOMMON)>= 1000000000 THEN CAST((NCFCOMMON /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFCOMMON /1000000) AS DECIMAL(18,2))  END) NCFCOMMON
          ,(CASE WHEN  ABS(NCFDEBT)>= 1000000000 THEN CAST((NCFDEBT /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFDEBT /1000000) AS DECIMAL(18,2)) END) NCFDEBT
          ,(CASE WHEN  ABS(NCFF)>= 1000000000 THEN CAST((NCFF /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFF /1000000) AS DECIMAL(18,2)) END) NCFF
          , (CASE WHEN  ABS(NCFX)>= 1000000000 THEN CAST((NCFX /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCFX /1000000) AS DECIMAL(18,2)) END) NCFX
          , (CASE WHEN  ABS(NCF)>= 1000000000 THEN CAST((NCF /1000000000) AS DECIMAL(18,2))
            ELSE CAST((NCF /1000000) AS DECIMAL(18,2)) END) NCF
          ,'##' TotalCashFlow
            ,(CASE WHEN  ABS(FCF)>= 1000000000 THEN CAST((FCF /1000000000) AS DECIMAL(18,2))
            ELSE CAST((FCF/1000000)  AS DECIMAL(18,2)) END) FCF
          FROM [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag]
          WHERE ID IN(SELECT ID  FROM (SELECT ROW_NUMBER() OVER (PARTITION BY [Ticker],CalendarDate ORDER BY [ReportPeriod] DESC ) AS RowNo,ID
             FROM [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag]  WHERE {% condition Symbol %} Ticker {% endcondition %} AND [dimension]='MRT' AND {% condition Datefilter %} ReportPeriod {% endcondition %} ) a WHERE RowNo=1)
          ORDER BY [ReportPeriod] DESC
          ) ABC
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

  dimension: period {
    type: date
    sql: ${TABLE}.Period ;;
  }

  dimension: operating_act {
    type: string
    sql: ${TABLE}.OperatingAct ;;
  }

  dimension: dimension {
    type: string
    sql: ${TABLE}.dimension ;;
  }

  dimension: ticker {
    type: string
    sql: ${TABLE}.Ticker ;;
  }

  dimension: frequency {
    type: string
    sql: ${TABLE}.Frequency ;;
  }

  dimension: netinc {
    type: number
    sql: ${TABLE}.NETINC ;;
  }

  dimension: depamor {
    type: number
    sql: ${TABLE}.DEPAMOR ;;
  }

  dimension: sbcomp {
    type: number
    sql: ${TABLE}.SBCOMP ;;
  }

  dimension: ncfo {
    type: number
    sql: ${TABLE}.NCFO ;;
  }

  dimension: inv_activities {
    type: string
    sql: ${TABLE}.InvActivities ;;
  }

  dimension: capex {
    type: number
    sql: ${TABLE}.CAPEX ;;
  }

  dimension: ncfi {
    type: number
    sql: ${TABLE}.NCFI ;;
  }

  dimension: fin_activities {
    type: string
    sql: ${TABLE}.FinActivities ;;
  }

  dimension: ncfdiv {
    type: number
    sql: ${TABLE}.NCFDIV ;;
  }

  dimension: ncfcommon {
    type: number
    sql: ${TABLE}.NCFCOMMON ;;
  }

  dimension: ncfdebt {
    type: number
    sql: ${TABLE}.NCFDEBT ;;
  }

  dimension: ncff {
    type: number
    sql: ${TABLE}.NCFF ;;
  }

  dimension: ncfx {
    type: number
    sql: ${TABLE}.NCFX ;;
  }

  dimension: ncf {
    type: number
    sql: ${TABLE}.NCF ;;
  }

  dimension: total_cash_flow {
    type: string
    sql: ${TABLE}.TotalCashFlow ;;
  }

  dimension: fcf {
    type: number
    sql: ${TABLE}.FCF ;;
  }

  set: detail {
    fields: [
      period,
      operating_act,
      dimension,
      ticker,
      frequency,
      netinc,
      depamor,
      sbcomp,
      ncfo,
      inv_activities,
      capex,
      ncfi,
      fin_activities,
      ncfdiv,
      ncfcommon,
      ncfdebt,
      ncff,
      ncfx,
      ncf,
      total_cash_flow,
      fcf
    ]
  }
}
