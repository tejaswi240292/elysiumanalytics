view: investor_stats {
  derived_table: {
    sql: select CALENDAR_YEAR
      ,investorname
      ,INVSTOR_IN_Q1
      ,SOLD_OUT_IN_Q1
      ,Q1_STATUS
      ,Q1_Quater
      ,Q1_Num_SHRS
      ,Q1_Unit_Price
      ,Q1_Total_Value
      ,Q1_Share_Diff
      ,Q1_Price_Diff
      ,Q1_value_Diff
      ,INVSTOR_IN_Q2
      ,SOLD_OUT_IN_Q2
      ,Q2_STATUS
      ,Q2_Quater
      ,Q2_Num_SHRS
      ,Q2_Unit_Price
      ,Q2_Total_Value
      ,Q2_Share_Diff
      ,Q2_Price_Diff
      ,Q2_value_Diff
      ,INVSTOR_IN_Q3
      ,SOLD_OUT_IN_Q3
      ,Q3_STATUS
      ,Q3_Quater
      ,Q3_Num_SHRS
      ,Q3_Unit_Price
      ,Q3_Total_Value
      ,Q3_Share_Diff
      ,Q3_Price_Diff
      ,Q3_value_Diff
      ,INVSTOR_IN_Q4
      ,SOLD_OUT_IN_Q4
      ,Q4_STATUS
      ,Q4_Quater
      ,Q4_Num_SHRS
      ,Q4_Unit_Price
      ,Q4_Total_Value
      ,Q4_Share_Diff
      ,Q4_Price_Diff
      ,Q4_value_Diff
      ,prev_year_q4_investorname
      ,prev_year_q4_calendardate


      from
      (select distinct year(a.calendardate)                                 CALENDAR_YEAR
             ,a.investorname
             ,case when q1.investorname is not null then 'Y' else 'N' end  as INVSTOR_IN_Q1
             ,case when q4_prev.investorname is not null and q1.investorname is null
                                                  then 'Y' else 'N' end  as SOLD_OUT_IN_Q1
           ,case when q4_prev.investorname is null and q1.investorname is not null then 'NEWLY BOUGHT'
                 when q4_prev.investorname is not null and q1.investorname is null then 'SOLD OUT'
                   when q1.units - q4_prev.units > 0 then 'INCREASED'
                 when q1.units - q4_prev.units < 0 then 'REDUCED'
                 when q1.units - q4_prev.units = 0 then 'NO-CHANGE'
           end                                                           as Q1_STATUS
          ,cast(year(q1.calendardate)as varchar(5))+'~'+'Q1'             as Q1_Quater
          ,q1.units                                                      as Q1_Num_SHRS
          ,q1.price                                                      as Q1_Unit_Price
          ,q1.value                                                      as Q1_Total_Value
          ,q1.units - q4_prev.units                                      as Q1_Share_Diff
          ,q1.price - q4_prev.price                                      as Q1_Price_Diff
          ,q1.value - q4_prev.value                                      as Q1_value_Diff

          ,case when q2.investorname is not null then 'Y' else 'N' end   as INVSTOR_IN_Q2
          ,case when q1.investorname is not null and q2.investorname is null
                                                  then 'Y' else 'N' end  as SOLD_OUT_IN_Q2
            ,case when q1.investorname is null and q2.investorname is not null  then 'NEWLY BOUGHT'
                 when q1.investorname is not null and q2.investorname is null then 'SOLD OUT'
                   when q2.units - q1.units > 0                                 then 'INCREASED'
                 when q2.units - q1.units < 0                                 then 'REDUCED'
                 when q2.units - q1.units = 0                                 then 'NO-CHANGE'
           end                                                           as Q2_STATUS
           ,cast(year(q2.calendardate)as varchar(5))+'~'+'Q2'             as Q2_Quater
           ,q2.units                                                     as Q2_Num_SHRS
           ,q2.price                                                     as Q2_Unit_Price
           ,q2.value                                                     as Q2_Total_Value
           ,q2.units - q1.units                                          as Q2_Share_Diff
           ,q2.price - q1.price                                          as Q2_Price_Diff
           ,q2.value - q1.value                                          as Q2_value_Diff

           ,case when q3.investorname is not null then 'Y' else 'N' end  as INVSTOR_IN_Q3
           ,case when q2.investorname is not null and q3.investorname is null
                                                  then 'Y' else 'N' end  as SOLD_OUT_IN_Q3
             ,case when q2.investorname is null and q3.investorname is not null then 'NEWLY BOUGHT'
                 when q2.investorname is not null and q3.investorname is null then 'SOLD OUT'
                   when q3.units - q2.units > 0                                 then 'INCREASED'
                 when q3.units - q2.units < 0                                 then 'REDUCED'
                 when q3.units - q2.units = 0                                 then 'NO-CHANGE'
           end                                                            as Q3_STATUS
           ,cast(year(q3.calendardate)as varchar(5))+'~'+'Q3'             as Q3_Quater
           ,q3.units                                                      as Q3_Num_SHRS
           ,q3.price                                                      as Q3_Unit_Price
           ,q3.value                                                      as Q3_Total_Value
           ,q3.units - q2.units                                           as Q3_Share_Diff
           ,q3.price - q2.price                                           as Q3_Price_Diff
           ,q3.value - q2.value                                           as Q3_value_Diff

           ,case when q4.investorname is not null then 'Y' else 'N' end  as INVSTOR_IN_Q4
           ,case when q3.investorname is not null and q4.investorname is null
                                                  then 'Y' else 'N' end  as SOLD_OUT_IN_Q4
           ,case when q3.investorname is null and q4.investorname is not null then 'NEWLY BOUGHT'
                 when q3.investorname is not null and q4.investorname is null then 'SOLD OUT'
                   when q4.units - q3.units > 0                                 then 'INCREASED'
                 when q4.units - q3.units < 0                                 then 'REDUCED'
                 when q4.units - q3.units = 0                                 then 'NO-CHANGE'
           end                                                           as Q4_STATUS
           ,cast(year(q4.calendardate)as varchar(5))+'~'+'Q4'             as Q4_Quater
           ,q4.units                                                     as Q4_Num_SHRS
           ,q4.price                                                     as Q4_Unit_Price
           ,q4.value                                                     as Q4_Total_Value
           ,q4.units - q3.units                                          as Q4_Share_Diff
           ,q4.price - q3.price                                          as Q4_Price_Diff
           ,q4.value - q3.value                                          as Q4_value_Diff


           ,q4_prev.investorname                                         as prev_year_q4_investorname
           ,q4_prev.calendardate                                         as prev_year_q4_calendardate

      from [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData]  a

      left outer join
      [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] q1
      on a.investorname=q1.investorname
      and a.ticker=q1.ticker
      and a.securitytype=q1.securitytype
      and year(a.calendardate)=year(q1.calendardate)
      and Month(q1.calendardate) = 3

      left outer join
      [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] q2
      on a.investorname=q2.investorname
      and a.ticker=q2.ticker
      and a.securitytype=q2.securitytype
      and year(a.calendardate)=year(q2.calendardate)
      and Month(q2.calendardate) = 6

      left outer join
      [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] q3
      on a.investorname=q3.investorname
      and a.ticker=q3.ticker
      and a.securitytype=q3.securitytype
      and year(a.calendardate)=year(q3.calendardate)
      and Month(q3.calendardate) = 9

      left outer join
      [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] q4
      on a.investorname=q4.investorname
      and a.ticker=q4.ticker
      and a.securitytype=q4.securitytype
      and year(a.calendardate)=year(q4.calendardate)
      and Month(q4.calendardate) = 12

      left outer join
      [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] q4_prev
      on a.investorname=q4_prev.investorname
      and a.ticker=q4_prev.ticker
      and a.securitytype=q4_prev.securitytype
      and year(q4_prev.calendardate) = year(dateadd(YEAR,-1,a.calendardate))
      and Month(q4_prev.calendardate) = 12

      where year(a.calendardate) >=2019
      and a.ticker ='REED'
      and a.securitytype='SHR') investor_stats
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: calendar_year {
    type: number
    sql: ${TABLE}.CALENDAR_YEAR ;;
  }

  dimension: investorname {
    type: string
    sql: ${TABLE}.investorname ;;
  }

  dimension: invstor_in_q1 {
    type: string
    sql: ${TABLE}.INVSTOR_IN_Q1 ;;
  }

  dimension: sold_out_in_q1 {
    type: string
    sql: ${TABLE}.SOLD_OUT_IN_Q1 ;;
  }

  dimension: q1_status {
    type: string
    sql: ${TABLE}.Q1_STATUS ;;
  }

  dimension: q1_quater {
    type: string
    sql: ${TABLE}.Q1_Quater ;;
  }

  dimension: q1_num_shrs {
    type: number
    sql: ${TABLE}.Q1_Num_SHRS ;;
  }

  dimension: q1_unit_price {
    type: number
    sql: ${TABLE}.Q1_Unit_Price ;;
  }

  dimension: q1_total_value {
    type: number
    sql: ${TABLE}.Q1_Total_Value ;;
  }

  dimension: q1_share_diff {
    type: number
    sql: ${TABLE}.Q1_Share_Diff ;;
  }

  dimension: q1_price_diff {
    type: number
    sql: ${TABLE}.Q1_Price_Diff ;;
  }

  dimension: q1_value_diff {
    type: number
    sql: ${TABLE}.Q1_value_Diff ;;
  }

  dimension: invstor_in_q2 {
    type: string
    sql: ${TABLE}.INVSTOR_IN_Q2 ;;
  }

  dimension: sold_out_in_q2 {
    type: string
    sql: ${TABLE}.SOLD_OUT_IN_Q2 ;;
  }

  dimension: q2_status {
    type: string
    sql: ${TABLE}.Q2_STATUS ;;
  }

  dimension: q2_quater {
    type: string
    sql: ${TABLE}.Q2_Quater ;;
  }

  dimension: q2_num_shrs {
    type: number
    sql: ${TABLE}.Q2_Num_SHRS ;;
  }

  dimension: q2_unit_price {
    type: number
    sql: ${TABLE}.Q2_Unit_Price ;;
  }

  dimension: q2_total_value {
    type: number
    sql: ${TABLE}.Q2_Total_Value ;;
  }

  dimension: q2_share_diff {
    type: number
    sql: ${TABLE}.Q2_Share_Diff ;;
  }

  dimension: q2_price_diff {
    type: number
    sql: ${TABLE}.Q2_Price_Diff ;;
  }

  dimension: q2_value_diff {
    type: number
    sql: ${TABLE}.Q2_value_Diff ;;
  }

  dimension: invstor_in_q3 {
    type: string
    sql: ${TABLE}.INVSTOR_IN_Q3 ;;
  }

  dimension: sold_out_in_q3 {
    type: string
    sql: ${TABLE}.SOLD_OUT_IN_Q3 ;;
  }

  dimension: q3_status {
    type: string
    sql: ${TABLE}.Q3_STATUS ;;
  }

  dimension: q3_quater {
    type: string
    sql: ${TABLE}.Q3_Quater ;;
  }

  dimension: q3_num_shrs {
    type: number
    sql: ${TABLE}.Q3_Num_SHRS ;;
  }

  dimension: q3_unit_price {
    type: number
    sql: ${TABLE}.Q3_Unit_Price ;;
  }

  dimension: q3_total_value {
    type: number
    sql: ${TABLE}.Q3_Total_Value ;;
  }

  dimension: q3_share_diff {
    type: number
    sql: ${TABLE}.Q3_Share_Diff ;;
  }

  dimension: q3_price_diff {
    type: number
    sql: ${TABLE}.Q3_Price_Diff ;;
  }

  dimension: q3_value_diff {
    type: number
    sql: ${TABLE}.Q3_value_Diff ;;
  }

  dimension: invstor_in_q4 {
    type: string
    sql: ${TABLE}.INVSTOR_IN_Q4 ;;
  }

  dimension: sold_out_in_q4 {
    type: string
    sql: ${TABLE}.SOLD_OUT_IN_Q4 ;;
  }

  dimension: q4_status {
    type: string
    sql: ${TABLE}.Q4_STATUS ;;
  }

  dimension: q4_quater {
    type: string
    sql: ${TABLE}.Q4_Quater ;;
  }

  dimension: q4_num_shrs {
    type: number
    sql: ${TABLE}.Q4_Num_SHRS ;;
  }

  dimension: q4_unit_price {
    type: number
    sql: ${TABLE}.Q4_Unit_Price ;;
  }

  dimension: q4_total_value {
    type: number
    sql: ${TABLE}.Q4_Total_Value ;;
  }

  dimension: q4_share_diff {
    type: number
    sql: ${TABLE}.Q4_Share_Diff ;;
  }

  dimension: q4_price_diff {
    type: number
    sql: ${TABLE}.Q4_Price_Diff ;;
  }

  dimension: q4_value_diff {
    type: number
    sql: ${TABLE}.Q4_value_Diff ;;
  }

  dimension: prev_year_q4_investorname {
    type: string
    sql: ${TABLE}.prev_year_q4_investorname ;;
  }

  dimension_group: prev_year_q4_calendardate {
    type: time
    sql: ${TABLE}.prev_year_q4_calendardate ;;
  }

  measure: investnme {
    type: string
    sql: ${TABLE}.investorname ;;
  }

  set: detail {
    fields: [
      calendar_year,
      investorname,
      invstor_in_q1,
      sold_out_in_q1,
      q1_status,
      q1_quater,
      q1_num_shrs,
      q1_unit_price,
      q1_total_value,
      q1_share_diff,
      q1_price_diff,
      q1_value_diff,
      invstor_in_q2,
      sold_out_in_q2,
      q2_status,
      q2_quater,
      q2_num_shrs,
      q2_unit_price,
      q2_total_value,
      q2_share_diff,
      q2_price_diff,
      q2_value_diff,
      invstor_in_q3,
      sold_out_in_q3,
      q3_status,
      q3_quater,
      q3_num_shrs,
      q3_unit_price,
      q3_total_value,
      q3_share_diff,
      q3_price_diff,
      q3_value_diff,
      invstor_in_q4,
      sold_out_in_q4,
      q4_status,
      q4_quater,
      q4_num_shrs,
      q4_unit_price,
      q4_total_value,
      q4_share_diff,
      q4_price_diff,
      q4_value_diff,
      prev_year_q4_investorname,
      prev_year_q4_calendardate_time
    ]
  }
}
