view: stock_symbl {
  derived_table: {
    sql: select * from Stock_Symbols
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: symbol_id {
    type: number
    sql: ${TABLE}.Symbol_Id ;;
  }

  dimension: company_name {
    type: string
    label: "Company Name"
    sql: ${TABLE}."Company Name" ;;
  }

  dimension: stock_symbol {
    type: string
    label: "Stock Symbol"
    sql: ${TABLE}."Stock Symbol" ;;
  }

  dimension: dpm {
    type: string
    sql: ${TABLE}.DPM ;;
  }

  dimension: cycle {
    type: string
    sql: ${TABLE}.Cycle ;;
  }

  dimension: traded_at_c2 {
    type: string
    label: "Traded at C2"
    sql: ${TABLE}."Traded at C2" ;;
  }

  dimension: leaps_2015 {
    type: string
    label: "LEAPS 2015"
    sql: ${TABLE}."LEAPS 2015" ;;
  }

  dimension: leaps_2016 {
    type: string
    label: "LEAPS 2016"
    sql: ${TABLE}."LEAPS 2016" ;;
  }

  dimension: leaps_2017 {
    type: string
    label: "LEAPS 2017"
    sql: ${TABLE}."LEAPS 2017" ;;
  }

  dimension: product_types {
    type: string
    label: "Product Types"
    sql: ${TABLE}."Product Types" ;;
  }

  dimension: frequency {
    type: string
    sql: ${TABLE}.Frequency ;;
  }

  dimension: earning {
    type: string
    sql: ${TABLE}.Earning ;;
  }

  dimension: spx {
    type: string
    sql: ${TABLE}.SPX ;;
  }

  dimension: ndx {
    type: string
    sql: ${TABLE}.NDX ;;
  }

  dimension: rut {
    type: string
    sql: ${TABLE}.RUT ;;
  }

  dimension: djx {
    type: string
    sql: ${TABLE}.DJX ;;
  }

  dimension: sector {
    type: string
    sql: ${TABLE}.Sector ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.Industry ;;
  }

  dimension: ipo_date {
    type: date
    sql: ${TABLE}.IPO_DATE ;;
  }

  dimension: options_date {
    type: date
    sql: ${TABLE}.Options_DATE ;;
  }

  dimension: asset_type {
    type: string
    sql: ${TABLE}.AssetType ;;
  }

  dimension: asset_type1 {
    type: string
    sql: ${TABLE}.AssetType1 ;;
  }

  dimension: acq_date {
    type: date
    sql: ${TABLE}.Acq_date ;;
  }

  dimension: is_active {
    type: string
    sql: ${TABLE}.IsActive ;;
  }

  set: detail {
    fields: [
      symbol_id,
      company_name,
      stock_symbol,
      dpm,
      cycle,
      traded_at_c2,
      leaps_2015,
      leaps_2016,
      leaps_2017,
      product_types,
      frequency,
      earning,
      spx,
      ndx,
      rut,
      djx,
      sector,
      industry,
      ipo_date,
      options_date,
      asset_type,
      asset_type1,
      acq_date,
      is_active
    ]
  }
}
