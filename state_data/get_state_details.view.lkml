view: get_state_details {
  derived_table: {
    sql: SELECT DISTINCT TMC.Symbol,
      TMCA.CurrState,
      TMC.[State] as TranState,
      count(1) AS Probcnt

      FROM tbl_Market_Condition TMC,

      (SELECT  Mrk_Dte,
           Case when [50MA_200MA] ='Bullish' AND [20MA_100MA] = 'Bullish' AND [10MA_30MA]  = 'Bullish' THEN 'State_1'
          when [50MA_200MA] = 'Bullish' AND [20MA_100MA]= 'Bullish' AND [10MA_30MA] = 'Bearish' THEN 'State_2'
          when [50MA_200MA] ='Bullish' AND [20MA_100MA]= 'Bearish' AND [10MA_30MA] = 'Bullish' THEN 'State_3'
          when [50MA_200MA] ='Bullish' AND [20MA_100MA]= 'Bearish' AND [10MA_30MA] = 'Bearish' THEN 'State_4'
          when [50MA_200MA] ='Bearish' AND [20MA_100MA]= 'Bullish' AND [10MA_30MA] = 'Bullish' THEN 'State_5'
          when [50MA_200MA] ='Bearish' AND [20MA_100MA]= 'Bullish' AND [10MA_30MA] = 'Bearish' THEN 'State_6'
          when [50MA_200MA] ='Bearish' AND [20MA_100MA]= 'Bearish' AND [10MA_30MA] = 'Bullish' THEN 'State_7'
          when [50MA_200MA] ='Bearish' AND [20MA_100MA]= 'Bearish' AND [10MA_30MA] = 'Bearish' THEN 'State_8'
          END AS CurrState
      from tbl_Market_Condition
      WHERE  {% condition Symb %} Symbol {% endcondition %}
      AND {% condition CurrDate %} Mrk_Dte {% endcondition %}
      AND Trans_Flag = 'Y'
      AND MAType = 'EMA'
      ) TMCA

      WHERE TMCA.CurrState = TMC.FromTran
      AND TMC.Mrk_Dte <= TMCA.Mrk_Dte
      AND  {% condition Symb %}  Symbol {% endcondition %}
      GROUP BY
      TMC.Symbol,
      TMCA.CurrState,
      TMC.[State]
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  filter: Symb {
    type: string
  }

  filter: CurrDate {
    type: date
  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.Symbol ;;
  }

  dimension: curr_state {
    type: string
    sql: ${TABLE}.CurrState ;;
  }

  dimension: tran_state {
    type: string
    sql: ${TABLE}.TranState ;;
  }

  dimension: probcnt {
    type: number
    sql: ${TABLE}.Probcnt ;;
  }

  set: detail {
    fields: [symbol, curr_state, tran_state, probcnt]
  }
}
