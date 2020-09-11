view: institution_count_per_quater {
  derived_table: {
    sql: SELECT a.ticker
       ,YEAR(a.calendardate) as Year_
       ,case when month(a.calendardate) = 3  then cast(YEAR(a.calendardate)as varchar(5))+'~Q1'
             when month(a.calendardate) = 6  then cast(YEAR(a.calendardate)as varchar(5))+'~Q2'
             when month(a.calendardate) = 9  then cast(YEAR(a.calendardate)as varchar(5))+'~Q3'
             when month(a.calendardate) = 12 then cast(YEAR(a.calendardate)as varchar(5))+'~Q4'
        End as Quater
       ,a.Num_Of_Institutions
from
(select a.ticker
      ,a.calendardate
    ,DENSE_RANK () over (order by year(a.calendardate) desc ) as num_of_years
     ,COUNT(*) as Num_Of_Institutions

from [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] a

where a.ticker = {% parameter symb %}
and YEAR(a.calendardate)>2005
and a.securitytype = 'SHR'
group by a.ticker,a.calendardate) a

where a.num_of_years < {% parameter Number_Of_Years  %}
  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: symb {
    type: string
  }

  parameter: Number_Of_Years {
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

  dimension: num_of_institutions {
    type: number
    sql: ${TABLE}.Num_Of_Institutions ;;
  }



  set: detail {
    fields: [ticker, year_, quater, num_of_institutions]
  }
}
