view: get_profile {
  derived_table: {
    sql: select   S1.Symbol
          ,S3.emp_cnt
          ,S3.market_val
          ,S3.shares_out
          ,Mkrt_dtl.Market_Share
          ,ROUND([K2O_functions].wct.slope( ((S1.[Close]/S1.Previous_close)-1), ((S2.[Close]/S2.Previous_close)-1) ),2) as beta
      from
      (  (select curr.Symbol
      ,curr.[Date]
      ,curr.[Close]
      ,coalesce(prev.[close],0) as  Previous_close

      from (select A.Symbol, A.[Date],A.[Close],ROW_NUMBER() OVER (PARTITION BY Symbol ORDER BY A.[Date] ) 'RowRank'
          from (SELECT Symbol, [Date],[Close],ROW_NUMBER() OVER (PARTITION BY Symbol,YEAR([Date]), Month([Date]) ORDER BY [Date] ) 'RowRank'
             FROM Stock_Quotes_Adj
             WHERE [Date]>=DATEADD(MONTH, -36,{% parameter dte %}) AND [Date]<={% parameter dte %} AND Symbol = {% parameter sym %} ) A
         where A.RowRank  = 1) curr
      left outer join
         (select A.Symbol, A.[Date],A.[Close],ROW_NUMBER() OVER (PARTITION BY Symbol ORDER BY A.[Date] ) 'RowRank'
        from (SELECT Symbol, [Date],[Close], ROW_NUMBER() OVER (PARTITION BY Symbol,YEAR([Date]), Month([Date]) ORDER BY [Date] ) 'RowRank'
            FROM Stock_Quotes_Adj
           WHERE [Date]>=DATEADD(MONTH, -36,{% parameter dte %}) AND [Date]<={% parameter dte %} AND Symbol = {% parameter sym %}) A
      where A.RowRank  = 1) prev
      on curr.Symbol=prev.Symbol
      and prev.RowRank =(curr.RowRank-1)) S1
      INNER JOIN
      (select curr.Symbol
           ,curr.[Date]
           ,curr.[Close]
           ,coalesce(prev.[close],0)  as Previous_close

      from (select A.Symbol, A.[Date],A.[Close],ROW_NUMBER() OVER (PARTITION BY Symbol ORDER BY A.[Date] ) 'RowRank'
          from (SELECT Symbol, [Date],[Close], ROW_NUMBER() OVER (PARTITION BY Symbol,YEAR([Date]), Month([Date]) ORDER BY [Date] ) 'RowRank'
             FROM Stock_Quotes_Adj
             WHERE [Date]>=DATEADD(MONTH, -36,{% parameter dte %}) AND [Date]<={% parameter dte %} AND Symbol ='SPX') A
         where A.RowRank  = 1) curr
      left outer join
         (select A.Symbol, A.[Date],A.[Close],ROW_NUMBER() OVER (PARTITION BY Symbol ORDER BY A.[Date] ) 'RowRank'
        from (SELECT Symbol, [Date],[Close], ROW_NUMBER() OVER (PARTITION BY Symbol,YEAR([Date]), Month([Date]) ORDER BY [Date] ) 'RowRank'
            FROM Stock_Quotes_Adj
           WHERE [Date]>=DATEADD(MONTH, -36,{% parameter dte %}) AND [Date]<={% parameter dte %} AND Symbol='SPX') A
      where A.RowRank  = 1) prev
      on curr.Symbol=prev.Symbol
      and prev.RowRank =(curr.RowRank-1)) S2
      ON S1.[Date]=S2.[Date]
      AND S1.Previous_close > 0
      left outer join ( select ticker, cast(emp_cnt as NUMERIC(18,2)) as emp_cnt, (cast(market_val as NUMERIC(18,2)))/1000 as market_val, (cast(shares_out as NUMERIC(18,2)))/1000 as shares_out from tbl_ZACKS_CP where ticker = {% parameter sym %}) S3
      on S1.Symbol=S3.ticker

      left outer join
      (
      SELECT TOP (1) k2o.ticker
      ,ROUND(((CAST(k2o.revenueusd AS numeric(18,4))/1000000000)/SUMREV.SumRev)*100,2) AS Market_Share

      FROM [Key_Fundamentals].[dbo].[K2O_US_Fundamentals] k2o
      LEFT OUTER JOIN(
                SELECT CP.ticker,calendardate,SUM(revenueusd) as SumRev
                FROM [Key_Fundamentals].[dbo].[K2O_Industry_Fundamentals] KI,
                  tbl_ZACKS_CP CP
                WHERE KI.Industry_ID=cast(CP.zacks_m_ind_code as int)
                and CP.ticker = {% parameter sym %}
                and Dimension ='ARY'
                and calendardate = (select max([calendardate])
                            from [Key_Fundamentals].[dbo].[K2O_Industry_Fundamentals]
                          WHERE [calendardate]<={% parameter dte %} AND Dimension='ARY')
                GROUP BY CP.ticker,calendardate) SUMREV
      ON k2o.ticker=SUMREV.ticker
      and k2o.[calendardate]=SUMREV.[calendardate]
      WHERE k2o.ticker={% parameter sym %}
      AND k2o.Dimension='ARY'
      ORDER BY k2o.[calendardate] DESC

      ) Mkrt_dtl
      on S1.Symbol=Mkrt_dtl.ticker
      )

      group by S1.Symbol,S3.emp_cnt,S3.market_val,S3.shares_out,Mkrt_dtl.Market_Share
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


  dimension: symbol {
    type: string
    sql: ${TABLE}.Symbol ;;
  }

  dimension: emp_cnt {
    type: number
    sql: ${TABLE}.emp_cnt ;;
  }

  dimension: market_val {
    type: number
    sql: ${TABLE}.market_val ;;
  }

  dimension: shares_out {
    type: number
    sql: ${TABLE}.shares_out ;;
  }

  dimension: market_share {
    type: number
    sql: ${TABLE}.Market_Share ;;
  }

  dimension: beta {
    type: number
    sql: ${TABLE}.beta ;;
  }

  set: detail {
    fields: [
      symbol,
      emp_cnt,
      market_val,
      shares_out,
      market_share,
      beta
    ]
  }
}
