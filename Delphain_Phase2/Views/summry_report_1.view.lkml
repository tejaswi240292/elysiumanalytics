view: summry_report_1 {
  derived_table: {
    sql: select
         case when month(calendardate) = 3 then 'Q1'
      when month(calendardate) = 12 then 'Q4'
          end as Quater
         ,count(*) Institutions_Count

from [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData]
where securitytype = 'SHR'
and year(calendardate)= year(dateadd (year,-1,GETDATE()))
and month(calendardate) in (3,12)
and ticker='AMZN'
group by calendardate
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: quater {
    type: string
    sql: ${TABLE}.Quater ;;
  }

  dimension: institutions_count {
    type: number
    sql: ${TABLE}.Institutions_Count ;;
  }

  set: detail {
    fields: [quater, institutions_count]
  }
}
