view: get_state_analysis {
  derived_table: {
    sql: SELECT  top (1)        a.Symbol ,
                       c.[close] as Enter_Price,
        Case when b.CurrState ='1' then ROUND(ST1_TP_1,2)
             when b.CurrState ='2' then ROUND(ST2_TP_1,2)
           when b.CurrState ='3' then ROUND(ST3_TP_1,2)
           when b.CurrState ='4' then ROUND(ST4_TP_1,2)
           when b.CurrState ='5' then ROUND(ST5_TP_1,2)
           when b.CurrState ='6' then ROUND(ST6_TP_1,2)
           when b.CurrState ='7' then ROUND(ST7_TP_1,2)
           when b.CurrState ='8' then ROUND(ST8_TP_1,2)
        end   as 'Target 1',
            case when b.CurrState ='1' then ROUND(ST1_TP_2,2)
             when b.CurrState ='2' then ROUND(ST2_TP_2,2)
           when b.CurrState ='3' then ROUND(ST3_TP_2,2)
           when b.CurrState ='4' then ROUND(ST4_TP_2,2)
           when b.CurrState ='5' then ROUND(ST5_TP_2,2)
           when b.CurrState ='6' then ROUND(ST6_TP_2,2)
           when b.CurrState ='7' then ROUND(ST7_TP_2,2)
           when b.CurrState ='8' then ROUND(ST8_TP_2,2)
        end   as 'Target 2',
        Case when b.CurrState ='1' then ROUND(ST1_TP_3,2)
             when b.CurrState ='2' then ROUND(ST2_TP_3,2)
           when b.CurrState ='3' then ROUND(ST3_TP_3,2)
           when b.CurrState ='4' then ROUND(ST4_TP_3,2)
           when b.CurrState ='5' then ROUND(ST5_TP_3,2)
           when b.CurrState ='6' then ROUND(ST6_TP_3,2)
           when b.CurrState ='7' then ROUND(ST7_TP_3,2)
           when b.CurrState ='8' then ROUND(ST8_TP_3,2)
        end   as 'Target 3',
        Case when b.CurrState ='1' then ROUND(ST1_SL_1,2)
             when b.CurrState ='2' then ROUND(ST2_SL_1,2)
           when b.CurrState ='3' then ROUND(ST3_SL_1,2)
           when b.CurrState ='4' then ROUND(ST4_SL_1,2)
           when b.CurrState ='5' then ROUND(ST5_SL_1,2)
           when b.CurrState ='6' then ROUND(ST5_SL_1,2)
           when b.CurrState ='7' then ROUND(ST7_SL_1,2)
           when b.CurrState ='8' then ROUND(ST8_SL_1,2)
        end   as 'Stop loss 1',
        Case when b.CurrState ='1' then ROUND(ST1_SL_2,2)
             when b.CurrState ='2' then ROUND(ST2_SL_2,2)
           when b.CurrState ='3' then ROUND(ST3_SL_2,2)
           when b.CurrState ='4' then ROUND(ST4_SL_2,2)
           when b.CurrState ='5' then ROUND(ST5_SL_2,2)
           when b.CurrState ='6' then ROUND(ST5_SL_2,2)
           when b.CurrState ='7' then ROUND(ST7_SL_2,2)
           when b.CurrState ='8' then ROUND(ST8_SL_2,2)
        end   as 'Stop loss 2',
        Case when b.CurrState ='1' then ROUND(ST1_SL_3,2)
             when b.CurrState ='2' then ROUND(ST2_SL_3,2)
           when b.CurrState ='3' then ROUND(ST3_SL_3,2)
           when b.CurrState ='4' then ROUND(ST4_SL_3,2)
           when b.CurrState ='5' then ROUND(ST5_SL_3,2)
           when b.CurrState ='6' then ROUND(ST5_SL_3,2)
           when b.CurrState ='7' then ROUND(ST7_SL_3,2)
           when b.CurrState ='8' then ROUND(ST8_SL_3,2)
        end   as 'Stop loss 3'

from tbl_State_Analysis a
left outer join (
SELECT   TOP(1)   Symbol,
           Mrk_Dte,
       MAType,
       Trans_Flag,
           Right((Case when [50MA_200MA] ='Bullish' AND [20MA_100MA] = 'Bullish' AND [10MA_30MA]  = 'Bullish' THEN 'State_1'
          when [50MA_200MA] = 'Bullish' AND [20MA_100MA]= 'Bullish' AND [10MA_30MA] = 'Bearish' THEN 'State_2'
          when [50MA_200MA] ='Bullish' AND [20MA_100MA]= 'Bearish' AND [10MA_30MA] = 'Bullish' THEN 'State_3'
          when [50MA_200MA] ='Bullish' AND [20MA_100MA]= 'Bearish' AND [10MA_30MA] = 'Bearish' THEN 'State_4'
          when [50MA_200MA] ='Bearish' AND [20MA_100MA]= 'Bullish' AND [10MA_30MA] = 'Bullish' THEN 'State_5'
          when [50MA_200MA] ='Bearish' AND [20MA_100MA]= 'Bullish' AND [10MA_30MA] = 'Bearish' THEN 'State_6'
          when [50MA_200MA] ='Bearish' AND [20MA_100MA]= 'Bearish' AND [10MA_30MA] = 'Bullish' THEN 'State_7'
          when [50MA_200MA] ='Bearish' AND [20MA_100MA]= 'Bearish' AND [10MA_30MA] = 'Bearish' THEN 'State_8'
          END),1) AS CurrState
      from tbl_Market_Condition
    where Trans_Flag= 'Y'
    and MAType = 'EMA'
    AND Mrk_Dte <= '20200625'
    AND Symbol = 'AA'
   ORDER BY Mrk_Dte DESC) b
on b.Symbol=a.Symbol
left outer join Stock_Quotes_Adj c
on b.Symbol=c.Symbol
and c.[Date] = '20200625'
WHERE a.Symbol='AA'
AND   a.Mrk_Dte <= '20200625'
Order by a.Mrk_Dte DESC
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.Symbol ;;
  }

  dimension: enter_price {
    type: number
    sql: ${TABLE}.Enter_Price ;;
  }

  dimension: target_1 {
    type: number
    label: "Target 1"
    sql: ${TABLE}."Target 1" ;;
  }

  dimension: target_2 {
    type: number
    label: "Target 2"
    sql: ${TABLE}."Target 2" ;;
  }

  dimension: target_3 {
    type: number
    label: "Target 3"
    sql: ${TABLE}."Target 3" ;;
  }

  dimension: stop_loss_1 {
    type: number
    label: "Stop loss 1"
    sql: ${TABLE}."Stop loss 1" ;;
  }

  dimension: stop_loss_2 {
    type: number
    label: "Stop loss 2"
    sql: ${TABLE}."Stop loss 2" ;;
  }

  dimension: stop_loss_3 {
    type: number
    label: "Stop loss 3"
    sql: ${TABLE}."Stop loss 3" ;;
  }

  set: detail {
    fields: [
      symbol,
      enter_price,
      target_1,
      target_2,
      target_3,
      stop_loss_1,
      stop_loss_2,
      stop_loss_3
    ]
  }
}
