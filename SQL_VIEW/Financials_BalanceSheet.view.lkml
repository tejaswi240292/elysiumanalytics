view: Financials_BalanceSheet {
  derived_table: {
    sql: SELECT * FROM
      (SELECT DISTINCT Top(10)[ReportPeriod] Period
      ,'##' [CurrAssets]
      ,[dimension]
           ,Ticker
           ,'Annual' as Frequency
      ,(CASE WHEN  ABS(CASHNEQUSD)>= 1000000000 THEN CAST((CASHNEQUSD /1000000000) AS DECIMAL(18,2))
      ELSE CAST((CASHNEQUSD /1000000) AS DECIMAL(18,2))  END) CASHNEQUSD
      ,(CASE WHEN  ABS(investmentsc)>= 1000000000 THEN CAST((investmentsc /1000000000) AS DECIMAL(18,2))
      ELSE CAST((investmentsc /1000000) AS DECIMAL(18,2))  END) investmentsc
      ,(CASE WHEN  ABS(RECEIVABLES)>= 1000000000 THEN CAST((RECEIVABLES /1000000000) AS DECIMAL(18,2))
      ELSE CAST((RECEIVABLES/1000000) AS DECIMAL(18,2))  END) RECEIVABLES
      ,(CASE WHEN  ABS(INVENTORY)>= 1000000000 THEN CAST((INVENTORY /1000000000) AS DECIMAL(18,2))
      ELSE CAST((INVENTORY/1000000) AS DECIMAL(18,2))  END) INVENTORY
     --- Other assets formula
      ,(CASE WHEN  ABS(ASSETSC-CASHNEQUSD-investmentsc-RECEIVABLES-INVENTORY)>= 1000000000 THEN CAST(((ASSETSC-CASHNEQUSD-investmentsc-RECEIVABLES-INVENTORY) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((ASSETSC-CASHNEQUSD-investmentsc-RECEIVABLES-INVENTORY)/1000000) AS DECIMAL(18,2))  END) ASSETSOC
      ,(CASE WHEN  ABS(ASSETSC)>= 1000000000 THEN CAST((ASSETSC /1000000000) AS DECIMAL(18,2))
      ELSE CAST((ASSETSC/1000000) AS DECIMAL(18,2))  END) ASSETSC

      ,'##' [NonCurrAssets]
      ,(CASE WHEN  ABS(investmentsnc)>= 1000000000 THEN CAST((investmentsnc /1000000000) AS DECIMAL(18,2))
      ELSE CAST((investmentsnc /1000000) AS DECIMAL(18,2))  END) investmentsnc
      ,(CASE WHEN  ABS(ppnenet)>= 1000000000 THEN CAST((ppnenet /1000000000) AS DECIMAL(18,2))
      ELSE CAST((ppnenet /1000000) AS DECIMAL(18,2))  END) ppnenet
      ,(CASE WHEN  ABS(INTANGIBLES)>= 1000000000 THEN CAST((INTANGIBLES /1000000000) AS DECIMAL(18,2))
      ELSE CAST((INTANGIBLES /1000000) AS DECIMAL(18,2))  END) INTANGIBLES
     --- Other assets formula
      ,(CASE WHEN  ABS(ASSETSNC-INTANGIBLES-ppnenet-investmentsnc)>= 1000000000 THEN CAST(((ASSETSNC-INTANGIBLES-ppnenet-investmentsnc) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((ASSETSNC-INTANGIBLES-ppnenet-investmentsnc) /1000000)  AS DECIMAL(18,2))  END) ASSETSNOC
      ,(CASE WHEN  ABS(ASSETSNC)>= 1000000000 THEN CAST((ASSETSNC /1000000000) AS DECIMAL(18,2))
      ELSE CAST((ASSETSNC /1000000)  AS DECIMAL(18,2))  END) ASSETSNC
      ,(CASE WHEN  ABS(ASSETS)>= 1000000000 THEN CAST((ASSETS /1000000000) AS DECIMAL(18,2))
      ELSE CAST((ASSETS /1000000)  AS DECIMAL(18,2))  END) ASSETS

      ,'##' CurrLiabilities
      ,(CASE WHEN  ABS(payables)>= 1000000000 THEN CAST((payables /1000000000) AS DECIMAL(18,2))
      ELSE CAST((payables /1000000) AS DECIMAL(18,2))  END) payables
      ,(CASE WHEN  ABS(debtc)>= 1000000000 THEN CAST((debtc /1000000000) AS DECIMAL(18,2))
      ELSE CAST((debtc /1000000) AS DECIMAL(18,2))  END) debtc
      ,(CASE WHEN  ABS(LIABILITIESC-payables-debtc)>= 1000000000 THEN CAST(((LIABILITIESC-payables-debtc) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((LIABILITIESC-payables-debtc) /1000000) AS DECIMAL(18,2))  END) LIAB
       ,(CASE WHEN  ABS(LIABILITIESC)>= 1000000000 THEN CAST((LIABILITIESC /1000000000) AS DECIMAL(18,2))
      ELSE CAST((LIABILITIESC /1000000) AS DECIMAL(18,2))  END) LIABILITIESC
        ,'##' NonCurrLiabilities
        ,(CASE WHEN  ABS(debtnc)>= 1000000000 THEN CAST((debtnc /1000000000) AS DECIMAL(18,2))
      ELSE CAST((debtnc /1000000) AS DECIMAL(18,2))  END) debtnc
      ,(CASE WHEN  ABS(LIABILITIESNC-debtnc)>= 1000000000 THEN CAST(((LIABILITIESNC-debtnc) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((LIABILITIESNC-debtnc) /1000000) AS DECIMAL(18,2))  END) LIABO
      ,(CASE WHEN  ABS(LIABILITIESNC)>= 1000000000 THEN CAST((LIABILITIESNC /1000000000) AS DECIMAL(18,2))
      ELSE CAST((LIABILITIESNC /1000000) AS DECIMAL(18,2))  END) LIABILITIESNC
      ,(CASE WHEN  ABS(LIABILITIES)>= 1000000000 THEN CAST((LIABILITIES /1000000000) AS DECIMAL(18,2))
      ELSE CAST((LIABILITIES /1000000) AS DECIMAL(18,2))  END) LIABILITIES
      ,'##' Shequity
      --- Common Stock  equity - (retarn + accoci)
      ,(CASE WHEN  ABS(equity - (RETEARN + accoci))>= 1000000000 THEN CAST(((equity - (RETEARN + accoci)) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((equity - (RETEARN + accoci))/1000000) AS DECIMAL(18,2))  END) COMMONSTOCK
      ,(CASE WHEN  ABS(RETEARN)>= 1000000000 THEN CAST((RETEARN /1000000000) AS DECIMAL(18,2))
      ELSE CAST((RETEARN/1000000) AS DECIMAL(18,2))  END) RETEARN
      ,(CASE WHEN  ABS(accoci)>= 1000000000 THEN CAST((accoci /1000000000) AS DECIMAL(18,2))
      ELSE CAST((accoci/1000000) AS DECIMAL(18,2))  END) accoci
      ,(CASE WHEN  ABS(equityusd)>= 1000000000 THEN CAST((equityusd /1000000000) AS DECIMAL(18,2))
      ELSE CAST((equityusd/1000000) AS DECIMAL(18,2))  END) equityusd
      ,(CASE WHEN  ABS(equityusd+LIABILITIES)>= 1000000000 THEN CAST(((equityusd+LIABILITIES) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((equityusd+LIABILITIES) /1000000)  AS DECIMAL(18,2))  END) EQUITLIABILITIES
      FROM [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag]
      WHERE ID IN(SELECT ID  FROM (SELECT ROW_NUMBER() OVER (PARTITION BY [Ticker],CalendarDate ORDER BY [ReportPeriod] DESC ) AS RowNo,ID
             FROM [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag]  WHERE {% condition Symbol %} Ticker {% endcondition %} AND [dimension]='ARY' AND {% condition Datefilter %} ReportPeriod {% endcondition %} ) a WHERE RowNo=1)
      ORDER BY [ReportPeriod] DESC

      UNION ALL

      SELECT DISTINCT Top(10)[ReportPeriod] Period
      ,'##' [CurrAssets]
      ,[dimension]
           ,Ticker
           ,'Quarterly' as Frequency
      ,(CASE WHEN  ABS(CASHNEQUSD)>= 1000000000 THEN CAST((CASHNEQUSD /1000000000) AS DECIMAL(18,2))
      ELSE CAST((CASHNEQUSD /1000000) AS DECIMAL(18,2))  END) CASHNEQUSD
      ,(CASE WHEN  ABS(investmentsc)>= 1000000000 THEN CAST((investmentsc /1000000000) AS DECIMAL(18,2))
      ELSE CAST((investmentsc /1000000) AS DECIMAL(18,2))  END) investmentsc
      ,(CASE WHEN  ABS(RECEIVABLES)>= 1000000000 THEN CAST((RECEIVABLES /1000000000) AS DECIMAL(18,2))
      ELSE CAST((RECEIVABLES/1000000) AS DECIMAL(18,2))  END) RECEIVABLES
      ,(CASE WHEN  ABS(INVENTORY)>= 1000000000 THEN CAST((INVENTORY /1000000000) AS DECIMAL(18,2))
      ELSE CAST((INVENTORY/1000000) AS DECIMAL(18,2))  END) INVENTORY
     --- Other assets formula
      ,(CASE WHEN  ABS(ASSETSC-CASHNEQUSD-investmentsc-RECEIVABLES-INVENTORY)>= 1000000000 THEN CAST(((ASSETSC-CASHNEQUSD-investmentsc-RECEIVABLES-INVENTORY) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((ASSETSC-CASHNEQUSD-investmentsc-RECEIVABLES-INVENTORY)/1000000) AS DECIMAL(18,2))  END) ASSETSOC
      ,(CASE WHEN  ABS(ASSETSC)>= 1000000000 THEN CAST((ASSETSC /1000000000) AS DECIMAL(18,2))
      ELSE CAST((ASSETSC/1000000) AS DECIMAL(18,2))  END) ASSETSC

      ,'##' [NonCurrAssets]
      ,(CASE WHEN  ABS(investmentsnc)>= 1000000000 THEN CAST((investmentsnc /1000000000) AS DECIMAL(18,2))
      ELSE CAST((investmentsnc /1000000) AS DECIMAL(18,2))  END) investmentsnc
      ,(CASE WHEN  ABS(ppnenet)>= 1000000000 THEN CAST((ppnenet /1000000000) AS DECIMAL(18,2))
      ELSE CAST((ppnenet /1000000) AS DECIMAL(18,2))  END) ppnenet
      ,(CASE WHEN  ABS(INTANGIBLES)>= 1000000000 THEN CAST((INTANGIBLES /1000000000) AS DECIMAL(18,2))
      ELSE CAST((INTANGIBLES /1000000) AS DECIMAL(18,2))  END) INTANGIBLES
     --- Other assets formula
      ,(CASE WHEN  ABS(ASSETSNC-INTANGIBLES-ppnenet-investmentsnc)>= 1000000000 THEN CAST(((ASSETSNC-INTANGIBLES-ppnenet-investmentsnc) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((ASSETSNC-INTANGIBLES-ppnenet-investmentsnc) /1000000)  AS DECIMAL(18,2))  END) ASSETSNOC
      ,(CASE WHEN  ABS(ASSETSNC)>= 1000000000 THEN CAST((ASSETSNC /1000000000) AS DECIMAL(18,2))
      ELSE CAST((ASSETSNC /1000000)  AS DECIMAL(18,2))  END) ASSETSNC
      ,(CASE WHEN  ABS(ASSETS)>= 1000000000 THEN CAST((ASSETS /1000000000) AS DECIMAL(18,2))
      ELSE CAST((ASSETS /1000000)  AS DECIMAL(18,2))  END) ASSETS

      ,'##' CurrLiabilities
      ,(CASE WHEN  ABS(payables)>= 1000000000 THEN CAST((payables /1000000000) AS DECIMAL(18,2))
      ELSE CAST((payables /1000000) AS DECIMAL(18,2))  END) payables
      ,(CASE WHEN  ABS(debtc)>= 1000000000 THEN CAST((debtc /1000000000) AS DECIMAL(18,2))
      ELSE CAST((debtc /1000000) AS DECIMAL(18,2))  END) debtc
      ,(CASE WHEN  ABS(LIABILITIESC-payables-debtc)>= 1000000000 THEN CAST(((LIABILITIESC-payables-debtc) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((LIABILITIESC-payables-debtc) /1000000) AS DECIMAL(18,2))  END) LIAB
       ,(CASE WHEN  ABS(LIABILITIESC)>= 1000000000 THEN CAST((LIABILITIESC /1000000000) AS DECIMAL(18,2))
      ELSE CAST((LIABILITIESC /1000000) AS DECIMAL(18,2))  END) LIABILITIESC
        ,'##' NonCurrLiabilities
        ,(CASE WHEN  ABS(debtnc)>= 1000000000 THEN CAST((debtnc /1000000000) AS DECIMAL(18,2))
      ELSE CAST((debtnc /1000000) AS DECIMAL(18,2))  END) debtnc
      ,(CASE WHEN  ABS(LIABILITIESNC-debtnc)>= 1000000000 THEN CAST(((LIABILITIESNC-debtnc) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((LIABILITIESNC-debtnc) /1000000) AS DECIMAL(18,2))  END) LIABO
      ,(CASE WHEN  ABS(LIABILITIESNC)>= 1000000000 THEN CAST((LIABILITIESNC /1000000000) AS DECIMAL(18,2))
      ELSE CAST((LIABILITIESNC /1000000) AS DECIMAL(18,2))  END) LIABILITIESNC
      ,(CASE WHEN  ABS(LIABILITIES)>= 1000000000 THEN CAST((LIABILITIES /1000000000) AS DECIMAL(18,2))
      ELSE CAST((LIABILITIES /1000000) AS DECIMAL(18,2))  END) LIABILITIES
      ,'##' Shequity
      --- Common Stock  equity - (retarn + accoci)
      ,(CASE WHEN  ABS(equity - (RETEARN + accoci))>= 1000000000 THEN CAST(((equity - (RETEARN + accoci)) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((equity - (RETEARN + accoci))/1000000) AS DECIMAL(18,2))  END) COMMONSTOCK
      ,(CASE WHEN  ABS(RETEARN)>= 1000000000 THEN CAST((RETEARN /1000000000) AS DECIMAL(18,2))
      ELSE CAST((RETEARN/1000000) AS DECIMAL(18,2))  END) RETEARN
      ,(CASE WHEN  ABS(accoci)>= 1000000000 THEN CAST((accoci /1000000000) AS DECIMAL(18,2))
      ELSE CAST((accoci/1000000) AS DECIMAL(18,2))  END) accoci
      ,(CASE WHEN  ABS(equityusd)>= 1000000000 THEN CAST((equityusd /1000000000) AS DECIMAL(18,2))
      ELSE CAST((equityusd/1000000) AS DECIMAL(18,2))  END) equityusd
      ,(CASE WHEN  ABS(equityusd+LIABILITIES)>= 1000000000 THEN CAST(((equityusd+LIABILITIES) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((equityusd+LIABILITIES) /1000000)  AS DECIMAL(18,2))  END) EQUITLIABILITIES
      FROM [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag]
      WHERE ID IN(SELECT ID  FROM (SELECT ROW_NUMBER() OVER (PARTITION BY [Ticker],CalendarDate ORDER BY [ReportPeriod] DESC ) AS RowNo,ID
             FROM [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag]  WHERE {% condition Symbol %} Ticker {% endcondition %} AND [dimension]='ARQ' AND {% condition Datefilter %} ReportPeriod {% endcondition %} ) a WHERE RowNo=1)
      ORDER BY [ReportPeriod] DESC

      UNION ALL

      SELECT DISTINCT Top(10)[ReportPeriod] Period
      ,'##' [CurrAssets]
      ,[dimension]
           ,Ticker
           ,'TTM' as Frequency
      ,(CASE WHEN  ABS(CASHNEQUSD)>= 1000000000 THEN CAST((CASHNEQUSD /1000000000) AS DECIMAL(18,2))
      ELSE CAST((CASHNEQUSD /1000000) AS DECIMAL(18,2))  END) CASHNEQUSD
      ,(CASE WHEN  ABS(investmentsc)>= 1000000000 THEN CAST((investmentsc /1000000000) AS DECIMAL(18,2))
      ELSE CAST((investmentsc /1000000) AS DECIMAL(18,2))  END) investmentsc
      ,(CASE WHEN  ABS(RECEIVABLES)>= 1000000000 THEN CAST((RECEIVABLES /1000000000) AS DECIMAL(18,2))
      ELSE CAST((RECEIVABLES/1000000) AS DECIMAL(18,2))  END) RECEIVABLES
      ,(CASE WHEN  ABS(INVENTORY)>= 1000000000 THEN CAST((INVENTORY /1000000000) AS DECIMAL(18,2))
      ELSE CAST((INVENTORY/1000000) AS DECIMAL(18,2))  END) INVENTORY
     --- Other assets formula
      ,(CASE WHEN  ABS(ASSETSC-CASHNEQUSD-investmentsc-RECEIVABLES-INVENTORY)>= 1000000000 THEN CAST(((ASSETSC-CASHNEQUSD-investmentsc-RECEIVABLES-INVENTORY) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((ASSETSC-CASHNEQUSD-investmentsc-RECEIVABLES-INVENTORY)/1000000) AS DECIMAL(18,2))  END) ASSETSOC
      ,(CASE WHEN  ABS(ASSETSC)>= 1000000000 THEN CAST((ASSETSC /1000000000) AS DECIMAL(18,2))
      ELSE CAST((ASSETSC/1000000) AS DECIMAL(18,2))  END) ASSETSC

      ,'##' [NonCurrAssets]
      ,(CASE WHEN  ABS(investmentsnc)>= 1000000000 THEN CAST((investmentsnc /1000000000) AS DECIMAL(18,2))
      ELSE CAST((investmentsnc /1000000) AS DECIMAL(18,2))  END) investmentsnc
      ,(CASE WHEN  ABS(ppnenet)>= 1000000000 THEN CAST((ppnenet /1000000000) AS DECIMAL(18,2))
      ELSE CAST((ppnenet /1000000) AS DECIMAL(18,2))  END) ppnenet
      ,(CASE WHEN  ABS(INTANGIBLES)>= 1000000000 THEN CAST((INTANGIBLES /1000000000) AS DECIMAL(18,2))
      ELSE CAST((INTANGIBLES /1000000) AS DECIMAL(18,2))  END) INTANGIBLES
     --- Other assets formula
      ,(CASE WHEN  ABS(ASSETSNC-INTANGIBLES-ppnenet-investmentsnc)>= 1000000000 THEN CAST(((ASSETSNC-INTANGIBLES-ppnenet-investmentsnc) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((ASSETSNC-INTANGIBLES-ppnenet-investmentsnc) /1000000)  AS DECIMAL(18,2))  END) ASSETSNOC
      ,(CASE WHEN  ABS(ASSETSNC)>= 1000000000 THEN CAST((ASSETSNC /1000000000) AS DECIMAL(18,2))
      ELSE CAST((ASSETSNC /1000000)  AS DECIMAL(18,2))  END) ASSETSNC
      ,(CASE WHEN  ABS(ASSETS)>= 1000000000 THEN CAST((ASSETS /1000000000) AS DECIMAL(18,2))
      ELSE CAST((ASSETS /1000000)  AS DECIMAL(18,2))  END) ASSETS

      ,'##' CurrLiabilities
      ,(CASE WHEN  ABS(payables)>= 1000000000 THEN CAST((payables /1000000000) AS DECIMAL(18,2))
      ELSE CAST((payables /1000000) AS DECIMAL(18,2))  END) payables
      ,(CASE WHEN  ABS(debtc)>= 1000000000 THEN CAST((debtc /1000000000) AS DECIMAL(18,2))
      ELSE CAST((debtc /1000000) AS DECIMAL(18,2))  END) debtc
      ,(CASE WHEN  ABS(LIABILITIESC-payables-debtc)>= 1000000000 THEN CAST(((LIABILITIESC-payables-debtc) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((LIABILITIESC-payables-debtc) /1000000) AS DECIMAL(18,2))  END) LIAB
       ,(CASE WHEN  ABS(LIABILITIESC)>= 1000000000 THEN CAST((LIABILITIESC /1000000000) AS DECIMAL(18,2))
      ELSE CAST((LIABILITIESC /1000000) AS DECIMAL(18,2))  END) LIABILITIESC
        ,'##' NonCurrLiabilities
        ,(CASE WHEN  ABS(debtnc)>= 1000000000 THEN CAST((debtnc /1000000000) AS DECIMAL(18,2))
      ELSE CAST((debtnc /1000000) AS DECIMAL(18,2))  END) debtnc
      ,(CASE WHEN  ABS(LIABILITIESNC-debtnc)>= 1000000000 THEN CAST(((LIABILITIESNC-debtnc) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((LIABILITIESNC-debtnc) /1000000) AS DECIMAL(18,2))  END) LIABO
      ,(CASE WHEN  ABS(LIABILITIESNC)>= 1000000000 THEN CAST((LIABILITIESNC /1000000000) AS DECIMAL(18,2))
      ELSE CAST((LIABILITIESNC /1000000) AS DECIMAL(18,2))  END) LIABILITIESNC
      ,(CASE WHEN  ABS(LIABILITIES)>= 1000000000 THEN CAST((LIABILITIES /1000000000) AS DECIMAL(18,2))
      ELSE CAST((LIABILITIES /1000000) AS DECIMAL(18,2))  END) LIABILITIES
      ,'##' Shequity
      --- Common Stock  equity - (retarn + accoci)
      ,(CASE WHEN  ABS(equity - (RETEARN + accoci))>= 1000000000 THEN CAST(((equity - (RETEARN + accoci)) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((equity - (RETEARN + accoci))/1000000) AS DECIMAL(18,2))  END) COMMONSTOCK
      ,(CASE WHEN  ABS(RETEARN)>= 1000000000 THEN CAST((RETEARN /1000000000) AS DECIMAL(18,2))
      ELSE CAST((RETEARN/1000000) AS DECIMAL(18,2))  END) RETEARN
      ,(CASE WHEN  ABS(accoci)>= 1000000000 THEN CAST((accoci /1000000000) AS DECIMAL(18,2))
      ELSE CAST((accoci/1000000) AS DECIMAL(18,2))  END) accoci
      ,(CASE WHEN  ABS(equityusd)>= 1000000000 THEN CAST((equityusd /1000000000) AS DECIMAL(18,2))
      ELSE CAST((equityusd/1000000) AS DECIMAL(18,2))  END) equityusd
      ,(CASE WHEN  ABS(equityusd+LIABILITIES)>= 1000000000 THEN CAST(((equityusd+LIABILITIES) /1000000000) AS DECIMAL(18,2))
      ELSE CAST(((equityusd+LIABILITIES) /1000000)  AS DECIMAL(18,2))  END) EQUITLIABILITIES
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

  dimension: curr_assets {
    type: string
    sql: ${TABLE}.CurrAssets ;;
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

  dimension: cashnequsd {
    type: number
    sql: ${TABLE}.CASHNEQUSD ;;
  }

  dimension: investmentsc {
    type: number
    sql: ${TABLE}.investmentsc ;;
  }

  dimension: receivables {
    type: number
    sql: ${TABLE}.RECEIVABLES ;;
  }

  dimension: inventory {
    type: number
    sql: ${TABLE}.INVENTORY ;;
  }

  dimension: assetsoc {
    type: number
    sql: ${TABLE}.ASSETSOC ;;
  }

  dimension: assetsc {
    type: number
    sql: ${TABLE}.ASSETSC ;;
  }

  dimension: non_curr_assets {
    type: string
    sql: ${TABLE}.NonCurrAssets ;;
  }

  dimension: investmentsnc {
    type: number
    sql: ${TABLE}.investmentsnc ;;
  }

  dimension: ppnenet {
    type: number
    sql: ${TABLE}.ppnenet ;;
  }

  dimension: intangibles {
    type: number
    sql: ${TABLE}.INTANGIBLES ;;
  }

  dimension: assetsnoc {
    type: number
    sql: ${TABLE}.ASSETSNOC ;;
  }

  dimension: assetsnc {
    type: number
    sql: ${TABLE}.ASSETSNC ;;
  }

  dimension: assets {
    type: number
    sql: ${TABLE}.ASSETS ;;
  }

  dimension: curr_liabilities {
    type: string
    sql: ${TABLE}.CurrLiabilities ;;
  }

  dimension: payables {
    type: number
    sql: ${TABLE}.payables ;;
  }

  dimension: debtc {
    type: number
    sql: ${TABLE}.debtc ;;
  }

  dimension: liab {
    type: number
    sql: ${TABLE}.LIAB ;;
  }

  dimension: liabilitiesc {
    type: number
    sql: ${TABLE}.LIABILITIESC ;;
  }

  dimension: non_curr_liabilities {
    type: string
    sql: ${TABLE}.NonCurrLiabilities ;;
  }

  dimension: debtnc {
    type: number
    sql: ${TABLE}.debtnc ;;
  }

  dimension: liabo {
    type: number
    sql: ${TABLE}.LIABO ;;
  }

  dimension: liabilitiesnc {
    type: number
    sql: ${TABLE}.LIABILITIESNC ;;
  }

  dimension: liabilities {
    type: number
    sql: ${TABLE}.LIABILITIES ;;
  }

  dimension: shequity {
    type: string
    sql: ${TABLE}.Shequity ;;
  }

  dimension: commonstock {
    type: number
    sql: ${TABLE}.COMMONSTOCK ;;
  }

  dimension: retearn {
    type: number
    sql: ${TABLE}.RETEARN ;;
  }

  dimension: accoci {
    type: number
    sql: ${TABLE}.accoci ;;
  }

  dimension: equityusd {
    type: number
    sql: ${TABLE}.equityusd ;;
  }

  dimension: equitliabilities {
    type: number
    sql: ${TABLE}.EQUITLIABILITIES ;;
  }

  set: detail {
    fields: [
      period,
      curr_assets,
      dimension,
      ticker,
      frequency,
      cashnequsd,
      investmentsc,
      receivables,
      inventory,
      assetsoc,
      assetsc,
      non_curr_assets,
      investmentsnc,
      ppnenet,
      intangibles,
      assetsnoc,
      assetsnc,
      assets,
      curr_liabilities,
      payables,
      debtc,
      liab,
      liabilitiesc,
      non_curr_liabilities,
      debtnc,
      liabo,
      liabilitiesnc,
      liabilities,
      shequity,
      commonstock,
      retearn,
      accoci,
      equityusd,
      equitliabilities
    ]
  }
}
