view: get_user_dashboard_data {
  derived_table: {
    sql: SELECT ss.[STOCK SYMBOL]
      ,ss.[Company Name]
      ,sqa.CurrClose
      ,tmc.SymState as Current_state
    ,CASE  WHEN tmc.SymState in (1,3,5,7) THEN 'Bullish'
           WHEN tmc.SymState in (2,4,6,8) THEN 'Bearish'
    END AS SymState
    ,CASE WHEN tmc.SymState = 1 THEN tsa.AVG_ST1
      WHEN tmc.SymState = 2 THEN tsa.AVG_ST2
      WHEN tmc.SymState = 3 THEN tsa.AVG_ST3
      WHEN tmc.SymState = 4 THEN tsa.AVG_ST4
      WHEN tmc.SymState = 5 THEN tsa.AVG_ST5
      WHEN tmc.SymState = 6 THEN tsa.AVG_ST6
      WHEN tmc.SymState = 7 THEN tsa.AVG_ST7
      WHEN tmc.SymState = 8 THEN tsa.AVG_ST8
    END AS Average_Days,
       CASE WHEN tmc.SymState = 1 THEN tsa.AVGMOV_R_ST1
      WHEN tmc.SymState = 2 THEN tsa.AVGMOV_R_ST2
      WHEN tmc.SymState = 3 THEN tsa.AVGMOV_R_ST3
      WHEN tmc.SymState = 4 THEN tsa.AVGMOV_R_ST4
      WHEN tmc.SymState = 5 THEN tsa.AVGMOV_R_ST5
      WHEN tmc.SymState = 6 THEN tsa.AVGMOV_R_ST6
      WHEN tmc.SymState = 7 THEN tsa.AVGMOV_R_ST7
      WHEN tmc.SymState = 8 THEN tsa.AVGMOV_R_ST8
    END AS Average_Move
      ,tmca.LastEntryDate
      ,sqaa.PriceOnEntryStateDate
      ,CASE WHEN sqaa.PriceOnEntryStateDate>0 THEN (((sqa.CurrClose-sqaa.PriceOnEntryStateDate)/sqaa.PriceOnEntryStateDate) * 100) ELSE 0
      END as current_move

FROM

(SELECT [STOCK SYMBOL],
[Company Name]
FROM STOCK_SYMBOLS) ss

LEFT OUTER JOIN
(SELECT Symbol,[Date],[close] AS CurrClose
from Stock_Quotes_Adj
where [Date] =   {% parameter dte %} ) sqa
ON ss.[STOCK SYMBOL] = sqa.Symbol

LEFT OUTER JOIN
(SELECT Symbol,
       RIGHT((Case when [50MA_200MA] ='Bullish' AND [20MA_100MA] = 'Bullish' AND [10MA_30MA]  = 'Bullish' THEN 'State_1'
    when [50MA_200MA] = 'Bullish' AND [20MA_100MA]= 'Bullish' AND [10MA_30MA] = 'Bearish' THEN 'State_2'
    when [50MA_200MA] ='Bullish' AND [20MA_100MA]= 'Bearish' AND [10MA_30MA] = 'Bullish' THEN 'State_3'
    when [50MA_200MA] ='Bullish' AND [20MA_100MA]= 'Bearish' AND [10MA_30MA] = 'Bearish' THEN 'State_4'
    when [50MA_200MA] ='Bearish' AND [20MA_100MA]= 'Bullish' AND [10MA_30MA] = 'Bullish' THEN 'State_5'
    when [50MA_200MA] ='Bearish' AND [20MA_100MA]= 'Bullish' AND [10MA_30MA] = 'Bearish' THEN 'State_6'
    when [50MA_200MA] ='Bearish' AND [20MA_100MA]= 'Bearish' AND [10MA_30MA] = 'Bullish' THEN 'State_7'
    when [50MA_200MA] ='Bearish' AND [20MA_100MA]= 'Bearish' AND [10MA_30MA] = 'Bearish' THEN 'State_8'
     END),1)  as SymState
from tbl_Market_Condition
WHERE Mrk_Dte = {% parameter dte %}
AND MAType = 'EMA' ) tmc
ON ss.[STOCK SYMBOL] = tmc.Symbol

LEFT OUTER JOIN
(SELECT TOP(1) Symbol
       ,Mrk_Dte as LastEntryDate
       ,[State]
FROM    tbl_Market_condition
WHERE   Trans_Flag= 'Y'
and     Mrk_Dte <= {% parameter dte %}
and    Symbol   = {% parameter sym %}
GROUP BY Symbol
       ,Mrk_Dte
       ,[State]
ORDER BY Mrk_Dte DESC ) tmca
ON tmc.SymState=RIGHT(tmca.[State],1)

LEFT OUTER JOIN
(SELECT Symbol,
       [Date],
       [close] as PriceOnEntryStateDate
from Stock_Quotes_Adj
WHERE Symbol = {% parameter sym %} ) sqaa
ON sqaa.[Date] = tmca.LastEntryDate

left outer join
(SELECT TOP(1) Symbol,
                AVG_ST1,
                AVG_ST2,
                AVG_ST3,
                AVG_ST4,
                AVG_ST5,
                AVG_ST6,
                AVG_ST7,
                AVG_ST8,
              AVGMOV_R_ST1,
              AVGMOV_R_ST2,
              AVGMOV_R_ST3,
              AVGMOV_R_ST4,
              AVGMOV_R_ST5,
              AVGMOV_R_ST6,
              AVGMOV_R_ST7,
              AVGMOV_R_ST8
  FROM tbl_State_Analysis
  WHERE Symbol= {% parameter sym %}
  AND Mrk_Dte <= {% parameter dte %}
  Order by Mrk_Dte DESC ) tsa
  on sqaa.Symbol=tsa.Symbol

WHERE ss.[STOCK SYMBOL] = {% parameter sym %}
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: sym {
  type: string
  }

  parameter: dte {
    type: date
  }

  dimension: stock_symbol {
    type: string
    label: "STOCK SYMBOL"
    sql: ${TABLE}."STOCK SYMBOL" ;;
  }

  dimension: company_name {
    type: string
    label: "Company Name"
    sql: ${TABLE}."Company Name" ;;
  }

  dimension: curr_close {
    type: number
    sql: ${TABLE}.CurrClose ;;
  }

  dimension: current_state {
    type: string
    sql: ${TABLE}.Current_state ;;
  }

  dimension: sym_state {
    type: string
    sql: ${TABLE}.SymState ;;
  }

  dimension: average_days {
    type: number
    sql: ${TABLE}.Average_Days ;;
  }

  dimension: average_move {
    type: number
    sql: ${TABLE}.Average_Move ;;
  }

  dimension: last_entry_date {
    type: date
    sql: ${TABLE}.LastEntryDate ;;
  }

  dimension: price_on_entry_state_date {
    type: number
    sql: ${TABLE}.PriceOnEntryStateDate ;;
  }

  dimension: current_move {
    type: number
    sql: ${TABLE}.current_move ;;
  }

  set: detail {
    fields: [
      stock_symbol,
      company_name,
      curr_close,
      current_state,
      sym_state,
      average_days,
      average_move,
      last_entry_date,
      price_on_entry_state_date,
      current_move
    ]
  }
}
