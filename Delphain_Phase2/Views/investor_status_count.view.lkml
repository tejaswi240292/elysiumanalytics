view: investor_status_count {
  derived_table: {
    sql: select Investorname,Q_Quater,Q_STATUS,sum(Q_Num_SHRS) as total_num_shares,sum(Q_Total_Value) as total_share_value,abs(SUM(Q_Share_Diff)) AS Num_shr,abs(SUM(Q_value_Diff)) AS net_shr_value ,count(*) as total_investors
      from

      (select distinct  case when q4_prev.investorname is not null and q1.investorname is null then q4_prev.investorname else q1.investorname end as Investorname,
               case when q4_prev.investorname is null and q1.investorname is not null then 'NEWLY BOUGHT'
                   when q4_prev.investorname is not null and q1.investorname is null then 'SOLD OUT'
                   when q1.units - q4_prev.units > 0 then 'INCREASED'
                   when q1.units - q4_prev.units < 0 then 'REDUCED'
                   when q1.units - q4_prev.units = 0 then 'NO-CHANGE'
                 end                                                           as Q_STATUS
                 ,cast(year(a.calendardate)as varchar(5))+'~'+'Q1'             as Q_Quater
                ,q1.units                                                      as Q_Num_SHRS
                ,q1.price                                                      as Q_Unit_Price
                ,q1.value                                                      as Q_Total_Value
                ,q1.units - q4_prev.units                                      as Q_Share_Diff
                ,q1.price - q4_prev.price                                      as Q_Price_Diff
                ,q1.value - q4_prev.value                                      as Q_value_Diff

      from [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData]  a

      left outer join
      [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] q1
      on a.investorname=q1.investorname
      and a.ticker=q1.ticker
      and a.securitytype=q1.securitytype
      and year(a.calendardate)=year(q1.calendardate)
      and Month(q1.calendardate) = 3

      left outer join
      [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData] q4_prev
      on a.investorname=q4_prev.investorname
      and a.ticker=q4_prev.ticker
      and a.securitytype=q4_prev.securitytype
      and year(q4_prev.calendardate) = year(dateadd(YEAR,-1,a.calendardate))
      and Month(q4_prev.calendardate) = 12

      where year(a.calendardate) >=2019
      and a.ticker ='REED'
      and a.securitytype='SHR'

      union all

      select case when q1.investorname is not null and q2.investorname is null then q1.investorname else q2.investorname  end as Investorname,
      case when q1.investorname is null and q2.investorname is not null  then 'NEWLY BOUGHT'
                  when q1.investorname is not null and q2.investorname is null then 'SOLD OUT'
                    when q2.units - q1.units > 0                                 then 'INCREASED'
                 when q2.units - q1.units < 0                                 then 'REDUCED'
                 when q2.units - q1.units = 0                                 then 'NO-CHANGE'
           end                                                           as Q_STATUS
           ,cast(year(a.calendardate)as varchar(5))+'~'+'Q2'             as Q_Quater
           ,q2.units                                                     as Q_Num_SHRS
           ,q2.price                                                     as Q_Unit_Price
           ,q2.value                                                     as Q_Total_Value
           ,q2.units - q1.units                                          as Q_Share_Diff
           ,q2.price - q1.price                                          as Q_Price_Diff
           ,q2.value - q1.value                                          as Q_value_Diff

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


      where year(a.calendardate) >=2019
      and a.ticker ='REED'
      and a.securitytype='SHR'

      union all

      select case when q2.investorname is not null and q3.investorname is null then q2.investorname else q3.investorname  end as Investorname,
             case when q2.investorname is null and q3.investorname is not null then 'NEWLY BOUGHT'
                 when q2.investorname is not null and q3.investorname is null then 'SOLD OUT'
                   when q3.units - q2.units > 0                                 then 'INCREASED'
                 when q3.units - q2.units < 0                                 then 'REDUCED'
                 when q3.units - q2.units = 0                                 then 'NO-CHANGE'
           end                                                            as Q_STATUS
           ,cast(year(a.calendardate)as varchar(5))+'~'+'Q3'             as Q_Quater
           ,q3.units                                                      as Q_Num_SHRS
           ,q3.price                                                      as Q_Unit_Price
           ,q3.value                                                      as Q_Total_Value
           ,q3.units - q2.units                                           as Q_Share_Diff
           ,q3.price - q2.price                                           as Q_Price_Diff
           ,q3.value - q2.value                                           as Q_value_Diff

      from [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData]  a


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

      where year(a.calendardate) >=2019
      and a.ticker ='REED'
      and a.securitytype='SHR'

      union all

      select distinct   case when q3.investorname is not null and q4.investorname is null then q3.investorname else q4.investorname  end as Investorname,
             case when q3.investorname is null and q4.investorname is not null then 'NEWLY BOUGHT'
                 when q3.investorname is not null and q4.investorname is null then 'SOLD OUT'
                   when q4.units - q3.units > 0                                 then 'INCREASED'
                 when q4.units - q3.units < 0                                 then 'REDUCED'
                 when q4.units - q3.units = 0                                 then 'NO-CHANGE'
           end                                                           as Q_STATUS
           ,cast(year(a.calendardate)as varchar(5))+'~'+'Q4'             as Q_Quater
           ,q4.units                                                     as Q_Num_SHRS
           ,q4.price                                                     as Q_Unit_Price
           ,q4.value                                                     as Q_Total_Value
           ,q4.units - q3.units                                          as Q_Share_Diff
           ,q4.price - q3.price                                          as Q_Price_Diff
           ,q4.value - q3.value                                          as Q_value_Diff

      from [Key_Fundamentals].[dbo].[CoreUSInstitutionalInvestorsData]  a


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

      where year(a.calendardate) >=2019
      and a.ticker ='REED'
      and a.securitytype='SHR') Inv_Stat
      where Q_STATUS is not null
      group by Investorname,Q_Quater,Q_STATUS
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: investorname {
    type: string
    sql: ${TABLE}.Investorname ;;
  }

  dimension: q_quater {
    type: string
    sql: ${TABLE}.Q_Quater ;;
  }

  dimension: q_status {
    type: string
    sql: ${TABLE}.Q_STATUS ;;
  }

  dimension: total_num_shares {
    type: number
    sql: ${TABLE}.total_num_shares ;;
  }

  dimension: total_share_value {
    type: number
    sql: ${TABLE}.total_share_value ;;
  }

  dimension: num_shr {
    type: number
    sql: ${TABLE}.Num_shr ;;
  }

  dimension: net_shr_value {
    type: number
    sql: ${TABLE}.net_shr_value ;;
  }

  dimension: total_investors {
    type: number
    sql: ${TABLE}.total_investors ;;
  }

  measure: q_stat {
    type: string
    sql: ${TABLE}.Q_STATUS ;;
  }

  set: detail {
    fields: [
      investorname,
      q_quater,
      q_status,
      total_num_shares,
      total_share_value,
      num_shr,
      net_shr_value,
      total_investors
    ]
  }
}
