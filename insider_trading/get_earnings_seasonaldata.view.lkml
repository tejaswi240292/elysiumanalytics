view: get_earnings_seasonaldata  {
  derived_table: {
    sql: SELECT YEAR(XYZ.[Cal_Year]) [Year],
      Xyz.Cal_QTR,
      PricePerc_1 PricePerc,
      (NextClose-[Close]) PriceDiff
      from (SELECT ABC.*,ZES.Cal_QTR,ZES.[Cal_Year] FROM (SELECT [Date],[close],Flags,
      (SELECT TOP(1) [close]
      FROM  Stock_Quotes SQ
      WHERE SQ.[Date]>S.[Date]
      AND FLags IN('P')
      AND Symbol= 'AAPL'/*@Symbol*/ Order by SQ.[Date]) NextClose,

      (SELECT TOp(1) [DATE]
      FROM  Stock_Quotes SQ
      WHERE Symbol='AAPL'/*@Symbol*/
      AND FLags IN('P')
      AND SQ.[Date]>S.[Date]
      order by [DATE] ) NextDAte
      FROM Stock_Quotes S
      WHERE Symbol='AAPL'/*@Symbol*/
      AND [Date]>= '01/01/2007' /*@FromDate*/
      AND [Date]<= getdate() /*@Currdate*/
      AND  Flags IN('E')) ABC
      LEFT JOIN (SELECT *
                 from  [ZacksEarningSurpriseZES-1]
                WHERE Code='AAPL'/*@Symbol*/
                AND [Date]>='01/01/2007' /*@FromDate*/
                AND [Date]<=getdate() /*@Currdate*/) ZES
      ON ZES.[DAte]=ABC.[DATE]) XYZ
      INNER JOIN (SELECT (SELECT dbo.fn_Get_PricePerc(Symbol,1,[DATE])) PricePerc_1,[DATE] MADte from  Stock_Quotes

      WHERE Symbol='AAPL'/*@Symbol*/
      AND [DATE]>='01/01/2007' /*@FromDate*/
      AND [DATE]<=getdate() /*@Currdate*/) Price
      ON Xyz.NextDAte=Price.MADte
      Order by Xyz.[Date]
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  filter: Symb {
    type: string
  }

  filter: frmdate {
    type: date
  }

  filter: currdate {
    type: date
  }

  dimension: year {
    type: number
    sql: ${TABLE}.Year ;;
  }

  dimension: cal_qtr {
    type: string
    sql: ${TABLE}.Cal_QTR ;;
  }

  dimension: price_perc {
    type: number
    sql: ${TABLE}.PricePerc ;;
  }

  dimension: price_diff {
    type: number
    sql: ${TABLE}.PriceDiff ;;
  }

  set: detail {
    fields: [year, cal_qtr, price_perc, price_diff]
  }
}
