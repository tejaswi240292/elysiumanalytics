view: get_statements {
  derived_table: {
    sql: SELECT DISTINCT  [ReportPeriod] Period
         ,'Q'+zes.CAL_QTR+'`'+RIGHT((zes.CAL_YEAR),2) as Quater

            ,[dimension]
                 ,Ticker
                 ,'Quarterly' as Frequency
            ,'##' as [Gross Income]
            ,(CASE WHEN  ABS(REVENUEUSD)>= 1000000000 THEN CAST((REVENUEUSD /1000000000) *1.00 AS DECIMAL(18,2)) ELSE
                    CAST((REVENUEUSD /1000000) *1.00 AS DECIMAL(18,2))  END)    REVENUEUSD
                    ,(CASE WHEN  ABS(COR)>= 1000000000 THEN CAST((COR /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((COR /1000000) AS DECIMAL(18,2)) END ) COR
                    ,(CASE WHEN  ABS(depamor)>= 1000000000 THEN CAST((depamor /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((depamor /1000000) AS DECIMAL(18,2))  END ) depamor
                    --,(CASE WHEN  ABS(REVENUE-GP)>= 1000000000 THEN CAST(((REVENUE-GP) /1000000000) AS DECIMAL(18,2))
                    --ELSE CAST(((REVENUE-GP)/1000000) AS DECIMAL(18,2))  END) GI
                    ,(CASE WHEN  ABS(GP)>= 1000000000 THEN CAST((GP /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((GP/1000000) AS DECIMAL(18,2))  END) GI
                    ,(CASE WHEN  REVENUEUSD<> 0 THEN CAST((GP/REVENUEUSD)*100 AS DECIMAL(18,2)) END)  GP_Perc

                    ,'##' as [OperatingIncome]
                    ,(CASE WHEN  ABS(RND)>= 1000000000 THEN CAST((RND /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((RND/1000000) AS DECIMAL(18,2))  END) RND
                    ,(CASE WHEN  ABS(SGNA)>= 1000000000 THEN CAST((SGNA /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((SGNA /1000000) AS DECIMAL(18,2)) END) SGNA
                    ,(CASE WHEN  ABS(((GP-RND)-(SGNA)))>= 1000000000 THEN CAST((((GP-RND)-(SGNA)) /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((((GP-RND)-(SGNA))/1000000) AS DECIMAL(18,2))  END)  AS IncomeLoss
                      ,(CASE WHEN  REVENUEUSD<> 0 THEN CAST((OPINC/REVENUEUSD)*100 AS DECIMAL(18,2)) END) As OP_Perc
                      ,'##' [Non-OperatingIncome]
                    ,'##' OperatingProfits

                    ,(CASE WHEN  ABS(((GP-RND)-(SGNA)))>= 1000000000 THEN CAST((((GP-RND)-(SGNA)) /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((((GP-RND)-(SGNA))/1000000) AS DECIMAL(18,2))  END)  AS OperatingProfit
                    ,(CASE WHEN  ABS(GP)>= 1000000000 THEN CAST((GP /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((GP/1000000) AS DECIMAL(18,2))  END) GP
                    ,'##' AS [Net Income]
                    ,(CASE WHEN  ABS(NETINCDIS)>= 1000000000 THEN CAST(((NETINCDIS * -1) /1000000000) AS DECIMAL(18,2))
                    ELSE CAST(((NETINCDIS)/1000000) AS DECIMAL(18,2))  END) NETINCDIS
                    ,(CASE WHEN  ABS(NETINCNCI)>= 1000000000 THEN CAST(((NETINCNCI) /1000000000) AS DECIMAL(18,2))
                    ELSE CAST(((NETINCNCI)/1000000) AS DECIMAL(18,2))  END) NETINCNCI
                    ,(CASE WHEN  ABS(EBITUSD)>= 1000000000 THEN CAST((EBITUSD /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((EBITUSD /1000000)AS DECIMAL(18,2))  END) EBITUSD
                    ,(CASE WHEN  ABS(INTEXP)>= 1000000000 THEN CAST((INTEXP /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((INTEXP /1000000) AS DECIMAL(18,2))  END) INTEXP
                    ,(CASE WHEN  ABS(EBT)>= 1000000000 THEN CAST((EBT /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((EBT /1000000) AS DECIMAL(18,2))   END) EBT
                    ,(CASE WHEN  ABS(TAXEXP)>= 1000000000 THEN CAST((TAXEXP /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((TAXEXP/1000000) AS DECIMAL(18,2))  END) TAXEXP

                    ,CAST((CASE WHEN  ABS(EBT) <>0 THEN CAST((TAXEXP /EBT)*100 AS DECIMAL(18,2))  ELSE 0 END) AS VARCHAR) TAXPERC
                      ,'##' NetProfits
                  ,(CASE WHEN  ABS(NETINC)>= 1000000000 THEN CAST((NETINC /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((NETINC/1000000) AS DECIMAL(18,2))  END) NETINC
                    ,(CASE WHEN  REVENUEUSD<> 0 THEN CAST((NETINC/REVENUEUSD)*100 AS DECIMAL(18,2)) END) As Net_Perc
                    ,(CASE WHEN  ABS(NETINCCMNUSD)>= 1000000000 THEN CAST((NETINCCMNUSD /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((NETINCCMNUSD /1000000) AS DECIMAL(18,2))  END) NETINCCMNUSD
                     ,'##' AS [Earnings Per Share]
                  ,(CASE WHEN  ABS(shareswa)>= 1000000000 THEN CAST((shareswa /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((shareswa/1000000) AS DECIMAL(18,2))  END) SHARESBAS
                     ,CAST(EPSUSD AS DECIMAL(18,2)) EPSUSD
                     ,CAST(EPSDIL AS DECIMAL(18,2)) EPSDIL


            FROM [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag]
            left outer join [ZacksEarningSurpriseZES-1] zes
            on ticker= zes.code
            and cast(calendardate as varchar(50)) = zes.PER_END_DATE

            WHERE ID IN(SELECT ID  FROM (SELECT ROW_NUMBER() OVER (PARTITION BY [Ticker]  ORDER BY [ReportPeriod] DESC ) AS RowNo,ID
                                   FROM [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag]
                     WHERE Ticker = COALESCE(NULLIF({% parameter symb %},'NULL'), (select top 1 symbol from Stock_Quotes_Adj where symbol not in ('SPX','NDX') and [Date]='20200722' order by [Close] desc))
                     AND [dimension]='ARQ'
                     AND ReportPeriod <= {% parameter dte %} ) a WHERE RowNo<=16)

       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: symb {
    type: string
    default_value: "NULL"
  }

  parameter: dte {
    type: date
  }

  dimension: period {
    type: date
    sql: ${TABLE}.Period ;;
  }

  dimension: quater {
    type: string
    sql: ${TABLE}.Quater ;;
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

  dimension: gross_income {
    type: string
    label: "Gross Income"
    sql: ${TABLE}."Gross Income" ;;
  }

  dimension: revenueusd {
    type: number
    sql: ${TABLE}.REVENUEUSD ;;
  }

  dimension: cor {
    type: number
    sql: ${TABLE}.COR ;;
  }

  dimension: depamor {
    type: number
    sql: ${TABLE}.depamor ;;
  }

  dimension: gi {
    type: number
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
    type: number
    sql: ${TABLE}.RND ;;
  }

  dimension: sgna {
    type: number
    sql: ${TABLE}.SGNA ;;
  }

  dimension: income_loss {
    type: number
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
    type: number
    sql: ${TABLE}.OperatingProfit ;;
  }

  dimension: gp {
    type: number
    sql: ${TABLE}.GP ;;
  }

  dimension: net_income {
    type: string
    label: "Net Income"
    sql: ${TABLE}."Net Income" ;;
  }

  dimension: netincdis {
    type: number
    sql: ${TABLE}.NETINCDIS ;;
  }

  dimension: netincnci {
    type: number
    sql: ${TABLE}.NETINCNCI ;;
  }

  dimension: ebitusd {
    type: number
    sql: ${TABLE}.EBITUSD ;;
  }

  dimension: intexp {
    type: number
    sql: ${TABLE}.INTEXP ;;
  }

  dimension: ebt {
    type: number
    sql: ${TABLE}.EBT ;;
  }

  dimension: taxexp {
    type: number
    sql: ${TABLE}.TAXEXP ;;
  }

  dimension: taxperc {
    type: number
    sql: ${TABLE}.TAXPERC ;;
  }

  dimension: net_profits {
    type: string
    sql: ${TABLE}.NetProfits ;;
  }

  dimension: netinc {
    type: number
    sql: ${TABLE}.NETINC ;;
  }

  dimension: net_perc {
    type: number
    sql: ${TABLE}.Net_Perc ;;
  }

  dimension: netinccmnusd {
    type: number
    sql: ${TABLE}.NETINCCMNUSD ;;
  }

  dimension: earnings_per_share {
    type: string
    label: "Earnings Per Share"
    sql: ${TABLE}."Earnings Per Share" ;;
  }

  dimension: sharesbas {
    type: number
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

  set: detail {
    fields: [
      period,
      quater,
      dimension,
      ticker,
      frequency,
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
      epsdil
    ]
  }
}
