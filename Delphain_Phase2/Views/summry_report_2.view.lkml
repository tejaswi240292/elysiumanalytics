view: summry_report_2 {
  derived_table: {
    sql: select  a.ticker
          ,count(*) Institutions_Count_Incr
     ,sum(a.[value]) as combined_investment_value
      ,b.combined_investment_value_top_10
from [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] a

left outer join (
select a.ticker, sum(a.[value] ) as combined_investment_value_top_10
from
(select distinct top 10 ticker
       ,investorname
     ,[value]
from [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData]
where securitytype = 'SHR'
and year(calendardate)= year(GETDATE())
and ticker='AMZN'
order by [value] desc) a
group by a.ticker
) b
on a.ticker=b.ticker
where securitytype = 'SHR'
and [Status]= 'Incr'
and year(calendardate)>= year(dateadd(year,-2,GETDATE()))
and a.ticker='AMZN'
group by a.ticker,b.combined_investment_value_top_10
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ticker {
    type: string
    sql: ${TABLE}.ticker ;;
  }

  dimension: Total_Number_with_Institution_Increased_Buying_From_Q1_to_Q4{
    type: number
    sql: ${TABLE}.Institutions_Count_Incr ;;
  }

  dimension: Total_Combined_Investment_Value {
    type: number
    sql: ${TABLE}.combined_investment_value ;;
  }

  dimension: Total_Combined_Investment_Value_of_Top_10_Investors {
    type: number
    sql: ${TABLE}.combined_investment_value_top_10 ;;
  }

  set: detail {
    fields: [ticker, Total_Number_with_Institution_Increased_Buying_From_Q1_to_Q4, Total_Combined_Investment_Value, Total_Combined_Investment_Value_of_Top_10_Investors]
  }
}
