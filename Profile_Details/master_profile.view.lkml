view: master_profile {
  derived_table: {
    sql: SELECT [Company Name] Name,
      Comp_desc [desc],
      address_line_1 [addr1],
      address_line_2 [addr2],
      city+','+ State_Code+','+country_Code+','+Post_code as addr3,
      (select marketshare from [dbo].[Get_USD_vals] (CP.Ticker,{%parameter date%}))  AS Marketshare,
       Phone_nbr [phone],
       fax_nbr [fax],
       Email,
       Comp_url,
       --@Beta AS beta,
       emp_cnt,
       market_val,
       tot_revenue_f0 [totalrevenue],
       shares_out,
       [eps_act_fr0],
       [eps_mean_est_fr1],
       [eps_mean_est_fr2],
       [per_end_month_nbr]as financial_year_end,
       [per_end_date_fr1]as year_ending_fr0 ,
       [per_end_date_fr1] year_ending_fr1,
       [per_end_date_fr2] year_ending_fr2 ,
       iad,
       sic_4_code+'-'+sic_4_desc as SIC_CODE,
       sic_4_desc,
       net_income_f0 [Netincome],
       held_By_insiders_pct,
       held_By_institutions_Pct,
       free_float,
       cp.zacks_x_sector_desc Sector,
       CP.zacks_m_ind_desc Industry

       FROM tbl_ZACKS_CP CP
       INNER JOIN Stock_Symbols SS
       ON CP.ticker=SS.[stock Symbol]
       WHERE {% condition Symbol %} ticker {% endcondition %}
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: date {
    type: date
  }

  filter: Symbol {
    type: string
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: desc {
    type: string
    sql: ${TABLE}."desc" ;;
  }

  dimension: addr1 {
    type: string
    sql: ${TABLE}.addr1 ;;
  }

  dimension: addr2 {
    type: string
    sql: ${TABLE}.addr2 ;;
  }

  dimension: addr3 {
    type: string
    sql: ${TABLE}.addr3 ;;
  }
  dimension: Marketshare {
    type: number
    sql: ${TABLE}.Marketshare ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }

  dimension: comp_url {
    type: string
    sql: ${TABLE}.Comp_url ;;
  }

  dimension: emp_cnt {
    type: string
    sql: ${TABLE}.emp_cnt ;;
  }

  dimension: market_val {
    type: string
    sql: ${TABLE}.market_val ;;
  }

  dimension: totalrevenue {
    type: string
    sql: ${TABLE}.totalrevenue ;;
  }

  dimension: shares_out {
    type: string
    sql: ${TABLE}.shares_out ;;
  }

  dimension: eps_act_fr0 {
    type: string
    sql: ${TABLE}.eps_act_fr0 ;;
  }

  dimension: eps_mean_est_fr1 {
    type: string
    sql: ${TABLE}.eps_mean_est_fr1 ;;
  }

  dimension: eps_mean_est_fr2 {
    type: string
    sql: ${TABLE}.eps_mean_est_fr2 ;;
  }

  dimension: financial_year_end {
    type: string
    sql: ${TABLE}.financial_year_end ;;
  }

  dimension: year_ending_fr0 {
    type: string
    sql: ${TABLE}.year_ending_fr0 ;;
  }

  dimension: year_ending_fr1 {
    type: string
    sql: ${TABLE}.year_ending_fr1 ;;
  }

  dimension: year_ending_fr2 {
    type: string
    sql: ${TABLE}.year_ending_fr2 ;;
  }

  dimension: iad {
    type: string
    sql: ${TABLE}.iad ;;
  }

  dimension: sic_code {
    type: string
    sql: ${TABLE}.SIC_CODE ;;
  }

  dimension: sic_4_desc {
    type: string
    sql: ${TABLE}.sic_4_desc ;;
  }

  dimension: netincome {
    type: string
    sql: ${TABLE}.Netincome ;;
  }

  dimension: held_by_insiders_pct {
    type: string
    sql: ${TABLE}.held_By_insiders_pct ;;
  }

  dimension: held_by_institutions_pct {
    type: string
    sql: ${TABLE}.held_By_institutions_Pct ;;
  }

  dimension: free_float {
    type: string
    sql: ${TABLE}.free_float ;;
  }

  dimension: sector {
    type: string
    sql: ${TABLE}.Sector ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.Industry ;;
  }

  set: detail {
    fields: [
      name,
      desc,
      addr1,
      addr2,
      addr3,
      Marketshare,
      phone,
      fax,
      email,
      comp_url,
      emp_cnt,
      market_val,
      totalrevenue,
      shares_out,
      eps_act_fr0,
      eps_mean_est_fr1,
      eps_mean_est_fr2,
      financial_year_end,
      year_ending_fr0,
      year_ending_fr1,
      year_ending_fr2,
      iad,
      sic_code,
      sic_4_desc,
      netincome,
      held_by_insiders_pct,
      held_by_institutions_pct,
      free_float,
      sector,
      industry
    ]
  }
}
