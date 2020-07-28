view: stock_list_master {
  derived_table: {
    sql: select * from Z_tbl_stock_list_Master
      ;;
  }



  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: udsl_id {
    type: number
    sql: ${TABLE}.UDSL_ID ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.User_ID ;;
  }

  dimension: stl_name {
    type: string
    sql: ${TABLE}.STL_Name ;;
  }

  dimension: stl_symbol {
    type: string
    sql: ${TABLE}.STL_Symbol ;;
  }

  dimension: stl_description {
    type: string
    sql: ${TABLE}.STL_Description ;;
  }

  dimension: mode {
    type: string
    sql: ${TABLE}.Mode ;;
  }



  dimension: is_updated {
    type: string
    sql: ${TABLE}.Is_Updated ;;
  }

  dimension_group: cr_date {
    type: time
    sql: ${TABLE}.CrDate ;;
  }

  dimension_group: md_date {
    type: time
    sql: ${TABLE}.MdDate ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.Zone ;;
  }

  set: detail {
    fields: [
      udsl_id,
      user_id,
      stl_name,
      stl_symbol,
      stl_description,
      mode,
      is_updated,
      cr_date_time,
      md_date_time,
      zone
    ]
  }
}
