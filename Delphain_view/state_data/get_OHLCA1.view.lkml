view: get_OHLCA1 {
  derived_table: {
    sql: SELECT OHLCA.Symbol
      ,OHLCA.[Date]
    ,OHLCA.dte_milliseconds
    ,OHLCA.last_entry_date
    ,OHLCA.lst_dte_milliseconds
    ,OHLCA.[Open]
    ,OHLCA.[High]
    ,OHLCA.[Low]
    ,OHLCA.[Close]
    ,OHLCA.TC
    ,STATE_DTLS.Mrk_Dte
    ,STATE_DTLS.Enter_Price
    ,round((STATE_DTLS.Enter_Price+(STATE_DTLS.Enter_Price* (STATE_DTLS.Target_1/100))) ,2) Target_Price_1
    ,round((STATE_DTLS.Enter_Price+(STATE_DTLS.Enter_Price* (STATE_DTLS.Target_2/100))) ,2) Target_Price_2
    ,round((STATE_DTLS.Enter_Price+(STATE_DTLS.Enter_Price* (STATE_DTLS.Target_3/100))) ,2) Target_Price_3
    ,round((STATE_DTLS.Enter_Price+(STATE_DTLS.Enter_Price* (STATE_DTLS.Stop_loss_1/100))) ,2) SL_Price_1
    ,round((STATE_DTLS.Enter_Price+(STATE_DTLS.Enter_Price* (STATE_DTLS.Stop_loss_2/100))) ,2) SL_Price_2
    ,round((STATE_DTLS.Enter_Price+(STATE_DTLS.Enter_Price* (STATE_DTLS.Stop_loss_3/100))) ,2) SL_Price_3

FROM
(SELECT  sqa.Symbol
        ,sqa.[Date]
        ,cast(Datediff(s, '1970-01-01',sqa.[Date]) AS bigint)*1000 as dte_milliseconds
        ,tmc.last_entry_date
        ,cast(Datediff(s, '1970-01-01',tmc.last_entry_date) AS bigint)*1000 as lst_dte_milliseconds
        ,sqa.[Open]
        ,sqa.[High]
        ,sqa.[Low]
        ,sqa.[Close]
        ,sqa.[TC/YC] TC

from Stock_Quotes_Adj sqa
left outer join
(SELECT TOP(1) Symbol
              ,Mrk_Dte  as last_entry_date
 FROM tbl_Market_condition
 WHERE Trans_Flag= 'Y'
 and   Mrk_Dte <= {% parameter dte %}
 and   Symbol   = {% parameter sym %}
 ORDER BY Mrk_Dte DESC) tmc
 on sqa.Symbol=tmc.Symbol
 where sqa.Symbol = {% parameter sym %}
and sqa.[Date] >=  DATEADD(month,-1,tmc.last_entry_date)
and sqa.[Date] <= {% parameter dte %} )  OHLCA

LEFT OUTER JOIN


(SELECT  top (1) a.Symbol ,
                 a.Mrk_Dte ,
                 c.[close] as Enter_Price,
        Case when b.CurrState ='1' then ROUND(ST1_TP_1,2)
             when b.CurrState ='2' then ROUND(ST2_TP_1,2)
             when b.CurrState ='3' then ROUND(ST3_TP_1,2)
             when b.CurrState ='4' then ROUND(ST4_TP_1,2)
             when b.CurrState ='5' then ROUND(ST5_TP_1,2)
             when b.CurrState ='6' then ROUND(ST6_TP_1,2)
             when b.CurrState ='7' then ROUND(ST7_TP_1,2)
             when b.CurrState ='8' then ROUND(ST8_TP_1,2)
        end as 'Target_1',
                case when b.CurrState ='1' then ROUND(ST1_TP_2,2)
             when b.CurrState ='2' then ROUND(ST2_TP_2,2)
           when b.CurrState ='3' then ROUND(ST3_TP_2,2)
           when b.CurrState ='4' then ROUND(ST4_TP_2,2)
           when b.CurrState ='5' then ROUND(ST5_TP_2,2)
           when b.CurrState ='6' then ROUND(ST6_TP_2,2)
           when b.CurrState ='7' then ROUND(ST7_TP_2,2)
           when b.CurrState ='8' then ROUND(ST8_TP_2,2)
        end   as 'Target_2',
        Case when b.CurrState ='1' then ROUND(ST1_TP_3,2)
             when b.CurrState ='2' then ROUND(ST2_TP_3,2)
           when b.CurrState ='3' then ROUND(ST3_TP_3,2)
           when b.CurrState ='4' then ROUND(ST4_TP_3,2)
           when b.CurrState ='5' then ROUND(ST5_TP_3,2)
           when b.CurrState ='6' then ROUND(ST6_TP_3,2)
           when b.CurrState ='7' then ROUND(ST7_TP_3,2)
           when b.CurrState ='8' then ROUND(ST8_TP_3,2)
        end   as 'Target_3',
        Case when b.CurrState ='1' then ROUND(ST1_SL_1,2)
             when b.CurrState ='2' then ROUND(ST2_SL_1,2)
           when b.CurrState ='3' then ROUND(ST3_SL_1,2)
           when b.CurrState ='4' then ROUND(ST4_SL_1,2)
           when b.CurrState ='5' then ROUND(ST5_SL_1,2)
           when b.CurrState ='6' then ROUND(ST5_SL_1,2)
           when b.CurrState ='7' then ROUND(ST7_SL_1,2)
           when b.CurrState ='8' then ROUND(ST8_SL_1,2)
        end   as 'Stop_loss_1',
        Case when b.CurrState ='1' then ROUND(ST1_SL_2,2)
             when b.CurrState ='2' then ROUND(ST2_SL_2,2)
           when b.CurrState ='3' then ROUND(ST3_SL_2,2)
           when b.CurrState ='4' then ROUND(ST4_SL_2,2)
           when b.CurrState ='5' then ROUND(ST5_SL_2,2)
           when b.CurrState ='6' then ROUND(ST5_SL_2,2)
           when b.CurrState ='7' then ROUND(ST7_SL_2,2)
           when b.CurrState ='8' then ROUND(ST8_SL_2,2)
        end   as 'Stop_loss_2',
        Case when b.CurrState ='1' then ROUND(ST1_SL_3,2)
             when b.CurrState ='2' then ROUND(ST2_SL_3,2)
           when b.CurrState ='3' then ROUND(ST3_SL_3,2)
           when b.CurrState ='4' then ROUND(ST4_SL_3,2)
           when b.CurrState ='5' then ROUND(ST5_SL_3,2)
           when b.CurrState ='6' then ROUND(ST5_SL_3,2)
           when b.CurrState ='7' then ROUND(ST7_SL_3,2)
           when b.CurrState ='8' then ROUND(ST8_SL_3,2)
        end   as 'Stop_loss_3'

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
    AND Mrk_Dte <= (SELECT  Top(1) Mrk_Dte FROM  tbl_Market_condition WHERE Trans_Flag= 'Y' and Mrk_Dte <= {% parameter dte %} and Symbol   = {% parameter sym %} ORDER BY Mrk_Dte DESC)
    AND Symbol = {% parameter sym %}
   ORDER BY Mrk_Dte DESC) b
on b.Symbol=a.Symbol

left outer join Stock_Quotes_Adj c
on b.Symbol=c.Symbol
and c.[Date] = (SELECT  Top(1) Mrk_Dte FROM  tbl_Market_condition WHERE Trans_Flag= 'Y' and Mrk_Dte <= {% parameter dte %} and Symbol   = {% parameter sym %} ORDER BY Mrk_Dte DESC)
WHERE a.Symbol= {% parameter sym %}
AND   a.Mrk_Dte <= (SELECT  Top(1) Mrk_Dte FROM  tbl_Market_condition WHERE Trans_Flag= 'Y' and Mrk_Dte <= {% parameter dte %} and Symbol   = {% parameter sym %} ORDER BY Mrk_Dte DESC)
Order by a.Mrk_Dte DESC) STATE_DTLS

on OHLCA.Symbol=STATE_DTLS.Symbol;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: dte {
    type: date
  }

  parameter: sym {
    type: string
  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.Symbol ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.Date ;;
  }

  dimension: dte_milliseconds {
    type: number
    sql: ${TABLE}.dte_milliseconds ;;
  }

  dimension: last_entry_date {
    type: date
    sql: ${TABLE}.last_entry_date ;;
  }

  dimension: lst_dte_milliseconds {
    type: number
    sql: ${TABLE}.lst_dte_milliseconds ;;
  }

  dimension: open {
    type: number
    sql: ${TABLE}."Open" ;;
  }

  dimension: high {
    type: number
    sql: ${TABLE}.High ;;
  }

  dimension: low {
    type: number
    sql: ${TABLE}.Low ;;
  }

  dimension: close {
    type: number
    sql: ${TABLE}."Close" ;;
  }

  dimension: tc {
    type: number
    sql: ${TABLE}.TC ;;
  }

  dimension: mrk_dte {
    type: date
    sql: ${TABLE}.Mrk_Dte ;;
  }

  dimension: enter_price {
    type: number
    sql: ${TABLE}.Enter_Price ;;
  }

  dimension: target_price_1 {
    type: number
    sql: ${TABLE}.Target_Price_1 ;;
  }

  dimension: target_price_2 {
    type: number
    sql: ${TABLE}.Target_Price_2 ;;
  }

  dimension: target_price_3 {
    type: number
    sql: ${TABLE}.Target_Price_3 ;;
  }

  dimension: sl_price_1 {
    type: number
    sql: ${TABLE}.SL_Price_1 ;;
  }

  dimension: sl_price_2 {
    type: number
    sql: ${TABLE}.SL_Price_2 ;;
  }

  dimension: sl_price_3 {
    type: number
    sql: ${TABLE}.SL_Price_3 ;;
  }

  set: detail {
    fields: [
      symbol,
      date,
      dte_milliseconds,
      last_entry_date,
      lst_dte_milliseconds,
      open,
      high,
      low,
      close,
      tc,
      mrk_dte,
      enter_price,
      target_price_1,
      target_price_2,
      target_price_3,
      sl_price_1,
      sl_price_2,
      sl_price_3
    ]
  }
}
