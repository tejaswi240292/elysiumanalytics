view: get_latest_ratings {
  derived_table: {
    sql: select a.Grade,count(*) as tot
      from
      (
      select  Grade, row_number() over (partition by CalendarDate order by CalendarDate desc ) as dte_range
      from [Key_Fundamentals].[dbo].K2O_US_Fundamentals_Grade
      where dimension = 'ARQ'
       ) a
      where a.dte_range = 1
      group by a.Grade
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: grade {
    type: string
    sql: ${TABLE}.Grade ;;
  }

  dimension: tot {
    type: number
    sql: ${TABLE}.tot ;;
  }

  set: detail {
    fields: [grade, tot]
  }
}
