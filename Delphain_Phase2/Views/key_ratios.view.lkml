view: key_ratios {
  derived_table: {
    sql: Select * from
      ( SELECT DISTINCT Top(16)[ReportPeriod] Period
                    ,'##' [Liquidity]
                    ,[dimension]
                          ,Ticker
                          ,'Quarterly' as Frequency
                    ,CAST(CURRENTRATIO AS decimal(18,2)) CURRENTRATIO,
                    (CASE WHEN liabilitiesc <> 0 THEN CAST((assetsc-Inventory)/liabilitiesc  AS  decimal(18,2)) ELSE 0 END) QUICKRATIO,
                    (CASE WHEN liabilitiesc <> 0 THEN CAST((cashneq+investmentsc)/liabilitiesc  AS  decimal(18,2)) ELSE 0 END) CASHRATIO,
                    '##' [Efficiency]
                    ,CAST(ASSETTURNOVER AS decimal(18,2)) ASSETTURNOVER
                    ,(CASE WHEN inventory <> 0 THEN CAST((cor)/inventory  AS  decimal(18,2)) ELSE 0 END) INVENTORYTURNOVER
                    ,(CASE WHEN cor <> 0 THEN CAST(((inventory)/cor)*92  AS  decimal(18,2)) ELSE 0 END) DAYSALEINVENTORY
                   ,CAST(SPS AS decimal(18,2)) SPS
                    ,'##' [Profitability]
                    ,CASE WHEN  REVENUEUSD<> 0 THEN cast((GP/REVENUEUSD)*100 AS DECIMAL(18,2)) END as GROSSMARGIN
                    ,(CASE WHEN  ABS(((GP-RND)-(SGNA)))>= 1000000000 THEN CAST((((GP-RND)-(SGNA)) /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((((GP-RND)-(SGNA))/1000000) AS DECIMAL(18,2))  END)  AS OperatingProfit
                    ,CAST(EBITDAMARGIN*100 AS decimal(18,2)) EBITDAMARGIN,
                    CAST(NETMARGIN*100 AS decimal(18,2))  NETMARGIN,
                    CAST(ROA*100 AS decimal(18,2))  ROA,
                    CAST(ROE*100 AS decimal(18,2))  ROE,
                    CAST(ROIC*100 AS decimal(18,2))  ROIC,
                    CAST(ROS*100 AS decimal(18,2))  ROS
                    ,'##' [Valuation]
                   ,CAST(BVPS AS decimal(18,2)) BVPS
                    ,(CASE WHEN  ABS(EV)>= 1000000000 THEN CAST((EV /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((EV/1000000)  AS DECIMAL(18,2)) END) EV
                    ,CAST(EVEBITDA AS decimal(18,2)) EVEBITDA,
                    CAST(FCFPS AS decimal(18,2)) FCFPS,
                    CAST(PB AS decimal(18,2)) PB,
                    CAST(PE AS decimal(18,2)) PE,
                    CAST(PE1 AS decimal(18,2)) PE1,
                    CAST(PS AS decimal(18,2)) PS,
                    CAST(PS1 AS decimal(18,2)) PS1
                   ,(CASE WHEN  ABS(TANGIBLES)>= 1000000000 THEN CAST((TANGIBLES /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((TANGIBLES /1000000) AS DECIMAL(18,2))  END) TANGIBLES
                    ,CAST(TBVPS AS decimal(18,2)) TBVPS
                    ,'##' [Capital_Structure]
                    ,CAST(DE AS decimal(18,2)) DE
                    ,CASE WHEN  assets<> 0 THEN CAST((debt/assets) AS DECIMAL(18,2)) END  DEBTASSETS
                    ,CASE WHEN  equityavg<> 0 THEN CAST((liabilities/equityavg) AS DECIMAL(18,2)) END  CAPITALRATIO
                    ,CASE WHEN  intexp<> 0 THEN CAST((ebit/intexp) AS DECIMAL(18,2)) END  TIMESRATIO
                    ,CASE WHEN  equityavg<> 0 THEN CAST((assetsavg/equityavg) AS DECIMAL(18,2)) END  EQITYMULTIPLIER
                    ,(CASE WHEN  ABS(INVCAP)>= 1000000000 THEN CAST((INVCAP /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((INVCAP /1000000) AS DECIMAL(18,2))  END) INVCAP
                    ,(CASE WHEN  ABS(WORKINGCAPITAL)>= 1000000000 THEN CAST((WORKINGCAPITAL /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((WORKINGCAPITAL /1000000) AS DECIMAL(18,2)) END) WORKINGCAPITAL
                    ,'##' [Other_Metrics]
                   , CAST(DIVYIELD*100 AS decimal(18,2))  DIVYIELD,
                    CAST(EVEBIT AS decimal(18,2)) EVEBIT,
                    CAST(FXUSD AS decimal(18,2)) FXUSD
                    ,(CASE WHEN  ABS(MARKETCAP)>= 1000000000 THEN CAST((MARKETCAP /1000000000) AS DECIMAL(18,2))
                    ELSE CAST((MARKETCAP /1000000) AS DECIMAL(18,2))  END) MARKETCAP
                    ,CAST(PAYOUTRATIO*100 AS decimal(18,2))  PAYOUTRATIO
                    FROM [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag]
                    WHERE ID IN(SELECT ID  FROM (SELECT ROW_NUMBER() OVER (PARTITION BY [Ticker],CalendarDate ORDER BY [ReportPeriod] DESC ) AS RowNo,ID
                   FROM [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag]
                  WHERE Ticker =COALESCE(NULLIF({% parameter symb %},'NULL'), (select top 1 symbol from Stock_Quotes_Adj where symbol not in ('SPX','NDX') and [Date]='20200722' order by [Close] desc))
                  AND [dimension]='ARQ' AND ReportPeriod <='20200603' ) a WHERE RowNo=1)
                    ORDER BY [ReportPeriod] DESC) ABC
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

  dimension: period {
    type: date
    sql: ${TABLE}.Period ;;
  }

  dimension: liquidity {
    type: string
    sql: ${TABLE}.Liquidity ;;
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

  dimension: currentratio {
    type: number
    sql: ${TABLE}.CURRENTRATIO ;;
  }

  dimension: quickratio {
    type: number
    sql: ${TABLE}.QUICKRATIO ;;
  }

  dimension: cashratio {
    type: number
    sql: ${TABLE}.CASHRATIO ;;
  }

  dimension: efficiency {
    type: string
    sql: ${TABLE}.Efficiency ;;
  }

  dimension: assetturnover {
    type: number
    sql: ${TABLE}.ASSETTURNOVER ;;
  }

  dimension: inventoryturnover {
    type: number
    sql: ${TABLE}.INVENTORYTURNOVER ;;
  }

  dimension: daysaleinventory {
    type: number
    sql: ${TABLE}.DAYSALEINVENTORY ;;
  }

  dimension: sps {
    type: number
    sql: ${TABLE}.SPS ;;
  }

  dimension: profitability {
    type: string
    sql: ${TABLE}.Profitability ;;
  }

  dimension: grossmargin {
    type: number
    sql: ${TABLE}.GROSSMARGIN ;;
  }

  dimension: operating_profit {
    type: number
    sql: ${TABLE}.OperatingProfit ;;
  }

  dimension: ebitdamargin {
    type: number
    sql: ${TABLE}.EBITDAMARGIN ;;
  }

  dimension: netmargin {
    type: number
    sql: ${TABLE}.NETMARGIN ;;
  }

  dimension: roa {
    type: number
    sql: ${TABLE}.ROA ;;
  }

  dimension: roe {
    type: number
    sql: ${TABLE}.ROE ;;
  }

  dimension: roic {
    type: number
    sql: ${TABLE}.ROIC ;;
  }

  dimension: ros {
    type: number
    sql: ${TABLE}.ROS ;;
  }

  dimension: valuation {
    type: string
    sql: ${TABLE}.Valuation ;;
  }

  dimension: bvps {
    type: number
    sql: ${TABLE}.BVPS ;;
  }

  dimension: ev {
    type: number
    sql: ${TABLE}.EV ;;
  }

  dimension: evebitda {
    type: number
    sql: ${TABLE}.EVEBITDA ;;
  }

  dimension: fcfps {
    type: number
    sql: ${TABLE}.FCFPS ;;
  }

  dimension: pb {
    type: number
    sql: ${TABLE}.PB ;;
  }

  dimension: pe {
    type: number
    sql: ${TABLE}.PE ;;
  }

  dimension: pe1 {
    type: number
    sql: ${TABLE}.PE1 ;;
  }

  dimension: ps {
    type: number
    sql: ${TABLE}.PS ;;
  }

  dimension: ps1 {
    type: number
    sql: ${TABLE}.PS1 ;;
  }

  dimension: tangibles {
    type: number
    sql: ${TABLE}.TANGIBLES ;;
  }

  dimension: tbvps {
    type: number
    sql: ${TABLE}.TBVPS ;;
  }

  dimension: capital_structure {
    type: string
    sql: ${TABLE}.Capital_Structure ;;
  }

  dimension: de {
    type: number
    sql: ${TABLE}.DE ;;
  }

  dimension: debtassets {
    type: number
    sql: ${TABLE}.DEBTASSETS ;;
  }

  dimension: capitalratio {
    type: number
    sql: ${TABLE}.CAPITALRATIO ;;
  }

  dimension: timesratio {
    type: number
    sql: ${TABLE}.TIMESRATIO ;;
  }

  dimension: eqitymultiplier {
    type: number
    sql: ${TABLE}.EQITYMULTIPLIER ;;
  }

  dimension: invcap {
    type: number
    sql: ${TABLE}.INVCAP ;;
  }

  dimension: workingcapital {
    type: number
    sql: ${TABLE}.WORKINGCAPITAL ;;
  }

  dimension: other_metrics {
    type: string
    sql: ${TABLE}.Other_Metrics ;;
  }

  dimension: divyield {
    type: number
    sql: ${TABLE}.DIVYIELD ;;
  }

  dimension: evebit {
    type: number
    sql: ${TABLE}.EVEBIT ;;
  }

  dimension: fxusd {
    type: number
    sql: ${TABLE}.FXUSD ;;
  }

  dimension: marketcap {
    type: number
    sql: ${TABLE}.MARKETCAP ;;
  }

  dimension: payoutratio {
    type: number
    sql: ${TABLE}.PAYOUTRATIO ;;
  }

  set: detail {
    fields: [
      period,
      liquidity,
      dimension,
      ticker,
      frequency,
      currentratio,
      quickratio,
      cashratio,
      efficiency,
      assetturnover,
      inventoryturnover,
      daysaleinventory,
      sps,
      profitability,
      grossmargin,
      operating_profit,
      ebitdamargin,
      netmargin,
      roa,
      roe,
      roic,
      ros,
      valuation,
      bvps,
      ev,
      evebitda,
      fcfps,
      pb,
      pe,
      pe1,
      ps,
      ps1,
      tangibles,
      tbvps,
      capital_structure,
      de,
      debtassets,
      capitalratio,
      timesratio,
      eqitymultiplier,
      invcap,
      workingcapital,
      other_metrics,
      divyield,
      evebit,
      fxusd,
      marketcap,
      payoutratio
    ]
  }
}
