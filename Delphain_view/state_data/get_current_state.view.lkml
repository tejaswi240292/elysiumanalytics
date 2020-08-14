view: get_current_state {
  derived_table: {
    sql: SELECT     Top(1) Symbol,
           Mrk_Dte,
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
WHERE  Trans_Flag = 'Y'
AND MAType = 'EMA'
and Symbol='AA'
AND Mrk_Dte <= '20200625'
order by Mrk_Dte desc
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

  dimension: mrk_dte {
    type: date
    sql: ${TABLE}.Mrk_Dte ;;
  }

  dimension: curr_state {
    type: string
    sql: ${TABLE}.CurrState ;;
  }


  set: detail {
    fields: [symbol, mrk_dte, curr_state]
  }
}
