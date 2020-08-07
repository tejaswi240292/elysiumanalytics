view: Financials_IncomeStat {
  derived_table: {
    sql: SELECT * FROM
      (SELECT DISTINCT TOP(10)  [ReportPeriod] Period
      ,'##' as [Gross Income]
      ,(CASE WHEN  ABS(REVENUEUSD)>= 1000000000 THEN CAST((REVENUEUSD /1000000000) *1.00 AS DECIMAL(18,2)) ELSE
      CAST((REVENUEUSD /1000000) *1.00 AS DECIMAL(18,2))  END) REVENUEUSD
      ,(CASE WHEN  ABS(COR)>= 1000000000 THEN CAST((COR /1000000000) AS DECIMAL(18,2))
      ELSE CAST((COR /1000000) AS DECIMAL(18,2)) END ) COR
      ,(CASE WHEN  ABS(depamor)>= 1000000000 THEN CAST((depamor /1000000000) AS DECIMAL(18,2))
      ELSE CAST((depamor /1000000) AS DECIMAL(18,2))  END ) depamor
      --,(CASE WHEN  ABS(REVENUE-GP)>= 1000000000 THEN CAST(CAST(((REVENUE-GP) /1000000000) AS DECIMAL(18,2)) AS VARCHAR)+' B'
      --ELSE CAST(CAST(((REVENUE-GP)/1000000) AS DECIMAL(18,2)) AS VARCHAR)+' M' END) GI
      ,(CASE WHEN  ABS(GP)>= 1000000000 THEN CAST((GP /1000000000) AS DECIMAL(18,2))
      ELSE CAST((GP/1000000) AS DECIMAL(18,2))  END) GI
      ,(CASE WHEN  REVENUEUSD<> 0 THEN CAST((GP/REVENUEUSD)*100 AS DECIMAL(18,2)) END)  GP_Perc

      ,'##' as [OperatingIncome]
      ,(CASE WHEN  ABS(RND)>= 1000000000 THEN CAST(CAST((RND /1000000000) AS DECIMAL(18,2)) AS VARCHAR)+' B'
      ELSE CAST(CAST((RND/1000000) AS DECIMAL(18,2)) AS VARCHAR)+' M' END) RND
      ,(CASE WHEN  ABS(SGNA)>= 1000000000 THEN CAST(CAST((SGNA /1000000000) AS DECIMAL(18,2)) AS VARCHAR)+' B'
      ELSE CAST(CAST((SGNA /1000000) AS DECIMAL(18,2)) AS VARCHAR)+' M'  END) SGNA
      ,(CASE WHEN  ABS(((GP-RND)-(SGNA)))>= 1000000000 THEN CAST(CAST((((GP-RND)-(SGNA)) /1000000000) AS DECIMAL(18,2)) AS VARCHAR)+' B'
      ELSE CAST(CAST((((GP-RND)-(SGNA))/1000000) AS DECIMAL(18,2)) AS VARCHAR)+' M' END)  AS IncomeLoss
        ,(CASE WHEN  REVENUEUSD<> 0 THEN CAST((OPINC/REVENUEUSD)*100 AS DECIMAL(18,2)) END) As OP_Perc
        ,'##' [Non-OperatingIncome]
      ,'##' OperatingProfits

      ,(CASE WHEN  ABS(((GP-RND)-(SGNA)))>= 1000000000 THEN CAST(CAST((((GP-RND)-(SGNA)) /1000000000) AS DECIMAL(18,2)) AS VARCHAR)+' B'
      ELSE CAST(CAST((((GP-RND)-(SGNA))/1000000) AS DECIMAL(18,2)) AS VARCHAR)+' M' END)  AS OperatingProfit
      ,(CASE WHEN  ABS(GP)>= 1000000000 THEN CAST(CAST((GP /1000000000) AS DECIMAL(18,2)) AS VARCHAR)+' B'
      ELSE CAST(CAST((GP/1000000) AS DECIMAL(18,2)) AS VARCHAR)+' M' END) GP
      ,'##' AS [Net Income]
      ,(CASE WHEN  ABS(NETINCDIS)>= 1000000000 THEN CAST(CAST(((NETINCDIS * -1) /1000000000) AS DECIMAL(18,2)) AS VARCHAR)+' B'
      ELSE CAST(CAST(((NETINCDIS)/1000000) AS DECIMAL(18,2)) AS VARCHAR)+' M' END) NETINCDIS
      ,(CASE WHEN  ABS(NETINCNCI)>= 1000000000 THEN CAST(CAST(((NETINCNCI) /1000000000) AS DECIMAL(18,2)) AS VARCHAR)+' B'
      ELSE CAST(CAST(((NETINCNCI)/1000000) AS DECIMAL(18,2)) AS VARCHAR)+' M' END) NETINCNCI
      ,(CASE WHEN  ABS(EBITUSD)>= 1000000000 THEN CAST(CAST((EBITUSD /1000000000) AS DECIMAL(18,2)) AS VARCHAR)+' B'
      ELSE CAST(CAST((EBITUSD /1000000)AS DECIMAL(18,2)) AS VARCHAR)+' M' END) EBITUSD
      ,(CASE WHEN  ABS(INTEXP)>= 1000000000 THEN CAST(CAST((INTEXP /1000000000) AS DECIMAL(18,2)) AS VARCHAR)+' B'
      ELSE CAST(CAST((INTEXP /1000000) AS DECIMAL(18,2)) AS VARCHAR)+' M' END) INTEXP
      ,(CASE WHEN  ABS(EBT)>= 1000000000 THEN CAST(CAST((EBT /1000000000) AS DECIMAL(18,2)) AS VARCHAR)+' B'
      ELSE CAST(CAST((EBT /1000000) AS DECIMAL(18,2)) AS VARCHAR)+' M'  END) EBT
      ,(CASE WHEN  ABS(TAXEXP)>= 1000000000 THEN CAST(CAST((TAXEXP /1000000000) AS DECIMAL(18,2)) AS VARCHAR)+' B'
      ELSE CAST(CAST((TAXEXP/1000000) AS DECIMAL(18,2)) AS VARCHAR)+' M' END) TAXEXP

      ,CAST((CASE WHEN  ABS(EBT) <>0 THEN CAST((TAXEXP /EBT)*100 AS DECIMAL(18,2))  ELSE 0 END) AS VARCHAR)+' %' TAXPERC
        ,'##' NetProfits
    ,(CASE WHEN  ABS(NETINC)>= 1000000000 THEN CAST(CAST((NETINC /1000000000) AS DECIMAL(18,2)) AS VARCHAR)+' B'
      ELSE CAST(CAST((NETINC/1000000) AS DECIMAL(18,2)) AS VARCHAR)+' M' END) NETINC
      ,(CASE WHEN  REVENUEUSD<> 0 THEN CAST((NETINC/REVENUEUSD)*100 AS DECIMAL(18,2)) END) As Net_Perc
      ,(CASE WHEN  ABS(NETINCCMNUSD)>= 1000000000 THEN CAST(CAST((NETINCCMNUSD /1000000000) AS DECIMAL(18,2)) AS VARCHAR)+' B'
      ELSE CAST(CAST((NETINCCMNUSD /1000000) AS DECIMAL(18,2)) AS VARCHAR)+' M' END) NETINCCMNUSD
       ,'##' AS [Earnings Per Share]
    ,(CASE WHEN  ABS(shareswa)>= 1000000000 THEN CAST(CAST((shareswa /1000000000) AS DECIMAL(18,2)) AS VARCHAR)+' B'
      ELSE CAST(CAST((shareswa/1000000) AS DECIMAL(18,2)) AS VARCHAR)+' M' END) SHARESBAS
       ,CAST(EPSUSD AS DECIMAL(18,2)) EPSUSD
       ,CAST(EPSDIL AS DECIMAL(18,2)) EPSDIL
       ,'##' VariableExpenses
       ,'##' FixedExpenses
       ,'##' NonOperatingexpenses
      FROM [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag]
      WHERE ID IN(SELECT ID  FROM (SELECT ROW_NUMBER() OVER (PARTITION BY [Ticker],CalendarDate ORDER BY [ReportPeriod] DESC ) AS RowNo,ID
     FROM [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag]  WHERE Ticker='AAPL' AND [dimension]='ARQ' AND [ReportPeriod]<='2020-08-04' ) a WHERE RowNo=1)
      ORDER BY [ReportPeriod]  DESC) ABC

 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: period {
    type: date
    sql: ${TABLE}.Period ;;
  }

  dimension: gross_income {
    type: string
    label: "Gross Income"
    sql: ${TABLE}."Gross Income" ;;
  }

  dimension: revenueusd {
    type: string
    sql: ${TABLE}.REVENUEUSD ;;
  }

  dimension: cor {
    type: string
    sql: ${TABLE}.COR ;;
  }

  dimension: depamor {
    type: string
    sql: ${TABLE}.depamor ;;
  }

  dimension: gi {
    type: string
    sql: ${TABLE}.GI ;;
  }

  dimension: gp_perc {
    type: number
    sql: ${TABLE}.GP_Perc ;;
  }

  dimension: operating_income {
    type: string
    sql: ${TABLE}.OperatingIncome ;;
  }

  dimension: rnd {
    type: string
    sql: ${TABLE}.RND ;;
  }

  dimension: sgna {
    type: string
    sql: ${TABLE}.SGNA ;;
  }

  dimension: income_loss {
    type: string
    sql: ${TABLE}.IncomeLoss ;;
  }

  dimension: op_perc {
    type: number
    sql: ${TABLE}.OP_Perc ;;
  }

  dimension: nonoperating_income {
    type: string
    sql: ${TABLE}."Non-OperatingIncome" ;;
  }

  dimension: operating_profits {
    type: string
    sql: ${TABLE}.OperatingProfits ;;
  }

  dimension: operating_profit {
    type: string
    sql: ${TABLE}.OperatingProfit ;;
  }

  dimension: gp {
    type: string
    sql: ${TABLE}.GP ;;
  }

  dimension: net_income {
    type: string
    label: "Net Income"
    sql: ${TABLE}."Net Income" ;;
  }

  dimension: netincdis {
    type: string
    sql: ${TABLE}.NETINCDIS ;;
  }

  dimension: netincnci {
    type: string
    sql: ${TABLE}.NETINCNCI ;;
  }

  dimension: ebitusd {
    type: string
    sql: ${TABLE}.EBITUSD ;;
  }

  dimension: intexp {
    type: string
    sql: ${TABLE}.INTEXP ;;
  }

  dimension: ebt {
    type: string
    sql: ${TABLE}.EBT ;;
  }

  dimension: taxexp {
    type: string
    sql: ${TABLE}.TAXEXP ;;
  }

  dimension: taxperc {
    type: string
    sql: ${TABLE}.TAXPERC ;;
  }

  dimension: net_profits {
    type: string
    sql: ${TABLE}.NetProfits ;;
  }

  dimension: netinc {
    type: string
    sql: ${TABLE}.NETINC ;;
  }

  dimension: net_perc {
    type: number
    sql: ${TABLE}.Net_Perc ;;
  }

  dimension: netinccmnusd {
    type: string
    sql: ${TABLE}.NETINCCMNUSD ;;
  }

  dimension: earnings_per_share {
    type: string
    label: "Earnings Per Share"
    sql: ${TABLE}."Earnings Per Share" ;;
  }

  dimension: sharesbas {
    type: string
    sql: ${TABLE}.SHARESBAS ;;
  }

  dimension: epsusd {
    type: number
    sql: ${TABLE}.EPSUSD ;;
  }

  dimension: epsdil {
    type: number
    sql: ${TABLE}.EPSDIL ;;
  }

  dimension: variable_expenses {
    type: string
    sql: ${TABLE}.VariableExpenses ;;
  }

  dimension: fixed_expenses {
    type: string
    sql: ${TABLE}.FixedExpenses ;;
  }

  dimension: non_operatingexpenses {
    type: string
    sql: ${TABLE}.NonOperatingexpenses ;;
  }

  set: detail {
    fields: [
      period,
      gross_income,
      revenueusd,
      cor,
      depamor,
      gi,
      gp_perc,
      operating_income,
      rnd,
      sgna,
      income_loss,
      op_perc,
      nonoperating_income,
      operating_profits,
      operating_profit,
      gp,
      net_income,
      netincdis,
      netincnci,
      ebitusd,
      intexp,
      ebt,
      taxexp,
      taxperc,
      net_profits,
      netinc,
      net_perc,
      netinccmnusd,
      earnings_per_share,
      sharesbas,
      epsusd,
      epsdil,
      variable_expenses,
      fixed_expenses,
      non_operatingexpenses
    ]
  }
}
