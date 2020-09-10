view: get_insider_overview {
  derived_table: {
    sql: select  CASE
         WHEN securityadcode='D' THEN  'Derivative'
         WHEN securityadcode='DA' THEN 'Derivative Acquisition'
         WHEN securityadcode='DD' THEN 'Derivative Disposition '
         WHEN securityadcode='N' THEN 'Non-Derivative'
         WHEN securityadcode='NA' THEN 'Non-Derivative Acquisition'
         WHEN securityadcode='ND' THEN 'Non-Derivative Disposition'
    END Securites
,count(*) Totals
from [Key_Fundamentals].[dbo].[InsiderTrading]
where filingdate = '20200603'
group by securityadcode
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: securites {
    type: string
    sql: ${TABLE}.Securites ;;
  }

  dimension: totals {
    type: number
    sql: ${TABLE}.Totals ;;
  }

  set: detail {
    fields: [securites, totals]
  }
}
