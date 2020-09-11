view: total_shares_per_quater {
  derived_table: {
    sql: SELECT a.ticker
       ,YEAR(a.calendardate) as Year_
       ,case when month(a.calendardate) = 3  then cast(YEAR(a.calendardate)as varchar(5))+'~Q1'
             when month(a.calendardate) = 6  then cast(YEAR(a.calendardate)as varchar(5))+'~Q2'
             when month(a.calendardate) = 9  then cast(YEAR(a.calendardate)as varchar(5))+'~Q3'
             when month(a.calendardate) = 12 then cast(YEAR(a.calendardate)as varchar(5))+'~Q4'
        End as Quater
       ,a.Num_Of_Shares
      ,((a.Num_Of_Shares-(FIRST_VALUE(a.Num_Of_Shares) OVER (PARTITION by YEAR(a.calendardate) ORDER BY month(a.calendardate) ROWS BETWEEN 1 PRECEDING AND CURRENT ROW)))/(FIRST_VALUE(a.Num_Of_Shares) OVER (PARTITION by YEAR(a.calendardate) ORDER BY month(a.calendardate) ROWS BETWEEN 1 PRECEDING AND CURRENT ROW)))*100 as Stat
from
(select a.ticker
      ,a.calendardate
      ,DENSE_RANK () over (order by year(a.calendardate) desc ) as num_of_years
      ,Sum(units) as Num_Of_Shares

from [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] a

where a.ticker = {% parameter symb %}
and YEAR(a.calendardate)>2005
and a.securitytype = 'SHR'
group by a.ticker,a.calendardate) a

where a.num_of_years < {% parameter tot_years %}
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: symb {
    type: string
  }

  parameter: tot_years {
    type: number
  }

  dimension: ticker {
    type: string
    sql: ${TABLE}.ticker ;;
  }

  dimension: year_ {
    type: number
    sql: ${TABLE}.Year_ ;;
  }

  dimension: quater {
    type: string
    sql: ${TABLE}.Quater ;;
  }

  dimension: num_of_shares {
    type: number
    sql: ${TABLE}.Num_Of_Shares ;;
  }

  dimension: stat {
    type: number
    sql: ${TABLE}.Stat ;;
  }

  set: detail {
    fields: [ticker, year_, quater, num_of_shares, stat]
  }
}
