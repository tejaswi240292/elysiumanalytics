view: price_history {
  derived_table: {
    sql: select sqa.[Date],
       tzc.ticker as Symbol,
       tzc.zacks_x_sector_desc as  Sector,
     sqa1.high_52 as High_52_Week,
     sqa.[Close] as Last_sale,
     sqa1.high_52-sqa.[Close] as Price_Diff,
     ((sqa1.high_52 - sqa.[Close]) /sqa.[Close]) * 100 as Possible_Growth_Perc,
     sqa2.year_beg_price as   Year_Beginning_Price,
     sqa1.low_52 as Low_52_Week,
     sqa3.low_5_year as Lowest_since_5_years,
     sqa5.[Date] as Lowest_5_year_date,
     sqa3.high_5_year as Highest_since_5_years,
     sqa4.[Date] as  Highest_5_year_date

FROM Stock_Quotes_Adj sqa
LEFT OUTER JOIN [dbo].[tbl_ZACKS_CP] tzc
ON sqa.Symbol=tzc.ticker
LEFT OUTER JOIN (
SELECT Symbol,MAX ([Close]) as high_52,MIN ([Close]) as low_52
from Stock_Quotes_Adj
where [Date] between DATEADD(week,-52,{% parameter dte %}) and {% parameter dte %}
and Symbol = {% parameter symb %}
group by Symbol
) sqa1
on sqa.Symbol=sqa1.Symbol

LEFT OUTER JOIN (
SELECT top 1 Symbol, [Close]  as  year_beg_price
from Stock_Quotes_Adj
where year([Date]) = year({% parameter dte %})
and Symbol = {% parameter symb %}
order by [Date]) sqa2
on sqa.Symbol=sqa2.Symbol

LEFT OUTER JOIN (
SELECT Symbol,MAX ([Close]) as high_5_year,MIN ([Close]) as low_5_year
from Stock_Quotes_Adj
where [Date] between  DATEADD(year,-5,{% parameter dte %}) and {% parameter dte %}
and Symbol = {% parameter symb %}
group by Symbol
) sqa3
on sqa.Symbol=sqa3.Symbol

LEFT OUTER JOIN (
SELECT Symbol
      ,[Date]
      ,[Close]
from Stock_Quotes_Adj
where [Date] between  DATEADD(year,-5,{% parameter dte %}) and {% parameter dte %}
and Symbol = {% parameter symb %}
) sqa4
on sqa3.Symbol=sqa4.Symbol
and sqa3.high_5_year=sqa4.[Close]

LEFT OUTER JOIN (
SELECT Symbol
      ,[Date]
      ,[Close]
from Stock_Quotes_Adj
where [Date] between  DATEADD(year,-5,{% parameter dte %}) and {% parameter dte %}
and Symbol = {% parameter symb %}
) sqa5
on sqa3.Symbol=sqa5.Symbol
and sqa3.low_5_year=sqa5.[Close]

where sqa.Symbol = {% parameter symb %}
and sqa.[Date] = {% parameter dte %}
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: symb {
    type: string
  }

  parameter: dte {
    type: date
  }

  dimension: date {
    type: date
    sql: ${TABLE}.Date ;;
  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.Symbol ;;
  }

  dimension: sector {
    type: string
    sql: ${TABLE}.Sector ;;
  }

  dimension: high_52_week {
    type: number
    sql: ${TABLE}.High_52_Week ;;
  }

  dimension: last_sale {
    type: number
    sql: ${TABLE}.Last_sale ;;
  }

  dimension: price_diff {
    type: number
    sql: ${TABLE}.Price_Diff ;;
  }

  dimension: possible_growth_perc {
    type: number
    sql: ${TABLE}.Possible_Growth_Perc ;;
  }

  dimension: year_beginning_price {
    type: number
    sql: ${TABLE}.Year_Beginning_Price ;;
  }

  dimension: low_52_week {
    type: number
    sql: ${TABLE}.Low_52_Week ;;
  }

  dimension: lowest_since_5_years {
    type: number
    sql: ${TABLE}.Lowest_since_5_years ;;
  }

  dimension: lowest_5_year_date {
    type: date
    sql: ${TABLE}.Lowest_5_year_date ;;
  }

  dimension: highest_since_5_years {
    type: number
    sql: ${TABLE}.Highest_since_5_years ;;
  }

  dimension: highest_5_year_date {
    type: date
    sql: ${TABLE}.Highest_5_year_date ;;
  }

  set: detail {
    fields: [
      date,
      symbol,
      sector,
      high_52_week,
      last_sale,
      price_diff,
      possible_growth_perc,
      year_beginning_price,
      low_52_week,
      lowest_since_5_years,
      lowest_5_year_date,
      highest_since_5_years,
      highest_5_year_date
    ]
  }
}
