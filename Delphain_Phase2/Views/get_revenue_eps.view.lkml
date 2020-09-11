view: get_revenue_eps {
  derived_table: {
    sql: select *
          from
            (select tzc.ticker
                        ,kif.CalendarDate
                        ,cast(iad as decimal(18,2))                       as Annual_Dividend
                        ,cast(eps_act_fr0 as decimal(18,2))               as Earnings_Per_Share_Previous
                        ,cast(eps_mean_est_fr1 as decimal(18,2))          as Earnings_Per_Share_Current
                        ,cast(eps_mean_est_fr2 as decimal(18,2))          as Earnings_Per_Share_Next
                        ,cast(tzc.shares_out as decimal(18,2))            as shares_out
                        ,kif.MarketCap                                    as Market_Cap
                        ,kfs.revenueusd/1000000                           as Revenue
                        ,kfs.opinc/1000000                                as opinc
                        ,kfs.netinc/1000000                              as netinc
                ,(CASE WHEN kfs.assets>0 THEN ((kfs.netinc - kfs.ncfo-kfs.ncfi)/kfs.assets)*100 ELSE 0 END) as Sloan_Ratio
                ,kfs.assets/1000000 as Assets
                        ,row_number() over (partition by tzc.ticker order by kif.CalendarDate desc) as date_range

                  from [dbo].[tbl_ZACKS_CP] tzc

                  left outer join
                  [Key_Fundamentals].[dbo].[K2O_Industry_Fundamentals] kif
                  on tzc.zacks_x_ind_code=kif.SubIndustry_ID

                  left outer join
                  [Key_Fundamentals].[dbo].[K2O_US_Fundamentals_Stag] kfs
                  on tzc.ticker=kfs.ticker

                  where tzc.ticker = COALESCE(NULLIF({% parameter symb %},'NULL'), (select top 1 symbol from Stock_Quotes_Adj where symbol not in ('SPX','NDX') and [Date]='20200722' order by [Close] desc))
                   and kif.dimension = 'ARQ'
                  and kfs.dimension=kif.dimension
                  and kfs.CalendarDate=kif.CalendarDate) a
                  where a.date_range <= 10
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

  parameter: tot_quaters {
    type: number
  }

  dimension: ticker {
    type: string
    sql: ${TABLE}.ticker ;;
  }

  dimension: calendar_date {
    type: date
    sql: ${TABLE}.CalendarDate ;;
  }

  dimension: annual_dividend {
    type: number
    sql: ${TABLE}.Annual_Dividend ;;
  }

  dimension: earnings_per_share_previous {
    type: number

    sql: ${TABLE}.Earnings_Per_Share_Previous ;;
  }

  dimension: earnings_per_share_current {
    type: number
    sql: ${TABLE}.Earnings_Per_Share_Current ;;
  }

  dimension: earnings_per_share_next {
    type: number
    sql: ${TABLE}.Earnings_Per_Share_Next ;;
  }

  dimension: shares_out {
    type: number
    sql: ${TABLE}.shares_out ;;
  }

  dimension: market_cap {
    type: number
    sql: ${TABLE}.Market_Cap ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.Revenue ;;
  }

  dimension: opinc {
    type: number
    sql: ${TABLE}.opinc ;;
  }

  dimension: netinc {
    type: number
    sql: ${TABLE}.netinc ;;
  }

  dimension: sloan_ratio {
    type: number
    sql: ${TABLE}.Sloan_Ratio ;;
  }

  dimension: assets {
    type: number
    sql: ${TABLE}.Assets ;;
  }

  dimension: date_range {
    type: number
    sql: ${TABLE}.date_range ;;
  }

  set: detail {
    fields: [
      ticker,
      calendar_date,
      annual_dividend,
      earnings_per_share_previous,
      earnings_per_share_current,
      earnings_per_share_next,
      shares_out,
      market_cap,
      revenue,
      opinc,
      netinc,
      sloan_ratio,
      assets,
      date_range
    ]
  }
}
